// function setTheme(themeName) {
//   document.documentElement.setAttribute("data-theme", themeName);
//   localStorage.setItem("theme", themeName); // remember user's choice
// }

// // On page load, restore saved preference
// const savedTheme = localStorage.getItem("theme") || "default";
// setTheme(savedTheme);

// // Wire to your existing toggle button
// contrastPanel.addEventListener("click", () => {
//   const isOn = contrastPanel.getAttribute("aria-pressed") === "true";
//   const newOn = !isOn;
//   contrastPanel.setAttribute("aria-pressed", newOn);
//   setTheme(newOn ? "contrast" : "default");
// });
