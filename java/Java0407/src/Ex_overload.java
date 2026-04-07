
public class Ex_overload {
	public static void main(String[] args) {
//		메소드 오버로딩이란 메소드의 이름은 동일하게 만들되
//		매개변수를 다르게 함으로써 메소드를 여러개 만드는 기법
	add(3,5);
	add(3.2,5.6);
	}
	
	public static void add(int n1, int n2) {
		System.out.println(n1+n2);
	}
	
	public static double add(double d1, double d2) {
		System.out.println(d1+d2);
		return d1+d2;
	}	
	public static double add(int n1, double d2) {
		System.out.println(n1+d2);
		return n1+d2;
	}

}
