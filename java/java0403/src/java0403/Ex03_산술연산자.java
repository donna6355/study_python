import java.util.Scanner;

public class Ex03_산술연산자 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int num1 = 10;
		int num2 = 7;
		double num3 = 7.0;
		
		System.out.println(num1/num2);
		System.out.println(num1/num3);
		System.out.println(num1/(double)num2);
		
		System.out.println(num1+num3);
		
		String s = "안녕하세요";
		System.out.println(s+"저는 "+num1+"살 입니다.");
		
		int num5=7;
		int num6 = 9;
		String s2 = "6";
		
		System.out.println(s2+num6+num5);
		System.out.println(num5+num6+s2);
		System.out.println(num5+s2+num6);
		
		// ctrl+shift+O
		Scanner sc = new Scanner(System.in);
		System.out.print("정수입력해주세요 : ");
		int inputNum= sc.nextInt();
		
		
		 // 초를 입력받아 시분초 출력하기
		System.out.print("초 입력 : ");
		int totalSecond = sc.nextInt();
		
		int hour = totalSecond / 3600;
		int minute = totalSecond % 3600 /60;
		int second = totalSecond % 60;
		System.out.println(hour+"시간"+minute+"분"+second+"초");
		
		
	}

}
