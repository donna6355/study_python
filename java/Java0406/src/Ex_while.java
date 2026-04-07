import java.util.Scanner;

public class Ex_while {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 현재 몸무게 입력받기
		// 목표 몸무게 입력받기
		// 주차별 감량 몸무게 받기
		// 몸무게 달성 시 축하한다 종료
		

		Scanner sc = new Scanner(System.in);

		System.out.print("Please input your current weight");
		int currentWeight = sc.nextInt();
		System.out.println("Your current weight is " + currentWeight);

		System.out.print("Please input your goal weight");
		int goalWeight = sc.nextInt();
		System.out.println("Your goal weight is " + goalWeight);
		
		
		int week = 1;
		int loose = 0;
		
		while (currentWeight - loose >= goalWeight) {
			System.out.print("Please input weight you lost this week");
			loose = sc.nextInt();

			System.out.println(week + " week, you lost weight :" + loose);
			week++;
			currentWeight -= loose;
			
		}
		


		System.out.print(currentWeight + "kg! Congrats!");
		

	}

}
