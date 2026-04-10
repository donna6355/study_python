package ex04;

import java.util.ArrayList;
import java.util.Scanner;

import jplayer.JMP3Player;

public class MusicPlayer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

			
			
		// JAR import : build path > configure build path > Libraries > classPath
		Music m1= new Music("Arirang","BTS","K-pop","/Users/donna/Desktop/study_python/java/mp3/10CM - 그라데이션.mp3");
		Music m2= new Music("Singing in the rain","Mir","K-pop","/Users/donna/Desktop/study_python/java/mp3/10CM - 그라데이션.mp3");
		Music m3= new Music("I like Chicken","Isaac","K-pop","/Users/donna/Desktop/study_python/java/mp3/10CM - 그라데이션.mp3");
		Music m4= new Music("Home sweet Home","Kim","K-pop","/Users/donna/Desktop/study_python/java/mp3/10CM - 그라데이션.mp3");
		Music m5= new Music("Dunkin","Cat","K-pop","/Users/donna/Desktop/study_python/java/mp3/10CM - 그라데이션.mp3");
		Music m6= new Music("Ciabata","Drunken Tiger","K-pop","/Users/donna/Desktop/study_python/java/mp3/10CM - 그라데이션.mp3");
//		m1.setGenre("K-pop");
//		m1.setTitle("Arirang");
//		m1.setSinger("BTS");
		
//		System.out.println(m1.getTitle());
//		System.out.println(m1.getSinger());
//		System.out.println(m1.getGenre());
		
		ArrayList<Music> musicList = new ArrayList<Music>();
		musicList.add(m1);
		musicList.add(m2);
		musicList.add(m3);
		musicList.add(m4);
		musicList.add(m5);
		musicList.add(m6);
		
		Scanner sc = new Scanner(System.in);
		int currentIdx = 0;
		JMP3Player player = new JMP3Player();
		
		while (true) {
			System.out.print("1.list 2.play 3.next 4.prev 5.pause 6.terminate");
			int menu = sc.nextInt();
			if (menu == 1) {
				System.out.println("====LIST====");
				for (int i = 0; i<musicList.size();i++) {
					System.out.println(i+1+". "+musicList.get(i).toString());
				}
				System.out.println("====LIST====");

			} else if (menu ==2) {
				System.out.println("====PLAY====");
				System.out.println(currentIdx+1+". "+musicList.get(currentIdx).toString());
				player.play(musicList.get(currentIdx).getPath());
			} else if (menu == 3) {
				player.stop();
				System.out.println("====NEXT====");
				if(currentIdx < musicList.size()-1) {
					currentIdx++;
				}else {
					currentIdx = 0;
				}
				System.out.println(currentIdx+1+". "+musicList.get(currentIdx).toString());

				player.play(musicList.get(currentIdx).getPath());
				
			} else if (menu == 4) {
				player.stop();
				System.out.println("====PREV====");
				if(currentIdx >0) {
					currentIdx--;
				}else {
					currentIdx = musicList.size()-1;
				}
				System.out.println(currentIdx+1+". "+musicList.get(currentIdx).toString());

				player.play(musicList.get(currentIdx).getPath());
			} else if (menu == 5) {
				player.stop();
				System.out.println("====PAUSE====");
				
			} else if (menu == 6) {
				player.stop();
				System.out.println("====TERMINATED====");
				break;
			}
			
		}
		
	}

}
