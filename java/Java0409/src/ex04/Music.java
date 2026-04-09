package ex04;

public class Music {
	//Source > Generate getter and setter
	//Source > Generate constructor
	
	//VO value object, DTO data transform object 

	private String title;
	private String singer;
	private String genre;
	private String path;
	
	// 생성자를 정의하지 않으면 자동으로 생성된다 (컴파일러)
//	public Music( String title, String singer,String genre, String path) {
//		this.title = title;
//		this.singer = singer;
//		this.genre = genre;
//		this.path = path;
//		
//		System.out.println("Default Constructor!");
//	}

	public Music(String title, String singer, String genre, String path) {
		super();
		this.title = title;
		this.singer = singer;
		this.genre = genre;
		this.path = path;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
//	public void setTitle(String title) {
//		this.title = title;
//	}
//	public void setSinger (String singer) {
//		this.singer = singer;
//	}
//	public void setGenre(String genre) {
//		this.genre = genre;
//	}
//	public void setPath(String path) {
//		this.path = path;
//	}
//	public String getTitle() {
//		return this.title;
//	}
//	public String getSinger() {
//		return this.singer;
//	}
//	public String getGenre() {
//		return this.genre;
//	}
//	public String getPath() {
//		return this.path;
//	}
	
	public String toString() {
		return this.title + " - " +this.singer + " ("+this.genre+")";
	}
}
