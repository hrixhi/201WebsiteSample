package FileInputParser;

import java.util.ArrayList;

public class Assignment {
	
	private String number;
	private String assignedDate;
	private String dueDate;
	private String title;
	private String url;
	private String gradePercentage;
	private ArrayList<File> files = new ArrayList<File>();
	private ArrayList<Deliverable> deliverables = new ArrayList<Deliverable>();
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getAssignedDate() {
		return assignedDate;
	}
	public void setAssignedDate(String assignedDate) {
		this.assignedDate = assignedDate;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	public ArrayList<Deliverable> getDeliverables() {
		return deliverables;
	}
	public void setDeliverables(ArrayList<Deliverable> deliverables) {
		this.deliverables = deliverables;
	}
	
	
}
