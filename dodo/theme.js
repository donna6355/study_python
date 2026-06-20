function setTheme(themeName) {
  document.documentElement.setAttribute("data-theme", themeName);
  localStorage.setItem("theme", themeName); // remember user's choice
}

function setRootFontSize(size) {
  document.documentElement.style.fontSize = `${size}px`;
  localStorage.setItem("fontSize", size); // remember user's choice
}

function setVoiceMode(isOn) {
  localStorage.setItem("voiceMode", isOn);
  speak(isOn ? "음성 알림 모드를 시작합니다." : "음성 알림 모드가 종료됩니다.");
}

function speak(text) {
  if (!("speechSynthesis" in window)) return; // 지원하지 않는 브라우저는 조용히 무시

  // 이전에 말하던 중이면 취소하고 새 문장으로 교체 (겹쳐 말하기 방지)
  window.speechSynthesis.cancel();

  const utterance = new SpeechSynthesisUtterance(text);
  utterance.lang = "ko-KR";
  utterance.rate = 1.2; // 말하는 속도 (0.1 ~ 10, 기본 1)
  utterance.pitch = 1; // 음높이 (0 ~ 2, 기본 1)

  window.speechSynthesis.speak(utterance);
}

const savedTheme = localStorage.getItem("theme") || "default";
const savedSize = localStorage.getItem("fontSize") || 16;
const voiceMode = localStorage.getItem("voiceMode") || "false";
setTheme(savedTheme);
setRootFontSize(savedSize);
