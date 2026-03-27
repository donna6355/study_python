// 퀴즈 데이터
const quizData = [
    {
        question: "HTML에서 가장 큰 제목을 나타내는 태그는 무엇인가요?",
        options: ["<heading>", "<h6>", "<h1>", "<title>"],
        answer: 2
    },
    {
        question: "CSS에서 글자 색상을 바꾸는 속성은 무엇인가요?",
        options: ["font-color", "text-color", "color", "background-color"],
        answer: 2
    },
    {
        question: "JavaScript에서 변수를 선언할 때 사용하지 않는 키워드는?",
        options: ["let", "const", "var", "int"],
        answer: 3
    },
    {
        question: "console.log()의 결과는 어디에서 볼 수 있나요?",
        options: ["웹 페이지 화면", "개발자 도구의 Console", "주소창", "새 탭"],
        answer: 1
    },
    {
        question: "CSS에서 요소를 가로로 나란히 배치할 때 사용하는 속성은?",
        options: ["display: block", "display: inline", "display: flex", "display: grid"],
        answer: 2
    }
]

// 상태 변수
let currentQuestion = 0
let score = 0