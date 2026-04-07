import java.util.Scanner;

public class Ex08_삼항연산자 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// true일경우실행 if 조건식 else false일경우실행
		// 조건식 ? true일경우실행 : false일경우실행

		// ctrl+shift+f : 코드 자동정렬 단축키
		int num1 = 10;
		int num2 = 10;

		String s = num1 == num2 ? "같다" : "다르다";
		System.out.println(s);
		
		
		// 정수를 입력받아 홀수/짝수 판별하기
		Scanner sc = new Scanner(System.in);
		System.out.print("정수를 입력하세요 : ");
		int inputNum = sc.nextInt();
		
		String result = inputNum%2 == 0?"짝수" : "홀수";
		System.out.println(inputNum+"는(은) "+result+"입니다.");

		// 농구공을 담기 위해 필요한 상자 수 구하기
		
		System.out.print("농구공 수 입력 : ");
		int ball = sc.nextInt();
		
		int box = ball%5==0 ? ball/5 : ball/5 + 1;
		System.out.println("필요한 상자의 수 : "+box+"박스");
		
		
	}

}
