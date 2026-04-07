
public class Ex01_변수자료형 {

	// main+ctrl+space : main 메소드 만드는 단축키
	// ctrl+F11 : 실행 단축키
	public static void main(String[] args) {
		// 변수선언
		int num;
		
		// 변수에 값 대입
		num = 10;
		
		// syso+ctrl+space : 출력메소드 단축키
		System.out.println(num);
		
		num = 5;
		System.out.println(num);
		
		// 변수 선언과 동시 대입 -> 초기화
		int num2 = 15;
		System.out.println(num2);
		
		// 상수 선언
		final int NUM;
		NUM = 10;
		// 상수는 다른 값으로 변경이 불가능함
//		NUM = 5;
		
		// 동일한 변수명을 선언하는 것은 불가능함
//		long num2;
	}

}
