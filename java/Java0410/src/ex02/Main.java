package ex02;

import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Salad s = new Salad();
//		s.makeSalad();
		
		Salad k = new KMSalad();
		k.makeSalad();
		
		Salad m = new MMSalad();
		m.makeSalad();

		Salad d = new SDSalad();
		d.makeSalad();
		
		ArrayList<Salad> salads = new ArrayList<Salad>();
//		salads.add(s);
		salads.add(k);
		salads.add(m);
		salads.add(d);
		
		for (int i = 0; i<salads.size();i++) {
			salads.get(i).makeSalad();
		}
		
		//down casting
		KMSalad km = (KMSalad) k;
		km.hbdDance();
		
		
	}

}
