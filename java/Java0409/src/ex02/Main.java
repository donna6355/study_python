package ex02;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		System.out.println("-----PiggyBank-----");
		PiggyBank pb = new PiggyBank();

		while(true) {
		System.out.print("1. deposit, 2. withdraw, 3. balance, 4. terminate >>");
		int menu = sc.nextInt();
		switch(menu) {		
			case 1:
				System.out.print("please input deposit amount");
				int amonut = sc.nextInt();
				pb.deposit(amonut);
				break;
			case 2:
				System.out.print("please input withdraw amount");
				int money = sc.nextInt();
				pb.withdraw(money);
				break;
			case 3:
				System.out.println("balance is "+ pb.balance());
				break;
			case 4:
				System.out.println("TERMINATED");
				return;
			default:
				break;
		
			}
		}
	}

}
