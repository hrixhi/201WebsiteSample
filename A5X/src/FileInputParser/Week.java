package FileInputParser;

import java.util.ArrayList;

public class Week {
	private String week;
	private ArrayList<Lab> labs = new ArrayList<Lab>();
	private ArrayList<Lecture> lectures = new ArrayList<Lecture>();
	
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public ArrayList<Lab> getLabs() {
		return labs;
	}
	public void setLabs(ArrayList<Lab> labs) {
		this.labs = labs;
	}
	public ArrayList<Lecture> getLectures() {
		return lectures;
	}
	public void setLectures(ArrayList<Lecture> lectures) {
		this.lectures = lectures;
	}
	
}
