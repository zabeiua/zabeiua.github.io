// Load saved settings
browser.storage.local.get(['mode', 'serverUrl', 'timeshift', 'autoFullscreen']).then(result => {
  const mode = result.mode || 'master';
  const serverUrl = result.serverUrl || 'http://192.168.1.122:5000';
  const timeshift = result.timeshift !== undefined ? result.timeshift : 1.8;
  const autoFullscreen = result.autoFullscreen !== undefined ? result.autoFullscreen : false;

  document.querySelector(`input[value="${mode}"]`).checked = true;
  document.getElementById('serverUrl').value = serverUrl;
  document.getElementById('timeshift').value = timeshift;
  document.getElementById('timeshiftVal').textContent = timeshift + 's';
  document.getElementById('autoFullscreen').checked = autoFullscreen;
});

// Update slider value display
document.getElementById('timeshift').addEventListener('input', (e) => {
  document.getElementById('timeshiftVal').textContent = e.target.value + 's';
});

// Save settings
document.getElementById('saveBtn').addEventListener('click', async () => {
  const mode = document.querySelector('input[name="mode"]:checked').value;
  const serverUrl = document.getElementById('serverUrl').value.trim().replace(/\/$/, '');
  const statusEl = document.getElementById('status');

  if (!serverUrl) {
    showStatus('❌ Please enter a server URL', 'info');
    return;
  }

  statusEl.textContent = 'Testing server connection...';
  statusEl.className = 'status info';

  try {
    const response = await fetch(`${serverUrl}/ping`, {
      method: 'GET',
      mode: 'cors'
    });

    if (response.ok) {
      const timeshift = parseFloat(document.getElementById('timeshift').value) || 0;
      const autoFullscreen = document.getElementById('autoFullscreen').checked;

      // Save settings
      await browser.storage.local.set({ mode, serverUrl, timeshift, autoFullscreen });

      // Notify background script
      browser.runtime.sendMessage({ type: 'settingsUpdated', mode, serverUrl, timeshift, autoFullscreen });

      showStatus(`✅ Saved! Refresh YouTube pages to apply.`, 'success');
    } else {
      showStatus('⚠️ Server responded with error. Check address!', 'info');
    }
  } catch (err) {
    showStatus(`❌ Cannot reach server at ${serverUrl}`, 'info');
  }
});

function showStatus(message, type) {
  const statusEl = document.getElementById('status');
  statusEl.textContent = message;
  statusEl.className = 'status ' + type;
}