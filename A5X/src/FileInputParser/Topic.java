package FileInputParser;

import java.util.ArrayList;

public class Topic {
	private String url;
	private String number;
	private String chapter;
	private String title;
	private ArrayList<Program> programs = new ArrayList<Program>();
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getChapter() {
		return chapter;
	}
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public ArrayList<Program> getPrograms() {
		return programs;
	}
	public void setPrograms(ArrayList<Program> programs) {
		this.programs = programs;
	}
	
	
}
