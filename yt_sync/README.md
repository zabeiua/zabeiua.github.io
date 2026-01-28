# 🎬 YouTube Sync

A Firefox extension to synchronize YouTube playback between multiple devices on a local network. Ideal for watching videos together across a PC (Master) and an Android tablet/phone (Slave).

## 🚀 Features

- **Real-time Synchronization**: Play, pause, and seek actions are mirrored across all connected devices.
- **Auto-Navigation**: When the Master changes the video, the Slave follows automatically.
- **Configurable Timeshift**: Built-in 0-3s slider (default 1.8s) to compensate for network or playback latency on the Slave.
- **Auto-Fullscreen**: Optional setting to automatically enter fullscreen mode on the Slave when a video starts.
- **Mixed Content Support**: Uses a background proxy to safely communicate with local HTTP servers from HTTPS pages.

## 🛠️ Setup Instructions

### 1. Python Server (PC)
The project includes a server script: [yt_sync_server.py](file:///home/i/zabeiua.github.io/my_addon/yt_sync_server.py).

Run it on your Master PC:
```bash
python yt_sync_server.py
```

It will start on `http://0.0.0.0:5000` and display real-time sync status as you watch.

### 2. Browser Extension
#### Building from source
```bash
./build_xpi.sh
```

#### Installation
1. Open Firefox Nightly.
2. Go to `about:addons`.
3. Click the gear icon (⚙️) -> **Install Add-on From File...**.
4. Select `yt_sync.xpi`.

## 📖 Usage

1. **Master Device (PC)**:
   - Open the extension popup.
   - Select **Master**.
   - Ensure the server IP matches your PC's local IP.
   - Click **Save**.

2. **Slave Device (Android/Tablet)**:
   - Open the extension popup.
   - Select **Slave**.
   - Enter your Master PC's IP address.
   - Adjust the **Timeshift** slider (1.8s is recommended for mobile).
   - Enable **Auto-Fullscreen** if desired.
   - Click **Save**.

3. **Syncing**:
   - Open a YouTube video on the Master.
   - The Slave will automatically redirect and follow your playback state!

---
> [!TIP]
> On Android, if the video doesn't play automatically due to browser restrictions, the extension will attempt to play it **muted**. Simply tap the volume icon to hear the audio.
