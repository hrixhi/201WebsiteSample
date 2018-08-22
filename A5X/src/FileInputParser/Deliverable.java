package FileInputParser;

import java.util.ArrayList;

public class Deliverable {
	private String number;
	private String dueDate;
	private String title;
	private String gradePercentage;
	private ArrayList<File> files = new ArrayList<File>();
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGradePercentage() {
		return gradePercentage;
	}
	public void setGradePercentage(String gradePercentage) {
		this.gradePercentage = gradePercentage;
	}
	public ArrayList<File> getFiles() {
		return files;
	}
	public void setFiles(ArrayList<File> files) {
		this.files = files;
	}
	
	
}
