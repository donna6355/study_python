function setTheme(themeName) {
  document.documentElement.setAttribute("data-theme", themeName);
  localStorage.setItem("theme", themeName); // remember user's choice
}

function setRootFontSize(size) {
  document.documentElement.style.fontSize = `${size}px`;
  localStorage.setItem("fontSize", size); // remember user's choice
}

const savedTheme = localStorage.getItem("theme") || "default";
const savedSize = localStorage.getItem("fontSize") || 16;
setTheme(savedTheme);
setRootFontSize(savedSize);
