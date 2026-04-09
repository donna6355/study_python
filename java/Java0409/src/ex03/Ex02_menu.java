package ex03;

import java.util.ArrayList;
import java.util.Scanner;

public class Ex02_menu {

	public static void main(String[] args) {
		// Menu program
		ArrayList<String> menuList = new ArrayList<String>();
		
		menuList.add("Baguette - 4,000");
		menuList.add("Sandwich - 8,000");
		menuList.add("Scone - 4,500");
		
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.println("1.menu 2.add menu 3.update menu 4.delete menu 5.terminate");
			int menu = sc.nextInt();
			
			switch (menu) {
			case 1:

				System.out.println("=====1.menu=====");
				for (int i = 0; i<menuList.size();i++) {
					System.out.println(i+1+". "+menuList.get(i));
				}
				break;
			case 2:
				System.out.println("=====2.add menu=====");
				System.out.print("input menu : ");
				sc.nextLine();
				String newMenu = sc.nextLine(); //including empty
				menuList.add(newMenu);
				break;
			case 3:
				System.out.println("=====3.update menu=====");
				System.out.print("input menu number : ");
				int num = sc.nextInt();
				System.out.print("input update menu : ");
				sc.nextLine();
				String updateMenu = sc.nextLine(); //including empty
				if(num <1 || num > menuList.size()) break;
				menuList.set(num-1,updateMenu);
				break;
				
			case 4:
				System.out.println("=====2.delete menu=====");
				System.out.print("input menu number : ");
				int idx = sc.nextInt();
				if(idx <1 || idx > menuList.size()) break;
				menuList.remove(idx-1);
				break;
				
			case 5:
				return;
			}
		}
		
	}

}
