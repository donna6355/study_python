package ex02;

public class SDSalad extends Salad{
	public SDSalad() {
		System.out.println("SDSalad Created");
	}
	
	@Override
	public void makeSalad() {
		System.out.println("Full of Fresh Salad with Tofu!");
	}
}
