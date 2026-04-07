
public class Ex02_자료형 {

	public static void main(String[] args) {
		// 논리 : boolean(1)
		// 정수(문자) : char(2)
		// 정수 : byte(1) short(2) int(4) long(8)
		// 실수 : float(4) double(8)

		boolean state = true;
		System.out.println(state);
		
		char c = 'A';
		System.out.println(c);
		
		c = 100;
		System.out.println(c);
		
		c = 65;
		System.out.println(c);
		
		byte b = 127;
		
		short s = 10;
		
		int i = 15;
		
		long l = 20;
		
		float f = 10.2f;
		
		double d = 15.7;
		
		String text = "abc";
		
		// 형변환
		
		int num1 = 20;
		short num2 = 10;
		
		// 자동형변환 int = short
		num1 = num2;
		System.out.println(num1);
		
		// 강제형변환 short = (short)int
		num2 = (short) num1;
		
		
		System.out.println(num2);
		
		double num3 = 12.5;
		// 자동형변환
		num3 = num1;
		System.out.println(num3);
		
		num3 = 12.5;
		// 강제형변환
		num1 = (int) num3;
		System.out.println(num1);
		
		// 자동형변환
		float num4 = num1;
		System.out.println(num4);
		
		// 강제형변환
		num4 = 13.7f;
		num1 = (int)num4;
		System.out.println(num1);
		
		
		
	}

}
