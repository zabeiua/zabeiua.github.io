# T-Hunter Search Bridge (Firefox)

A Firefox extension that connects your movie browsing experience directly to your local **T-Hunter** app. It adds search triggers to movie and series pages on Google, IMDb, Trakt.tv, and Kinopoisk.

## Features

### 🔍 Search Everywhere
- **Google Search**: Integrates directly into the "Watch" options panel or via a Floating Action Button (FAB) for mobile/minimal results.
- **Kinopoisk & Kinopoisk HD**: 
    - **Interactive Titles**: Main titles (H1) on standard pages are now clickable.
    - **Logo Search**: Large movie logos on HD pages are clickable and feature a responsive **blue glow** on hover.
    - **Continuous Detection**: Handles highly dynamic SPA-like navigation on Kinopoisk.
- **IMDb & Trakt.tv**: Adds a sleek T-Hunter icon next to the main title.

### 🛠 Technical Enhancements
- **Background Bridge**: Uses a high-privilege background script proxy to bypass strict **Content Security Policies (CSP)** on sites like Kinopoisk, ensuring reliable connection to your local server.
- **Intelligent Title Cleaning**: Automatically strips years, "Смотреть фильм", "Смотреть сериал", and other filler words to provide the cleanest search query to T-Hunter.
- **Local Integration**: Connects to the T-Hunter app via a local HTTP server on port `14141`.

## Installation

### Local Loading (Manual)
1. Clone or download this repository.
2. Open Firefox and go to `about:debugging#/runtime/this-firefox`.
3. Click **"Load Temporary Add-on"**.
4. Select the `manifest.json` file from this directory.

## Requirements
- **Firefox Browser**
- **T-Hunter App**: Must be running on your system with the local server enabled (default port 14141).

## File Structure
```
t-hunter-bridge/
├── manifest.json        # Extension settings and permissions
├── content.js           # UI injection and title extraction logic
├── background.js        # CSP bridge and local server communication
├── options.html         # Settings page
├── options.js           # Settings logic
└── icons/
    └── thunter.png      # T-Hunter branding icon
```

## Usage
1. Open a movie or series page on any supported site (e.g., [IMDb](https://www.imdb.com) or [Kinopoisk](https://www.kinopoisk.ru)).
2. Look for the T-Hunter icon or click the movie title/logo directly.
3. The **T-Hunter app** will instantly populate its search bar and start hunting for results.
