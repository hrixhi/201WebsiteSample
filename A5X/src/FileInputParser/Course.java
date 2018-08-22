package FileInputParser;

import java.util.ArrayList;

public class Course {
	
	private String number;
	private String year;
	private String units;
	private String title;
	private String term;
	private Syllabus syllabus;
	private ArrayList<StaffMember> staffMembers = new ArrayList<StaffMember>();
	private ArrayList<Meeting> meetings = new ArrayList<Meeting>();
	private ArrayList<Assignment> assignments = new ArrayList<Assignment>();
	private ArrayList<Exam> exams = new ArrayList<Exam>();
	private Schedule schedule;
	
	
	public ArrayList<StaffMember> getStaffMembers() {
		return staffMembers;
	}
	public void setStaffMembers(ArrayList<StaffMember> staffMembers) {
		this.staffMembers = staffMembers;
	}
	public ArrayList<Assignment> getAssignments() {
		return assignments;
	}
	public void setAssignments(ArrayList<Assignment> assignments) {
		this.assignments = assignments;
	}
	public ArrayList<Exam> getExams() {
		return exams;
	}
	public void setExams(ArrayList<Exam> exams) {
		this.exams = exams;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public ArrayList<StaffMember> getStaffmembers() {
		return staffMembers;
	}
	public void setStaffmembers(ArrayList<StaffMember> staffmembers) {
		this.staffMembers = staffmembers;
	}
	public ArrayList<Meeting> getMeetings() {
		return meetings;
	}
	public void setMeetings(ArrayList<Meeting> meetings) {
		this.meetings = meetings;
	}
	public String getUnits() {
		return units;
	}
	public void setUnits(String units) {
		this.units = units;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Syllabus getSyllabus() {
		return syllabus;
	}
	public void setSyllabus(Syllabus syllabus) {
		this.syllabus = syllabus;
	}
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
	
}
