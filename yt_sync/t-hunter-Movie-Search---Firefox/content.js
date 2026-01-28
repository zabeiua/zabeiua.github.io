const isFirefox = typeof browser !== "undefined";
const STREMIO_IMG = isFirefox ? browser.runtime.getURL("icons/thunter.png") : chrome.runtime.getURL("icons/thunter.png");

// Inject styles
const style = document.createElement('style');
style.textContent = `
.thunter-cta__href {
    color: currentColor;
    text-decoration: none;
}
.thunter-cta__container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    cursor: pointer;
}
.thunter-cta__container > div:nth-child(2) {
    color: currentColor;
    font-size: 14px;
    letter-spacing: .2px;
    line-height: 20px;
    margin-top: 4px;
    text-align: center;
}
.thunter-cta__container div:nth-child(3) {
    font-family: Arial, sans-serif;
    font-size: 11px;
    line-height: 16px;
    letter-spacing: 0;
    font-style: italic;
    color: #9e9e9e;
    text-decoration: none;
    text-align: center;
}
#thunter-floating-btn {
    position: fixed;
    z-index: 10000;
    bottom: 20px;
    right: 0;
    padding: 0.5em;
    height: 50px;
    width: 50px;
    border-radius: 100%;
    background-color: #c7d3ff;
    margin: 1em;
    border: 2px solid #5d5dff;
    cursor: pointer;
    display: grid;
    place-items: center;
    transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
    box-shadow: 0 4px 8px rgba(0,0,0,0.3);
}
.thunter-fab-hidden {
    transform: translateY(100px);
    opacity: 0;
    pointer-events: none;
}
/* Kinopoisk Logo Enhancement */
.thunter-clickable-logo {
    cursor: pointer !important;
    transition: filter 0.3s ease, transform 0.2s ease !important;
}
.thunter-clickable-logo:hover {
    filter: drop-shadow(0 0 8px #5d5dff) !important;
    transform: scale(1.02) !important;
}
`;
document.head.appendChild(style);

const cleanTitle = (title) => {
  return title
    .replace(/^Смотреть\s+(фильм|сериал)?\s*/i, '')
    .replace(/\s*\(.*?\)/g, '') // Remove parentheses and their content
    .split(',')[0] // Remove year if it's "Title, 2025"
    .trim();
};

const sendSearchRequest = (title) => {
  const searchTitle = cleanTitle(title);
  console.log("T-Hunter: Sending search request for", searchTitle);

  browser.runtime.sendMessage({
    action: "SEARCH_REQUEST",
    query: searchTitle
  }).then(response => {
    if (response.success) {
      console.log("T-Hunter: Search request successful", response.data);
    } else {
      console.error("T-Hunter: Search request failed", response.error);
      alert("T-Hunter app not found or server not running on localhost:14141");
    }
  }).catch(err => {
    console.error("T-Hunter: Error sending message", err);
    alert("Extension error: Failed to communicate with background script");
  });
};

const addFabThunter = (title) => {
  if (document.getElementById("thunter-floating-btn")) return;
  const fabThunter = document.createElement("div");
  fabThunter.id = "thunter-floating-btn";
  fabThunter.title = `Search "${title}" in T-Hunter`;
  fabThunter.innerHTML = `<img style='width: 35px;height: 35px;' src="${STREMIO_IMG}" />`;
  document.body.appendChild(fabThunter);

  fabThunter.addEventListener("click", () => sendSearchRequest(title));

  let lastScrollY = window.scrollY;
  window.addEventListener("scroll", () => {
    const currentScrollY = window.scrollY;
    if (currentScrollY > lastScrollY && currentScrollY > 100) {
      fabThunter.classList.add("thunter-fab-hidden");
    } else {
      fabThunter.classList.remove("thunter-fab-hidden");
    }
    lastScrollY = currentScrollY;
  });
};

const getImdbCodeFromDom = () => {
  let imdbLink =
    document.querySelector("a[href*='https://www.imdb.com/title']")?.href ||
    document.querySelector("a[href*='https://m.imdb.com/title']")?.href;
  return imdbLink?.match(/title\/(tt\d+)/)?.[1] || null;
};

const addThunterToGoogle = () => {
  const seriesOptions = document.querySelectorAll("div[data-attrid='kc:/tv/tv_program:media_actions_wholepage']");
  const movieOptions = document.querySelectorAll("div[data-attrid='kc:/film/film:media_actions_wholepage']");
  const filmReviewContainer = document.querySelector("div[data-attrid^='kc:/film/film:']");
  const seriesReviewContainer = document.querySelector("div[data-attrid^='kc:/tv/tv_program:']");
  const knowledgePanelTitle = document.querySelector("div[data-attrid='title']");

  let watchOptions = [];
  let titleText = knowledgePanelTitle?.innerText || document.title.split(' - ')[0];

  if (seriesOptions.length !== 0) {
    watchOptions = [...seriesOptions];
  } else if (movieOptions.length !== 0) {
    watchOptions = [...movieOptions];
  }

  if (watchOptions.length === 0 && (filmReviewContainer || seriesReviewContainer)) {
    addFabThunter(titleText);
    return;
  }

  watchOptions.forEach((watchOption) => {
    if (watchOption.querySelector(".thunter-cta__container")) return;

    const container = watchOption.firstElementChild?.firstElementChild;
    if (!container) return;

    let watchNowEle = container.firstElementChild;
    if (container.childElementCount === 2) {
      const divEle = document.createElement("div");
      watchNowEle = container.insertBefore(divEle, watchNowEle);
    }

    const thunterBtn = document.createElement("div");
    thunterBtn.className = "thunter-cta__container";
    thunterBtn.innerHTML = `
            <img style='width: 40px;height: 40px;' src="${STREMIO_IMG}" />
            <div>T-Hunter</div>
            <div>Hunt for Torrents</div>
        `;
    thunterBtn.addEventListener("click", (e) => {
      e.preventDefault();
      e.stopPropagation();
      sendSearchRequest(titleText);
    });

    watchNowEle.innerHTML = '';
    watchNowEle.appendChild(thunterBtn);
  });
};

const addThunterToImdbOrTrakt = () => {
  let titleElement, title;
  if (window.location.hostname.includes("imdb.com")) {
    titleElement = document.querySelector("h1");
    if (titleElement) title = titleElement.innerText.trim();
  } else if (window.location.hostname.includes("trakt.tv")) {
    titleElement = document.querySelector("h1 span.year")?.parentElement;
    if (titleElement) title = titleElement.childNodes[0].textContent.trim();
  }

  if (!titleElement || titleElement.querySelector(".thunter-inline-button")) return;

  const btn = document.createElement("img");
  btn.src = STREMIO_IMG;
  btn.className = "thunter-inline-button";
  btn.style = "width: 24px; height: 24px; margin-left: 10px; cursor: pointer; vertical-align: middle;";
  btn.addEventListener("click", () => sendSearchRequest(title));
  titleElement.appendChild(btn);
};

const addThunterToKinopoisk = () => {
  // Kinopoisk HD uses highly dynamic classes. Standard Kinopoisk uses styles_title...
  const titleElement =
    document.querySelector("h1[class*='styles_title']") ||
    document.querySelector("h1") ||
    document.querySelector("[data-test-id='film-title']") ||
    document.querySelector("[class*='FilmTitle']") ||
    document.querySelector("[class*='FilmMainTitle']") ||
    document.querySelector("[class*='Title_title']") ||
    document.querySelector("[class*='Title_name']");

  if (!titleElement) return;

  const title = cleanTitle(titleElement.innerText);
  if (!title || title.length < 2) return;

  // For Kinopoisk, we want the WHOLE H1 TO BE CLICKABLE if it's not HD
  if (window.location.hostname.includes("www.kinopoisk.ru")) {
    if (titleElement.classList.contains("thunter-clickable-logo")) return;

    titleElement.classList.add("thunter-clickable-logo");
    titleElement.style.display = "inline-block"; // Ensure glow works well
    titleElement.title = `Search "${title}" in T-Hunter`;

    titleElement.addEventListener("click", (e) => {
      console.log("T-Hunter: Standard Kinopoisk Title clicked!", title);
      e.preventDefault();
      e.stopPropagation();
      sendSearchRequest(title);
    }, true);
    return;
  }

  // For Kinopoisk HD, we add the inline button next to H1
  if (titleElement.querySelector(".thunter-inline-button")) return;

  console.log("T-Hunter: Found Kinopoisk HD title element:", title);

  const btn = document.createElement("img");
  btn.src = STREMIO_IMG;
  btn.className = "thunter-inline-button";
  btn.style = "width: 32px; height: 32px; margin-left: 15px; cursor: pointer; vertical-align: middle; filter: drop-shadow(0 2px 4px rgba(0,0,0,0.5));";
  btn.title = `Search "${title}" in T-Hunter`;

  btn.addEventListener("click", (e) => {
    e.preventDefault();
    e.stopPropagation();
    sendSearchRequest(title);
  });

  titleElement.appendChild(btn);
};

const addThunterToKinopoiskLogo = () => {
  // Target title logos/images on Kinopoisk HD
  const logoSelectors = [
    "[class*='Title_logo'] img",
    "[class*='Title_logoImage']",
    "img[class*='FilmLogo']",
    "img[class*='OverviewTitle_image']", // Identified from user outerHTML
    "[class*='Title_logoWrapper'] img",
    ".ott-movie-header__title-logo img"
  ];

  const candidateImages = [];
  logoSelectors.forEach(selector => {
    document.querySelectorAll(selector).forEach(img => candidateImages.push(img));
  });

  // Also look for specific containers that might have the logo as a background or direct child
  document.querySelectorAll("[class*='Title_logo']").forEach(container => {
    const img = container.querySelector("img");
    if (img) candidateImages.push(img);
  });

  candidateImages.forEach(img => {
    if (img.classList.contains("thunter-clickable-logo")) return;

    const title =
      img.getAttribute("alt") ||
      img.getAttribute("title") ||
      img.getAttribute("aria-label") ||
      img.closest("[class*='Title_logo']")?.getAttribute("aria-label");

    if (!title || title.toLowerCase() === "logo" || title.length < 2) return;

    const cleanedTitle = cleanTitle(title);
    img.classList.add("thunter-clickable-logo");
    img.title = `Search "${cleanedTitle}" in T-Hunter`;

    // Add a visual indicator style directly to ensure it works
    img.style.cursor = "pointer";

    img.addEventListener("click", (e) => {
      console.log("T-Hunter: Logo clicked!", cleanedTitle);
      e.preventDefault();
      e.stopPropagation();
      sendSearchRequest(cleanedTitle);
    }, true); // Use capture phase to beat potential site listeners
  });
};

const addThunterToLampa = () => {
  const titleElement = document.querySelector(".full-start-new__title");
  const buttonsContainer = document.querySelector(".full-start-new__buttons");

  if (!titleElement) return;

  const title = titleElement.innerText.trim();
  const yearElement = document.querySelector(".full-start-new__head span");
  const year = yearElement ? yearElement.innerText.trim() : "";
  const fullSearchQuery = year ? `${title} ${year}` : title;

  // 1. Make title clickable
  if (!titleElement.classList.contains("thunter-clickable-logo")) {
    titleElement.classList.add("thunter-clickable-logo");
    titleElement.style.display = "inline-block";
    titleElement.title = `Search "${fullSearchQuery}" in T-Hunter`;
    titleElement.addEventListener("click", (e) => {
      e.preventDefault();
      e.stopPropagation();
      sendSearchRequest(fullSearchQuery);
    }, true);
  }

  // 2. Add Search Button to Action Group
  if (buttonsContainer && !buttonsContainer.querySelector(".button--thunter")) {
    const thunterBtn = document.createElement("div");
    thunterBtn.className = "full-start__button selector button--thunter";
    thunterBtn.innerHTML = `
      <img src="${STREMIO_IMG}" style="width: 22px; height: 22px; margin-right: 10px; vertical-align: middle; filter: drop-shadow(0 0 4px #5d5dff);" />
      <span>T-Hunter</span>
    `;
    thunterBtn.title = `Search "${fullSearchQuery}" in T-Hunter`;
    thunterBtn.addEventListener("click", (e) => {
      e.preventDefault();
      e.stopPropagation();
      sendSearchRequest(fullSearchQuery);
    });
    buttonsContainer.appendChild(thunterBtn);
  }
};

const run = () => {
  const host = window.location.hostname;
  // console.log("T-Hunter: Running check on", host);
  if (host.includes("google.")) {
    addThunterToGoogle();
  } else if (host.includes("imdb.com") || host.includes("trakt.tv")) {
    addThunterToImdbOrTrakt();
  } else if (host.includes("kinopoisk.ru")) {
    addThunterToKinopoisk();
    addThunterToKinopoiskLogo();
  } else if (host.includes("lampa.mx")) {
    addThunterToLampa();
  }
};

// Initial run
console.log("T-Hunter: Extension loaded and active.");
run();

// Aggressive check during first 5 seconds to beat slow dynamic loads
let checkCount = 0;
const aggressiveTimer = setInterval(() => {
  run();
  if (++checkCount > 10) clearInterval(aggressiveTimer);
}, 500);

// Periodic check for dynamic loading (SPA navigation etc)
if (window.location.hostname.includes("kinopoisk.ru") || window.location.hostname.includes("lampa.mx")) {
  setInterval(run, 2000);
}

// Observe changes for SPA-like navigation or dynamic content
const observer = new MutationObserver(debounce(run, 500));
observer.observe(document.documentElement, { childList: true, subtree: true });

function debounce(func, wait) {
  let timeout;
  return function (...args) {
    clearTimeout(timeout);
    timeout = setTimeout(() => func.apply(this, args), wait);
  };
}