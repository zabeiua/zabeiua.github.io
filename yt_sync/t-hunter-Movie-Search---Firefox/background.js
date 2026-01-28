console.log("T-Hunter Search Bridge background script loaded.");

browser.runtime.onMessage.addListener((message, sender, sendResponse) => {
    if (message.action === "SEARCH_REQUEST") {
        const url = `http://localhost:14141/search?q=${encodeURIComponent(message.query)}`;
        console.log("T-Hunter Background: Fetching", url);

        fetch(url)
            .then(response => {
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                return response.json();
            })
            .then(data => {
                console.log("T-Hunter Background: Success", data);
                sendResponse({ success: true, data });
            })
            .catch(err => {
                console.error("T-Hunter Background: Error", err);
                sendResponse({ success: false, error: err.message });
            });

        return true; // Keep the message channel open for async sendResponse
    }
});