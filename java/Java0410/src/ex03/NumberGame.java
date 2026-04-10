package ex03;

import java.util.Random;
import java.util.Scanner;

public class NumberGame implements GameInterface, TextInterface{
	private Random rd = new Random();
	private Scanner sc = new Scanner(System.in);
	
	@Override
	public void plusGame() {
		int num1 = rd.nextInt(10)+1;
		int num2 = rd.nextInt(10)+1;
		System.out.print (num1 + "+"+num2+"=");
		int answer = sc.nextInt();
		if(answer == num1+num2) {
			System.out.println("Correct Answer");
		}else {

			System.out.println("Something went Wrong...");
		}
	}

	@Override
	public void multi() {
		int num1 = rd.nextInt(10)+1;
		int num2 = rd.nextInt(10)+1;
		System.out.print (num1 + "x"+num2+"=");
		int answer = sc.nextInt();
		if(answer == num1*num2) {
			System.out.println("Correct Answer");
		}else {

			System.out.println("Something went Wrong...");
		}	
	}

	@Override
	public void div() {
		int num1 = rd.nextInt(10)+1;
		int num2 = rd.nextInt(10)+1;
		System.out.print (num1 + "/"+num2+"=");
		int answer = sc.nextInt();
		if(answer == num1/num2) {
			System.out.println("Correct Answer");
		}else {

			System.out.println("Something went Wrong...");
		}
		
	}

	@Override
	public void remain() {
		int num1 = rd.nextInt(10)+1;
		int num2 = rd.nextInt(10)+1;
		System.out.print (num1 + "%"+num2+"=");
		int answer = sc.nextInt();
		if(answer == num1%num2) {
			System.out.println("Correct Answer");
		}else {

			System.out.println("Something went Wrong...");
		}
		
	}

}
