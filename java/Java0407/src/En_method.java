
public class En_method {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int test = powerN(5,3);
		System.out.println(test);

	}
	
	public static int addNumber(int num1, int num2) {
		return num1 +num2;
	}

	public static int powerN(int base, int count) {
		int result = 1;
//		for (int i =count; i >0;i-- ) {
//			result *= base;
//			System.out.println("index is :" + i +" result is : " + result);
//		}
		while (count > 0) {
			result *= base;
			System.out.println("count is :" + count +" result is : " + result);
			count--;
			
		}
		
		return result;
	}
}
