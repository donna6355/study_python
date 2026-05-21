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
import {
  getFirestore,
  collection,
  addDoc,
  getDocs,
  doc,
  updateDoc,
  deleteDoc,
  serverTimestamp,
  query,
  where,
  orderBy,
  limit,
  startAfter,
} from "https://www.gstatic.com/firebasejs/12.13.0/firebase-firestore.js";
import {
  getStorage,
  ref,
  uploadBytes,
  getDownloadURL,
  deleteObject,
} from "https://www.gstatic.com/firebasejs/12.13.0/firebase-storage.js";
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
const db = getFirestore(app);
const storage = getStorage(app);

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

    loadDiaries();
    loadImpressions();
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

// 일기 저장 처리
const diaryForm = document.getElementById("diary-form");

diaryForm.addEventListener("submit", async (e) => {
  e.preventDefault();

  const title = document.getElementById("diary-title").value;
  const content = document.getElementById("diary-content").value;

  // 로그인 상태 확인
  const user = auth.currentUser;
  if (!user) {
    alert("로그인 후 사용해주세요.");
    return;
  }

  try {
    let photoURL = null;
    if (selectedPhotoFile) {
      const fileName = Date.now() + "_" + selectedPhotoFile.name;
      const fileRef = ref(storage, `diaries/${user.uid}/${fileName}`);
      await uploadBytes(fileRef, selectedPhotoFile);
      photoURL = await getDownloadURL(fileRef);
    }
    const docRef = await addDoc(collection(db, "diaries"), {
      title: title,
      content: content,
      photoURL: photoURL,
      userId: user.uid,
      createdAt: serverTimestamp(),
    });

    console.log("저장된 도큐먼트 ID:", docRef.id);
    alert("일기가 저장됐어요!");

    // 폼 초기화
    diaryForm.reset();
    selectedPhotoFile = null;
    document.getElementById("photo-preview").style.display = "none";

    // 목록 다시 불러오기 (Step 5에서 만들 함수)
    loadDiaries();
  } catch (error) {
    console.error("저장 실패:", error.code, error.message);
    alert("저장 실패: " + error.message);
  }
});

// 일기 목록 불러오기 — 본인 것만 + 최신순 + 3개씩
let lastVisibleDoc = null; // 페이지네이션용 (Step 8)

async function loadDiaries() {
  const diaryList = document.getElementById("diary-list");
  diaryList.innerHTML = "불러오는 중...";

  const user = auth.currentUser;
  if (!user) {
    diaryList.innerHTML = "<p>로그인이 필요합니다.</p>";
    return;
  }

  try {
    const q = query(
      collection(db, "diaries"),
      where("userId", "==", user.uid),
      orderBy("createdAt", "desc"),
      limit(3)
    );

    const snapshot = await getDocs(q);

    if (snapshot.empty) {
      diaryList.innerHTML = "<p>아직 작성한 일기가 없어요.</p>";
      lastVisibleDoc = null;
      return;
    }

    diaryList.innerHTML = "";

    snapshot.forEach((docSnap) => {
      const data = docSnap.data();
      const card = renderDiaryCard(docSnap.id, data);
      diaryList.appendChild(card);
    });

    // 마지막 도큐먼트 기억 (Step 8에서 사용)
    lastVisibleDoc = snapshot.docs[snapshot.docs.length - 1];
    // 일기가 limit과 같은 개수면 더 있을 가능성 → "더 보기" 버튼 표시
    const loadMoreBtn = document.getElementById("load-more-btn");
    if (snapshot.size === 3) {
      loadMoreBtn.style.display = "inline-block";
    } else {
      loadMoreBtn.style.display = "none";
    }
  } catch (error) {
    console.error("목록 불러오기 실패:", error.code, error.message);

    if (error.code === "failed-precondition") {
      diaryList.innerHTML = `
        <p>인덱스가 필요해요. 브라우저 콘솔(F12)을 열고 에러 메시지의 링크를 클릭해서 인덱스를 만든 후 다시 시도하세요.</p>
      `;
    } else {
      diaryList.innerHTML = `<p>불러오기 실패: ${error.message}</p>`;
    }
  }
}

// 더 보기 — 다음 3개 추가 로드
document.getElementById("load-more-btn").addEventListener("click", async () => {
  const user = auth.currentUser;
  if (!user || !lastVisibleDoc) return;

  const diaryList = document.getElementById("diary-list");
  const loadMoreBtn = document.getElementById("load-more-btn");

  try {
    const q = query(
      collection(db, "diaries"),
      where("userId", "==", user.uid),
      orderBy("createdAt", "desc"),
      startAfter(lastVisibleDoc),
      limit(3)
    );

    const snapshot = await getDocs(q);

    snapshot.forEach((docSnap) => {
      const card = renderDiaryCard(docSnap.id, docSnap.data());
      diaryList.appendChild(card);
    });

    if (snapshot.size < 3) {
      loadMoreBtn.style.display = "none"; // 더 가져올 거 없음
    } else {
      lastVisibleDoc = snapshot.docs[snapshot.docs.length - 1];
    }
  } catch (error) {
    console.error("더 보기 실패:", error.code, error.message);
    alert("더 보기 실패: " + error.message);
  }
});

// 카드 한 장 만들기
function renderDiaryCard(id, data) {
  const card = document.createElement("div");
  card.className = "diary-card";

  const createdAt = data.createdAt?.toDate
    ? data.createdAt.toDate().toLocaleString("ko-KR")
    : "방금 저장됨";

  const photoHTML = data.photoURL
    ? `<img src="${data.photoURL}" class="diary-photo" alt="일기 사진" />`
    : "";

  card.innerHTML = `
    <h3>${data.title}</h3>
    ${photoHTML}
    <p>${data.content}</p>
    <div class="meta">${createdAt}</div>
    <div class="actions">
      <button data-id="${id}" class="edit-btn">수정</button>
      <button data-id="${id}" class="delete-btn">삭제</button>
    </div>
  `;

  return card;
}
// 목록 영역 클릭 이벤트 — 삭제·수정 버튼 처리
document.getElementById("diary-list").addEventListener("click", async (e) => {
  // 삭제 버튼
  if (e.target.classList.contains("delete-btn")) {
    const id = e.target.dataset.id;
    if (!confirm("정말 삭제할까요? 복구할 수 없어요.")) return;

    try {
      await deleteDoc(doc(db, "diaries", id));
      alert("삭제됐어요.");
      loadDiaries();
    } catch (error) {
      console.error("삭제 실패:", error.code, error.message);
      alert("삭제 실패: " + error.message);
    }
  }

  // 수정 버튼
  if (e.target.classList.contains("edit-btn")) {
    const id = e.target.dataset.id;

    // 현재 카드에서 제목·본문 읽기
    const card = e.target.closest(".diary-card");
    const currentTitle = card.querySelector("h3").textContent;
    const currentContent = card.querySelector("p").textContent;

    const newTitle = prompt("새 제목:", currentTitle);
    if (newTitle === null) return; // 취소

    const newContent = prompt("새 본문:", currentContent);
    if (newContent === null) return;

    try {
      await updateDoc(doc(db, "diaries", id), {
        title: newTitle,
        content: newContent,
      });
      alert("수정됐어요.");
      loadDiaries();
    } catch (error) {
      console.error("수정 실패:", error.code, error.message);
      alert("수정 실패: " + error.message);
    }
  }
});
// 제목 키워드로 검색
async function searchDiaries(keyword) {
  const diaryList = document.getElementById("diary-list");
  diaryList.innerHTML = "검색 중...";
  // ↓↓↓ 추가 ↓↓↓
  const loadMoreBtn = document.getElementById("load-more-btn");
  if (loadMoreBtn) loadMoreBtn.style.display = "none";
  // ↑↑↑

  const user = auth.currentUser;
  if (!user) return;

  try {
    // Firestore는 부분 문자열 검색을 직접 지원하지 않음 → 시작 문자열 매칭만
    const q = query(
      collection(db, "diaries"),
      where("userId", "==", user.uid),
      where("title", ">=", keyword),
      where("title", "<=", keyword + ""),
      orderBy("title", "asc"),
      limit(20)
    );

    const snapshot = await getDocs(q);

    if (snapshot.empty) {
      diaryList.innerHTML = "<p>일치하는 일기가 없어요.</p>";
      return;
    }

    diaryList.innerHTML = "";
    snapshot.forEach((docSnap) => {
      const card = renderDiaryCard(docSnap.id, docSnap.data());
      diaryList.appendChild(card);
    });
  } catch (error) {
    console.error("검색 실패:", error.code, error.message);
    if (error.code === "failed-precondition") {
      diaryList.innerHTML = `
        <p>검색용 인덱스가 필요해요. F12 콘솔의 링크를 클릭해서 만든 후 재시도.</p>
      `;
    } else {
      diaryList.innerHTML = `<p>검색 실패: ${error.message}</p>`;
    }
  }
}

// 검색 폼 이벤트
document.getElementById("search-form").addEventListener("submit", (e) => {
  e.preventDefault();
  const keyword = document.getElementById("search-keyword").value.trim();
  if (!keyword) {
    alert("검색어를 입력해주세요.");
    return;
  }
  searchDiaries(keyword);
});

// 초기화 — 전체 목록 복원
document.getElementById("search-reset").addEventListener("click", () => {
  document.getElementById("search-keyword").value = "";
  loadDiaries();
});
// ─── 사진 미리보기 (lab9 Step 4) ─────────────────────────
let selectedPhotoFile = null; // 선택된 File 객체 저장

document.getElementById("diary-photo").addEventListener("change", (e) => {
  const file = e.target.files[0];
  const preview = document.getElementById("photo-preview");

  if (!file) {
    // 사용자가 선택 취소
    selectedPhotoFile = null;
    preview.style.display = "none";
    return;
  }

  // 형식 검증
  if (!file.type.startsWith("image/")) {
    alert("이미지 파일만 업로드 가능해요.");
    e.target.value = ""; // 입력 초기화
    return;
  }

  // 크기 검증 (5MB 이하)
  const MAX_SIZE = 5 * 1024 * 1024;
  if (file.size > MAX_SIZE) {
    alert(
      "5MB 이하 사진만 업로드 가능해요. (현재: " +
        (file.size / 1024 / 1024).toFixed(2) +
        "MB)"
    );
    e.target.value = "";
    return;
  }

  // 미리보기 표시
  selectedPhotoFile = file;
  const url = URL.createObjectURL(file);
  preview.src = url;
  preview.style.display = "block";
});

// ─── 첫인상 보드 (lab11) ────────────────────────────────

// 첫인상 글 작성
document
  .getElementById("impression-form")
  .addEventListener("submit", async (e) => {
    e.preventDefault();

    const user = auth.currentUser;
    if (!user) {
      alert("로그인 후 사용해주세요.");
      return;
    }

    const text = document.getElementById("impression-text").value.trim();
    if (!text) {
      alert("내용을 입력해주세요.");
      return;
    }

    try {
      await addDoc(collection(db, "impressions"), {
        text: text,
        fromName: user.displayName || user.email.split("@")[0],
        fromEmail: user.email,
        userId: user.uid,
        createdAt: serverTimestamp(),
      });
      e.target.reset();
      loadImpressions();
    } catch (error) {
      console.error("저장 실패:", error.code, error.message);
      alert("저장 실패: " + error.message);
    }
  });

// 받은 첫인상 목록 불러오기
async function loadImpressions() {
  const list = document.getElementById("impression-list");
  list.innerHTML = "불러오는 중...";

  try {
    // 전체 impressions 가져오기 (where 없음 — 누구 글이든)
    const q = query(
      collection(db, "impressions"),
      orderBy("createdAt", "desc"),
      limit(20)
    );
    const snapshot = await getDocs(q);

    if (snapshot.empty) {
      list.innerHTML =
        "<p>아직 받은 첫인상이 없어요. 조원에게 도메인을 공유해보세요.</p>";
      return;
    }

    const currentUid = auth.currentUser?.uid;

    list.innerHTML = "";
    snapshot.forEach((docSnap) => {
      const data = docSnap.data();
      const createdAt = data.createdAt?.toDate
        ? data.createdAt.toDate().toLocaleString("ko-KR")
        : "방금 남김";

      // 본인 글이면 삭제 버튼 표시
      const deleteBtn =
        data.userId === currentUid
          ? `<button data-id="${docSnap.id}" class="delete-btn">삭제</button>`
          : "";

      const card = document.createElement("div");
      card.className = "impression-card";
      card.innerHTML = `
        <div class="text">${escapeHtml(data.text)}</div>
        <div class="from">${escapeHtml(data.fromName)} · ${createdAt}</div>
        ${deleteBtn}
      `;
      list.appendChild(card);
    });
  } catch (error) {
    console.error("불러오기 실패:", error.code, error.message);
    list.innerHTML = `<p>불러오기 실패: ${error.message}</p>`;
  }
}

// 본인 첫인상 삭제
document
  .getElementById("impression-list")
  .addEventListener("click", async (e) => {
    if (!e.target.classList.contains("delete-btn")) return;
    const id = e.target.dataset.id;
    if (!confirm("이 첫인상 글을 삭제할까요?")) return;

    try {
      await deleteDoc(doc(db, "impressions", id));
      loadImpressions();
    } catch (error) {
      alert("삭제 실패: " + error.message);
    }
  });

// HTML 이스케이프 (XSS 방지)
function escapeHtml(str) {
  return String(str)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}
