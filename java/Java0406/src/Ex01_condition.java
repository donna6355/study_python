import java.util.Scanner;

public class Ex01_condition {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);

		System.out.print("Please input inteager:");
		int inputM = sc.nextInt();
		switch (inputM) {
			case 12:
			case 1:
			case 2:
				System.out.println("this is winter");
			case 3:
				System.out.println("this is winter");
				break;
			default:
				System.out.println("Incorrect Input");
				break;
		}
		
		// input num until num is greater than 10 using while 
		
		int num = 0;
		while (num <= 10) {
			System.out.print("please input integer");
			num = sc.nextInt();
			
		}

	}

}


