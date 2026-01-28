let currentMode = 'master';
let currentServerUrl = 'http://192.168.1.122:5000';
let currentTimeshift = 1.8;
let currentAutoFullscreen = false;

// Load settings on startup
async function loadSettings() {
  const result = await browser.storage.local.get(['mode', 'serverUrl', 'timeshift', 'autoFullscreen']);
  currentMode = result.mode || 'master';
  currentServerUrl = (result.serverUrl || 'http://192.168.1.122:5000').replace(/\/$/, '');
  currentTimeshift = result.timeshift !== undefined ? result.timeshift : 1.8;
  currentAutoFullscreen = result.autoFullscreen !== undefined ? result.autoFullscreen : false;
  console.log(`[YT Sync Background] STATUS: Mode=${currentMode.toUpperCase()}, Server=${currentServerUrl}, Timeshift=${currentTimeshift}s, AutoFS=${currentAutoFullscreen}`);
}

loadSettings();

// Listen for messages
browser.runtime.onMessage.addListener((message, sender, sendResponse) => {
  console.log(`[YT Sync Background] Message received: ${message.type} from ${sender.url || 'popup/internal'}`);

  if (message.type === 'settingsUpdated') {
    currentMode = message.mode;
    currentServerUrl = message.serverUrl.replace(/\/$/, '');
    currentTimeshift = message.timeshift;
    currentAutoFullscreen = message.autoFullscreen;
    console.log(`[YT Sync Background] SETTINGS UPDATED: Mode=${currentMode.toUpperCase()}, Server=${currentServerUrl}, Timeshift=${currentTimeshift}s, AutoFS=${currentAutoFullscreen}`);
    return;
  }

  if (message.type === 'proxyBroadcast') {
    broadcastState(message.state).then(sendResponse);
    return true;
  }

  if (message.type === 'proxyFetchState') {
    fetchState().then(sendResponse);
    return true;
  }

  if (message.type === 'getSettings') {
    sendResponse({
      mode: currentMode,
      serverUrl: currentServerUrl,
      timeshift: currentTimeshift,
      autoFullscreen: currentAutoFullscreen
    });
    return;
  }
});

async function broadcastState(state) {
  try {
    const url = `${currentServerUrl}/state`;
    const response = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(state),
    });
    return { success: response.ok, status: response.status };
  } catch (err) {
    console.error(`[YT Sync Background] Broadcast ERROR to ${currentServerUrl}:`, err.message);
    return { success: false, error: err.message };
  }
}

async function fetchState() {
  try {
    const url = `${currentServerUrl}/state`;
    const response = await fetch(url, {
      method: 'GET',
    });
    if (!response.ok) {
      return { success: false, status: response.status };
    }
    const data = await response.json();
    return { success: true, state: data };
  } catch (err) {
    console.error(`[YT Sync Background] Fetch ERROR from ${currentServerUrl}:`, err.message);
    return { success: false, error: err.message };
  }
}