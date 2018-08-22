package FileInputParser;

import java.util.ArrayList;

public class Schedule {

	private ArrayList<Textbook> textbooks = new ArrayList<Textbook>();
	private ArrayList<Week> weeks = new ArrayList<Week>();
	
	
	public ArrayList<Textbook> getTextbooks() {
		return textbooks;
	}
	public void setTextbooks(ArrayList<Textbook> textbooks) {
		this.textbooks = textbooks;
	}
	public ArrayList<Week> getWeeks() {
		return weeks;
	}
	public void setWeeks(ArrayList<Week> weeks) {
		this.weeks = weeks;
	}
	
}
