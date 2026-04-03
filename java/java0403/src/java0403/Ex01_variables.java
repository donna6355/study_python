package java0403;

public class Ex01_variables {

	public static void main(String[] args) {
		//variable
		int num;
		num = 5;
		
		//print syso
		System.out.println(num);
		
		final int NUM;
		NUM = 10;
			
		//boolean(1)
		boolean state = true;
		System.out.println(state);
		
		//char(2)
		char c = 'A'; //single quote
		System.out.println(c);
		c = 100;
		System.out.println(c); //d
		c = 65;
		System.out.println(c); //A
		
		//numbers
		byte b = 127;
		short s = 10;
		int i = 15;
		long l = 20;
		float f = 10.2f;
		double d = 15.7;
		
		String text = "abc"; //double quote
		
		
		int num1 = 20;
		short num2 = 10;
		
		//convert type automatically
		num1 = num2;
		System.out.println(num1);
		//force type convert forcefully as size shrinks
		num2 = (short)num1;
		
		double num3 = 12.5;
		num3 = num1;
		System.out.println(num3);
		
		num3 = 12.5;
		num1 = (int)num3;
		System.out.println(num1);
		
		float num4 = num1;
		
		
	}

}
