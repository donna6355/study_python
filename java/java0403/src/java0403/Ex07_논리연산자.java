
public class Ex07_논리연산자 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// !(not) 
		// &&(and)
		// ||(or)
		
		System.out.println(true && true);
		System.out.println(true || false);
		System.out.println(!true);
		
		int a = 3;
		int b = 10;
		System.out.println(!(a>b));
		
		System.out.println(1<3 && 4<5);
		System.out.println(1<3 && 4==5);
		System.out.println(1>3 || 4<5);
		System.out.println(1>3 || 4>5);
	}

}
