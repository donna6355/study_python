import java.util.Random;
import java.util.Scanner;

public class BaseballGame {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		int[] array = {1,2,3};
//		arrayToString(array);
//		boolean result = isDuplicate(array);
//		System.out.println(result);
//
//		int[] array2 = createRandomNumber(3);
//		arrayToString(array2);
//		
//		int[] array3 = strikeBalCounting(array, array2);
//		arrayToString(array3);
		
		

		System.out.println("=====Game Start=====");
		int[] answer = createRandomNumber(3);
		arrayToString(answer);
		
		int[] input = new int[answer.length];
		Scanner sc = new Scanner(System.in);
		int[] sb = new int[answer.length];
		
		while(sb[0] != answer.length) {
			for (int i = 0; i < input.length; i++) {
				System.out.print(i+1+"번째 숫자 입력 : ");
				input[i] = sc.nextInt();
			}
			sb = strikeBalCounting(input, answer);
			arrayToString(sb);
		}
		
	}
	
	// 1. 배열에 들어있는 데이터를 전부 출력
	// 2. 배열에 들어있는 데이터 중복 여부 체크 
	// 3. 랜덤으로 숫자 3개 생성
	// 4. 스트라이크, 볼 갯수 반환
	
	public static void arrayToString(int[] arr) {
		for(int el:arr) {
			System.out.print(el+" ");
		}
		System.out.println();
	}
	
	public static boolean isDuplicate(int[] arr) {
		for (int i = 0; i<arr.length;i++) {
			for(int j = i+1;j<arr.length;j++) {
//				System.out.println("check : "+ i +j);
				if(arr[i] == arr[j]) {
				return true;
				}
			}
		}
		return false;
	}
	
	public static int[] createRandomNumber(int cnt) {
		int[] arr = new int[cnt];
		Random r = new Random();
		while(isDuplicate(arr)) {
			for (int i = 0; i<arr.length; i++) {
				arr[i] = r.nextInt(3)+1;
			}
		}
		
		return arr;
	}
	
	public static int[] strikeBalCounting(int[] guess, int[] answer) {
		int[] sb = new int[2];
		
		for (int i = 0; i<guess.length; i++) {
			for(int j = 0;j<answer.length;j++) {
//				System.out.println("check : "+ i +j);
				if(guess[i] == answer[j] ) {
					if(i==j) {
						sb[0] +=1;
					}else {
						sb[1] +=1;
					}
					break;
				}
			}
		}
		return sb;
	}
}
