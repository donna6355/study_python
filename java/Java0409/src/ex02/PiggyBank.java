package ex02;

public class PiggyBank {
	private int money;
	public void deposit(int money) {
		if(money<0) return;
		this.money +=money;
		System.out.println(money + "has been deposited : " + money);
	}
	public void withdraw(int money) {
		if(this.money < money) {
			System.out.println("Not Enough Money");
			return;			
		}
		this.money -= money;
		System.out.println(money + "has been withdrawn");
	}
	
	public int balance() {
		return this.money;
	}
	
}
