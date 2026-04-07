import java.util.Scanner;

public class Ex09_조건문If {
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// score가 60점 이상이면 합격, 아닐경우 불합격
//		if (조건식) {
//			실행문;
//		}
		
		int score = 55;
		if(score>=60) {
			System.out.println("합격입니다.");
		}else {
			System.out.println("불합격입니다.");
		}
		
		
//		if (조건식) {
//			실행문1
//		}else if(조건식) {
//			실행문2
//		}else if(조건식) {
//			실행문3
//		}else {
//			실행문4
//		}
		
		
		Scanner sc = new Scanner(System.in);
		System.out.print("점수 입력 : ");
		int totalScore = sc.nextInt();
		String grade;
		if(totalScore>=90) {
			grade ="A";
		}else if(totalScore>=80) {
			grade ="B";
		}else if(totalScore>=70) {
			grade ="C";
		}else {
			grade ="F";
		}
		System.out.println(grade+"학점입니다.");
		
		
		
	}

}
