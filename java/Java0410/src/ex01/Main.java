package ex01;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		// membership management program
		
		Scanner sc = new Scanner(System.in);
		Controller ctrl = new Controller();
		
		while(true) {
			System.out.println("==========Membership Management=========");
			System.out.print("1.회원등록 2.회원목록보기 3.회원정보수정 4.회원삭제 5.종료 ");
			int menu = sc.nextInt();
			if(menu ==1) {
				System.out.println("==========SIGNUP=========");
				System.out.print("type name :  ");
				String name = sc.next();
				System.out.print("type phone number :  ");
				String phone = sc.next();
//				memberList.add(new Member(name,phone));
				ctrl.register(name, phone);
				System.out.println("==========COMPLETED=========");
			}else if(menu ==2 ) {
				System.out.println("==========LISTUP=========");
//				printMemberList(memberList);
				printMemberList(ctrl.getMembers());
			} else if(menu ==3 ) {
				System.out.println("==========UPDATE=========");
//				printMemberList(memberList);

				printMemberList(ctrl.getMembers());
				System.out.print("type member num to update :  ");
				int num = sc.nextInt();
				
				System.out.print("type name to update :  ");
				String name = sc.next();

				System.out.print("type phone numer to update :  ");
				String phone = sc.next();
				int cnt = ctrl.update(num, name, phone);
				if(cnt >0) {
					System.out.println("==========COMPLETED=========");
				}
				
			} else if(menu ==4 ) {
				System.out.println("==========DELETE=========");
//				printMemberList(memberList);
				printMemberList(ctrl.getMembers());
				System.out.print("type member num to delete :  ");
				int num = sc.nextInt();
				System.out.print("R U sure to delete? (Y | N) ");
				String answer = sc.next();
				int cnt = ctrl.delete(num, answer);
				if(cnt >0) {
					System.out.println("==========DELETED=========");
				}
				
			} else if(menu ==5 ) {
				System.out.println("==========TERINATE=========");
				break;
			} else {
				
			} // if end
		} // while end
	} // Main End
	
	public static void printMemberList(ArrayList<Member> memberList) {

		for (int i = 0; i < memberList.size(); i ++) {
			Member m = memberList.get(i);
			System.out.println(i+1 + ". "+m.getName()+" " + m.getPhone());
		}
	}

}
