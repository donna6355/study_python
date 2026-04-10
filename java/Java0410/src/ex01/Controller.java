package ex01;

import java.util.ArrayList;

public class Controller {
	private ArrayList<Member> memberList = new ArrayList<Member>();
	
	public void register(String name, String phone) {
		memberList.add(new Member(name, phone));
		
	}
	
	public ArrayList<Member> getMembers(){
		return memberList;
	}
	public int update(int num, String name, String phone) {

		if(num > 0 && num <= memberList.size()) {
			memberList.set(num-1,new Member(name, phone));
			return 1;
		} else {
			return 0;
		}
		
	}
	
	public int delete (int num, String answer) {
		if(num > 0 && num <= memberList.size() &&(answer.equals("y") || answer.equals("Y"))) {
			memberList.remove(num-1);
			return 1;
		}
		return 0;
	}

}
