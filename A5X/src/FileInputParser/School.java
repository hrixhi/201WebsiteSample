package FileInputParser;

import java.util.ArrayList;

public class School {
	
	private String image;
	private String name;
	private ArrayList<Department> departments = new ArrayList<Department>();
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<Department> getDepartments() {
		return departments;
	}
	public void setDepartments(ArrayList<Department> departments) {
		this.departments = departments;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
