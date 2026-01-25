console.log('[YT Sync] Content Script LOADED at ' + window.location.href);

let mode = 'master';
let serverUrl = 'http://192.168.1.122:5000';
let timeshift = 1.8;
let autoFullscreen = false;
let syncInterval = null;
let userInteracting = false;
let lastUpdateAt = 0;

function getVideo() {
  return document.querySelector('video');
}

async function init() {
  // Get current settings from background script
  try {
    const settings = await browser.runtime.sendMessage({ type: 'getSettings' });
    if (settings) {
      mode = settings.mode;
      serverUrl = settings.serverUrl;
      timeshift = settings.timeshift !== undefined ? settings.timeshift : 1.8;
      autoFullscreen = settings.autoFullscreen !== undefined ? settings.autoFullscreen : false;
    }
  } catch (e) {
    console.warn('[YT Sync] Could not get settings from background, using defaults');
  }

  console.log(`[YT Sync] INITIALIZED: Mode=${mode.toUpperCase()}, Server=${serverUrl}, Shift=${timeshift}s, AutoFS=${autoFullscreen}`);

  if (mode === 'master') {
    startMasterMode();
  } else if (mode === 'slave') {
    startSlaveMode();
    checkFullscreenPending();
  }
}

async function checkFullscreenPending() {
  if (sessionStorage.getItem('yt-sync-fullscreen-pending') === 'true') {
    console.log('[YT Sync] Slave: Fullscreen pending, waiting for video...');
    sessionStorage.removeItem('yt-sync-fullscreen-pending');

    // Attempt fullscreen several times as YT player loads
    let attempts = 0;
    const fsInterval = setInterval(() => {
      attempts++;
      const v = getVideo();
      if (v) {
        console.log('[YT Sync] Slave: Executing auto-fullscreen');
        enterFullscreen(v);
        clearInterval(fsInterval);
      }
      if (attempts > 10) clearInterval(fsInterval);
    }, 1000);
  }
}

function enterFullscreen(v) {
  // Option 1: Native requestFullscreen (often blocked on mobile without gesture)
  try {
    if (v.requestFullscreen) v.requestFullscreen();
    else if (v.webkitRequestFullscreen) v.webkitRequestFullscreen();
    else if (v.mozRequestFullScreen) v.mozRequestFullScreen();
    else if (v.msRequestFullscreen) v.msRequestFullscreen();
  } catch (e) {
    console.warn('[YT Sync] Native fullscreen failed:', e.message);
  }

  // Option 2: Try clicking the YouTube fullscreen button (sometimes more reliable)
  const fsBtn = document.querySelector('.ytp-fullscreen-button');
  if (fsBtn && !document.fullscreenElement) {
    fsBtn.click();
  }
}

// ===== MASTER MODE =====
function startMasterMode() {
  console.log('[YT Sync] 📡 MASTER ACTIVE: Broadcasting every 2s');
  syncInterval = setInterval(broadcastState, 2000);

  const events = ['play', 'pause', 'seeked'];
  events.forEach(name => {
    document.addEventListener(name, (e) => {
      if (e.target.tagName === 'VIDEO') {
        broadcastState();
      }
    }, true);
  });
}

async function broadcastState() {
  const v = getVideo();
  if (!v) return;

  const videoId = new URLSearchParams(window.location.search).get('v');
  if (!videoId) return;

  const state = {
    videoId: videoId,
    timestamp: v.currentTime,
    playing: !v.paused,
    updatedAt: Date.now()
  };

  browser.runtime.sendMessage({ type: 'proxyBroadcast', state });
}

// ===== SLAVE MODE =====
function startSlaveMode() {
  console.log('[YT Sync] 📱 SLAVE ACTIVE: Monitoring master state...');

  document.addEventListener('seeking', (e) => {
    if (e.target.tagName === 'VIDEO') {
      userInteracting = true;
      console.log('[YT Sync] Slave: User seeking, sync paused');
    }
  }, true);

  document.addEventListener('seeked', (e) => {
    if (e.target.tagName === 'VIDEO') {
      setTimeout(() => {
        userInteracting = false;
        console.log('[YT Sync] Slave: Sync resumed');
      }, 3000);
    }
  }, true);

  syncInterval = setInterval(fetchAndApplyState, 2000);

  // Initial check (immediate)
  setTimeout(fetchAndApplyState, 1000);
}

async function forcePlay(v) {
  try {
    await v.play();
    console.log('[YT Sync] Slave: Autoplay success');
  } catch (err) {
    console.warn('[YT Sync] Slave: Autoplay blocked/failed, retrying muted...', err.message);
    // Fallback: many mobile browsers allow autoplay ONLY if muted
    v.muted = true;
    try {
      await v.play();
      console.log('[YT Sync] Slave: Muted autoplay success');
    } catch (err2) {
      console.error('[YT Sync] Slave: Total autoplay failure', err2.message);
    }
  }
}

async function fetchAndApplyState() {
  if (userInteracting) return;

  const v = getVideo();
  if (!v) return;

  try {
    const result = await browser.runtime.sendMessage({ type: 'proxyFetchState' });
    if (!result || !result.success) return;

    const state = result.state;
    if (!state || !state.videoId) return;

    // Prevent applying old states
    if (state.updatedAt <= lastUpdateAt) return;
    lastUpdateAt = state.updatedAt;

    const urlParams = new URLSearchParams(window.location.search);
    const currentVideoId = urlParams.get('v');

    if (state.videoId !== currentVideoId) {
      console.log(`[YT Sync] Slave: Redirecting to ${state.videoId}`);
      if (autoFullscreen) {
        sessionStorage.setItem('yt-sync-fullscreen-pending', 'true');
      }
      window.location.href = `https://www.youtube.com/watch?v=${state.videoId}&t=${Math.floor(state.timestamp)}s`;
      return;
    }

    // Time Sync
    const targetTime = state.timestamp + timeshift;
    const timeDiff = Math.abs(v.currentTime - targetTime);

    if (timeDiff > 3) {
      console.log(`[YT Sync] Slave: Jumping ${v.currentTime.toFixed(1)}s → ${targetTime.toFixed(1)}s`);
      v.currentTime = targetTime;
    }

    // Play/Pause Sync
    if (state.playing && v.paused) {
      console.log('[YT Sync] Slave: Sync-Play triggered');
      forcePlay(v);
    } else if (!state.playing && !v.paused) {
      console.log('[YT Sync] Slave: Sync-Pause triggered');
      v.pause();
    }

  } catch (err) {
    console.error('[YT Sync] Slave: Messaging error', err.message);
  }
}

window.addEventListener('beforeunload', () => {
  if (syncInterval) clearInterval(syncInterval);
});

init();