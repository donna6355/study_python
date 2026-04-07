import java.util.Scanner;

public class Ex05_for {

	public static void main(String[] args) {
		//파이썬에서는 다음과 같이 사
		// for i in list or String or tuple
		// for i in range(start, end, increment)
		
//		for (int num = 1; num <11; num++) {
//			System.out.println(num);
//		}
//		
		


		Scanner sc = new Scanner(System.in);

		System.out.print("Please input integer :");
		int inputNum = sc.nextInt() +1;
		for (int i = 1; i < inputNum; i++) {
			System.out.println(i);
		}
		
		for (int i = 1; i <=9; i++) {
			for (int j= 2; j <=9; j++) {
				System.out.print(j+" x "+i + " = "+i*j + " ");
			}
			System.out.println();
		}
		
	}
}
