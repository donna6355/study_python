package ex03;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		NumberGame game = new NumberGame();
		
		while(true) {
			System.out.println("1.addGame 2.MultipleGame 3.ShareGame 4.RemainingGamr 5.Exit");
			
			int menu = sc.nextInt();
			if(menu == 1) {
				game.plusGame();
			} else if (menu == 2) {
				game.multi();
			} else if (menu == 3) {
				game.div();
			} else if (menu == 4) {
				game.remain();
			} else {
				System.out.println("Exit");
				break;
			}
		}
		

	}

}
