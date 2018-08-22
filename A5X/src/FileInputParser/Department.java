package FileInputParser;

import java.util.ArrayList;

public class Department {
	
	private String longName;
	private String prefix;
	private ArrayList<Course> courses = new ArrayList<Course>();
	
	public String getLongname() {
		return longName;
	}
	public void setLongname(String longname) {
		this.longName = longname;
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public ArrayList<Course> getCourses() {
		return courses;
	}
	public void setCourses(ArrayList<Course> courses) {
		this.courses = courses;
	}	
	
}
