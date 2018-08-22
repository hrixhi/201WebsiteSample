package FileInputParser;

import java.util.ArrayList;

public class StaffMember {
	
	private String type;
	private String id;
	private Name name = new Name();
	private String email;
	private String image;
	private String phone;
	private String office;
	private ArrayList<OfficeHour> officeHours = new ArrayList<OfficeHour>();
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public ArrayList<OfficeHour> getOfficeHours() {
		return officeHours;
	}
	public void setOfficeHours(ArrayList<OfficeHour> officeHours) {
		this.officeHours = officeHours;
	}
	public Name getName() {
		return name;
	}
	public void setName(Name name) {
		this.name = name;
	}
	
}
