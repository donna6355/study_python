package java0403;

import java.util.Scanner;

public class Ex03_operator {

	public static void main(String[] args) {
		int num1 = 10;
		int num2 = 7;
		double num3 = 7.5;
		
		System.out.println(num1/num2); // 1
		System.out.println(num1/num3); //1.4285....

		System.out.println(num1/(double)num2); // 1.4285...
		
		
		String s = "냐옹옹옹";
		System.out.println(s+"저는 "+num1+"살 입니다."); //냐옹옹옹저는 10살 입니다.
		
		int num5=7;
		int num6=9;
		String s2 = "6";
		System.out.println(s2 + num5 + num6); //679
		System.out.println(num5+num6+s2); //166
		
		Scanner sc = new Scanner(System.in);
		System.out.print("Please input inteager:");
		int inputNum = sc.nextInt();

		System.out.print(inputNum);
		
		
		int score = 65;
		if (score >= 60) {
			System.out.println("합격입니다.");
		} else {
			System.out.println("탈입니다.");
		}
		
		
		if (score > 90) {
			System.out.println("A");
		} else if(score >80){
			System.out.println("B");
		} else if(score >70){
			System.out.println("C");
		} else {
			System.out.println("FAILED");
		}
	}

}
