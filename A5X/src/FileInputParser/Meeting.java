package FileInputParser;

import java.util.ArrayList;

public class Meeting {
	
	private String type;
	private String room;
	private String section;
	private ArrayList<OfficeHour> meetingPeriods = new ArrayList<OfficeHour>();
	private ArrayList<Assistant> assistants = new ArrayList<Assistant>();
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public ArrayList<OfficeHour> getMeetingPeriods() {
		return meetingPeriods;
	}
	public void setMeetingPeriods(ArrayList<OfficeHour> meetingPeriods) {
		this.meetingPeriods = meetingPeriods;
	}
	public ArrayList<Assistant> getAssistants() {
		return assistants;
	}
	public void setAssistants(ArrayList<Assistant> assistants) {
		this.assistants = assistants;
	}
	
}
