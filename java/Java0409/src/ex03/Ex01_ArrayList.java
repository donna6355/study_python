package ex03;

import java.util.ArrayList;

public class Ex01_ArrayList {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList<String> foodList = new ArrayList<String>();
		
		foodList.add("Salad");
		foodList.add("Fried Chicken");
		foodList.add("Falafel");
		foodList.add("Ciabata");
		foodList.add("Baguette");
		
//		System.out.println(foodList.get(0));
//		System.out.println(foodList.get(1));
//		System.out.println(foodList.get(2));
//		System.out.println(foodList.get(3));
//		System.out.println(foodList.get(4));
		
		System.out.println(foodList.size()); 
	
		for (int i =0; i<foodList.size();i++) {
			System.out.println(foodList.get(i));
		}
		
		foodList.remove(1);	
		
		for (String el : foodList) {
			System.out.println(el);
		}
	}

}
