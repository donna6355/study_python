import java.util.Arrays;

public class Ex_array {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] array1 = null;
		System.out.println(array1);
		
		array1 = new int[3]; // [0,0,0] default
		System.out.println(array1); //address
		

		System.out.println(array1.length);
		
		array1[0] = 5;
		array1[1] = 7;
		array1[2] = 2;
		
		for (int i = 0; i<array1.length; i++) {
			System.out.println(array1[i]);
		}
		
		// foreach
		for(int el : array1) {
			System.out.println(el);
		}
		
		// 배열 초기화는 분리 불가능!
		int[] array2 = {13,5,7,17,3,6,19,20,2,1};
		
		//find the smallest and biggest
		int small = array2[0];
		int big = array2[0];
		
		for (int num : array2) {
			if(num > big) {
				big = num;
			}else if(num < small) {
				small = num;
			}
		}

		System.out.println("the biggest is : "+big + " the smallest is : "+small);
		
		int[] bubSort = { 82, 45, 25, 12, 7 };
			// 1step : 0>1 1>2 2>3 3>4
			// 2step : 0>1 1>2 2>3
			// 3step : 0>1 1>2
			// 4step : 0>1
	 
		for (int k = 1; k < bubSort.length; k++) {
			for (int i = 0; i < bubSort.length - k; i++) {
				if (bubSort[i] > bubSort[i + 1]) {
					int temp = bubSort[i];
					bubSort[i] = bubSort[i + 1];
					bubSort[i + 1] = temp;
				}
			}
 
			System.out.println(Arrays.toString(bubSort));
		}
		
		
		int[] selSort = {7,98,3,70,24};
		for (int k =0; k<selSort.length; k++) {
			int maxi = k;
			for (int i = k+1; i<selSort.length; i++) {
				if(selSort[maxi]<selSort[i]) {
					maxi = i;
				}
			}
			int temp = selSort[maxi];
			selSort[maxi] = selSort[k];
			selSort[k] = temp;
			System.out.println(Arrays.toString(selSort));
		}
		
		//Search
		int[] search = {7,98,3,70,24,82, 45, 25, 12};
		
		int target =24;
		for (int i = 0; i<search.length;i++) {
			if(search[i]==target) {
				System.out.println("Got target at : "+i);
			}
		}
		
	}

}
