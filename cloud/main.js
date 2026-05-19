// ─── Firebase SDK import ──────────────────────────────────
import { initializeApp } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-analytics.js";
import { getAuth } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-auth.js";
import { createUserWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-auth.js";
import { signInWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-auth.js";
import { GoogleAuthProvider } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-auth.js";
import { signInWithPopup } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-auth.js";
import { onAuthStateChanged } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-auth.js";
import { signOut } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-auth.js";
import { sendEmailVerification } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-auth.js";
import { sendPasswordResetEmail } from "https://www.gstatic.com/firebasejs/12.13.0/firebase-auth.js";

// ─── Firebase 초기화 ──────────────────────────────────────
const firebaseConfig = {
  apiKey: "AIzaSyC96aJz6wRh-Zb1FYK7T3PCdmrMDzGQs9k",
  authDomain: "dx-diary.firebaseapp.com",
  projectId: "dx-diary",
  storageBucket: "dx-diary.firebasestorage.app",
  messagingSenderId: "517754453674",
  appId: "1:517754453674:web:9b85fb1fe31b9287c21ad3",
  measurementId: "G-NE8P47B8JE",
};

const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);

// 로그인 상태에 따라 화면 자동 분기
onAuthStateChanged(auth, (user) => {
  const loggedOutArea = document.getElementById("logged-out-area");
  const loggedInArea = document.getElementById("logged-in-area");

  if (user) {
    // 로그인 상태
    loggedOutArea.style.display = "none";
    loggedInArea.style.display = "block";

    // 사용자 정보 표시
    document.getElementById("user-name").textContent =
      user.displayName || "사용자";
    document.getElementById("user-email").textContent = user.email;

    if (user.photoURL) {
      const photo = document.getElementById("user-photo");
      photo.src = user.photoURL;
      photo.style.display = "block";
    }

    // 이메일 인증 여부 확인
    const verifyNotice = document.getElementById("verify-notice");
    if (user.emailVerified) {
      verifyNotice.style.display = "none";
    } else {
      verifyNotice.style.display = "block";
    }

    console.log("로그인됨:", user.email, "인증 여부:", user.emailVerified);
  } else {
    // 로그아웃 상태
    loggedOutArea.style.display = "block";
    loggedInArea.style.display = "none";
    console.log("로그아웃 상태");
  }
});

// ─── Day 1: 연결 성공 메시지 ──────────────────────────────
const status = document.getElementById("status");
status.textContent = "Firebase 연결 성공!";
status.classList.add("success");
document.getElementById("project-id").textContent =
  "Project ID: " + firebaseConfig.projectId;
console.log("Firebase 연결 성공!", app);

// ─── 실습 3: 이메일·비밀번호 회원가입 ──────────────────────
document.getElementById("signup-form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const email = document.getElementById("signup-email").value;
  const password = document.getElementById("signup-password").value;
  try {
    const userCredential = await createUserWithEmailAndPassword(
      auth,
      email,
      password
    );
    console.log(
      "가입 성공:",
      userCredential.user.email,
      userCredential.user.uid
    );
    alert(`${userCredential.user.email}님 가입이 완료됐어요!`);
  } catch (error) {
    console.error("가입 실패:", error.code);
    if (error.code === "auth/email-already-in-use")
      alert("이미 가입된 이메일이에요.");
    else if (error.code === "auth/weak-password")
      alert("비밀번호는 6자 이상이어야 해요.");
    else if (error.code === "auth/invalid-email")
      alert("이메일 형식이 맞지 않아요.");
    else alert("가입 실패: " + error.message);
  }
});

// ─── 실습 3: 이메일·비밀번호 로그인 ────────────────────────
document.getElementById("login-form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const email = document.getElementById("login-email").value;
  const password = document.getElementById("login-password").value;
  try {
    const userCredential = await signInWithEmailAndPassword(
      auth,
      email,
      password
    );
    console.log("로그인 성공:", userCredential.user.email);
    alert(`${userCredential.user.email}님 로그인 완료!`);
  } catch (error) {
    console.error("로그인 실패:", error.code);
    if (error.code === "auth/user-not-found")
      alert("가입되지 않은 이메일이에요.");
    else if (
      error.code === "auth/wrong-password" ||
      error.code === "auth/invalid-credential"
    )
      alert("비밀번호가 맞지 않아요.");
    else alert("로그인 실패: " + error.message);
  }
});

// ─── 실습 4: 구글 OAuth 로그인 ─────────────────────────────
document
  .getElementById("google-login-btn")
  .addEventListener("click", async () => {
    const provider = new GoogleAuthProvider();
    try {
      const userCredential = await signInWithPopup(auth, provider);
      const user = userCredential.user;
      console.log("구글 로그인 성공:", user.displayName, user.email);
      // 화면 표시는 Step 3에서 onAuthStateChanged로 자동 처리할 예정
    } catch (error) {
      console.error("구글 로그인 실패:", error.code);
      if (error.code === "auth/popup-closed-by-user")
        alert("로그인 창을 닫으셨어요.");
      else if (error.code === "auth/popup-blocked")
        alert("브라우저가 팝업을 차단했어요.");
      else alert("구글 로그인 실패: " + error.message);
    }
  });

// 로그아웃 처리
document.getElementById("logout-btn").addEventListener("click", async () => {
  try {
    await signOut(auth);
    console.log("로그아웃 완료");
    // 화면 변경은 onAuthStateChanged가 자동 처리 (별도 코드 X)
  } catch (error) {
    console.error("로그아웃 실패:", error.message);
    alert("로그아웃 실패: " + error.message);
  }
});

// 인증 메일 재전송
document
  .getElementById("resend-verification-btn")
  .addEventListener("click", async () => {
    const user = auth.currentUser;
    if (!user) {
      alert("로그인된 사용자가 없어요.");
      return;
    }

    try {
      await sendEmailVerification(user);
      alert(
        `${user.email}로 인증 메일을 보냈어요. 메일함과 스팸함을 확인하세요.`
      );
    } catch (error) {
      console.error("인증 메일 발송 실패:", error.code);
      if (error.code === "auth/too-many-requests") {
        alert(
          "잠시 후 다시 시도해주세요. 너무 자주 요청하면 일시적으로 차단돼요."
        );
      } else {
        alert("인증 메일 발송 실패: " + error.message);
      }
    }
  });

// 비밀번호 재설정 메일 발송
document
  .getElementById("reset-password-link")
  .addEventListener("click", async (e) => {
    e.preventDefault();

    const email = prompt("비밀번호 재설정 메일을 받을 이메일을 입력하세요:");
    if (!email) return;

    try {
      await sendPasswordResetEmail(auth, email);
      alert(`${email}로 재설정 메일을 보냈어요. 메일함을 확인하세요.`);
    } catch (error) {
      console.error("재설정 메일 발송 실패:", error.code);
      if (error.code === "auth/user-not-found") {
        alert("가입되지 않은 이메일이에요.");
      } else if (error.code === "auth/invalid-email") {
        alert("이메일 형식이 맞지 않아요.");
      } else {
        alert("재설정 메일 발송 실패: " + error.message);
      }
    }
  });
