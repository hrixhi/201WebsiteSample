package FileInputParser;

import java.util.ArrayList;

public class Exam {
	private String semester;
	private String year;
	private ArrayList<Test> tests = new ArrayList<Test>();
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public ArrayList<Test> getTests() {
		return tests;
	}
	public void setTests(ArrayList<Test> tests) {
		this.tests = tests;
	}
	
	
	
}
