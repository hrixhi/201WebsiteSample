package FileInputParser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.exceptions.jdbc4.CommunicationsException;

public class SQLConnection {

	private static Connection conn;
	private static PreparedStatement ps = null;
	private static String address;
	private static ResultSet rs;
	private static ResultSet rs1;
	private static ResultSet rs2;
	private static ResultSet rs3;
	private static ResultSet rs4;
	private static ResultSet rs5;
	private static ResultSet rs6;
	private static boolean isConnected = false;
	private static boolean isPopulated = false; 

	SQLConnection(String address) {
		this.setAddress(address);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(address);
			isConnected = true;
		} catch (ClassNotFoundException e) {
			isConnected = false;
		} catch (SQLException e) {
			isConnected = false;
		}
	}

	public boolean isConnected() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(address);	
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} 
		return true;
	}

	public static void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(address);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void close(){
		try{
			if (rs != null){
				rs.close();
				rs = null;
			}
			if(conn != null){
				conn.close();
				conn = null;
			}
			if(ps != null ){
				ps = null;
			}
		}catch(SQLException sqle){
			System.out.println("connection close error");
			sqle.printStackTrace();
		}
	}

	public void populateDatabase(SchoolDB schoolDB) {

		if(isPopulated()) {
			return;
		}

		connect();
		try {

			// School and department processing

			School school = schoolDB.getSchools().get(0);
			String departments = "";

			for(int i = 0; i<school.getDepartments().size(); i++) {
				if(i!=school.getDepartments().size()-1) {
					departments += String.valueOf(i+1) + ",";
				} else {
					departments += String.valueOf(i+1);
				}
			}

			ps = conn.prepareStatement("INSERT INTO School(name, image, departments) values(?, ?, ?)");
			ps.setString(1, school.getName());
			ps.setString(2, school.getImage());
			ps.setString(3, departments);
			ps.executeUpdate();

			// At this point School table filled correctly 
			// Now let's go for departments

			Department department = school.getDepartments().get(0);
			String courses ="";

			for(int i = 0; i<department.getCourses().size(); i++) {
				if(i!=department.getCourses().size()-1) {
					courses += String.valueOf(i+1) + ",";
				} else {
					courses += String.valueOf(i+1);
				}
			}

			ps = conn.prepareStatement("INSERT INTO Department(longName, prefix, courses) values(?, ?, ?)");
			ps.setString(1, department.getLongname());
			ps.setString(2, department.getPrefix());
			ps.setString(3, courses);
			ps.executeUpdate();

			// At this point department table filled carefully
			// Now lets go for courses

			Course course = department.getCourses().get(0);
			String staffmembers ="";
			String syllabus ="1";
			String meetings ="";
			String assignments ="";
			String exams = "";
			String schedule = "1";

			for(int i = 0; i<course.getStaffMembers().size(); i++) {
				if(i!=course.getStaffMembers().size()-1) {
					staffmembers += String.valueOf(i+1) + ",";
				} else {
					staffmembers += String.valueOf(i+1);
				}
			}

			for(int i = 0; i<course.getMeetings().size(); i++) {
				if(i!=course.getMeetings().size()-1) {
					meetings += String.valueOf(i+1) + ",";
				} else {
					meetings += String.valueOf(i+1);
				}
			}

			for(int i = 0; i<course.getAssignments().size(); i++) {
				if(i!=course.getAssignments().size()-1) {
					assignments += String.valueOf(i+1) + ",";
				} else {
					assignments += String.valueOf(i+1);
				}
			}

			for(int i = 0; i<course.getExams().size(); i++) {
				if(i!=course.getAssignments().size()-1) {
					exams += String.valueOf(i+1) + ",";
				} else {
					exams += String.valueOf(i+1);
				}
			}

			ps = conn.prepareStatement("INSERT INTO Course(number, year, units, title, term, syllabus, staffMembers, "
					+ "meetings, assignments, exams, schedule) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, course.getNumber());
			ps.setString(2, course.getYear());
			ps.setString(3, course.getUnits());
			ps.setString(4, course.getTitle());
			ps.setString(5, course.getTerm());
			ps.setString(6, syllabus);
			ps.setString(7, staffmembers);
			ps.setString(8, meetings);
			ps.setString(9, assignments);
			ps.setString(10, exams);
			ps.setString(11, schedule);
			ps.executeUpdate();

			// Lot more lines of code coming up 
			// At this point the course tabe is correctly filled
			// Let us quickly finish syllabus

			ps = conn.prepareStatement("INSERT INTO Syllabus(url) values(?)");
			ps.setString(1, course.getSyllabus().getUrl());
			ps.executeUpdate();

			// Done, 
			// now lets move to staff members
			int tempOH = 1;
			int tempN = 1;
			int tempT = 1;
			int tempA = 1;
			int tempF = 1;
			int tempD = 1;
			int tempDF = 1;
			int tempTe = 1;
			int tempW = 1;
			int tempTF = 1;
			int tempLA = 1;
			int tempLE = 1;
			int tempTo = 1;
			int tempLAF = 1;
			int tempP = 1;
			int tempPF = 1;

			ArrayList<StaffMember> staff = course.getStaffmembers();

			// staff loop
			for(int i = 0; i<staff.size(); i++) {

				String officehours = "";

				for(int j = 0; j<staff.get(i).getOfficeHours().size(); j++) {
					if(j!=staff.get(i).getOfficeHours().size()-1) {
						officehours += String.valueOf(tempOH) + ",";
					} else {
						officehours += String.valueOf(tempOH);
					}
					tempOH++;
				}

				if(officehours.equals("")) {
					officehours = null;
				}

				String name = String.valueOf(tempN);
				tempN++;

				ps = conn.prepareStatement("INSERT INTO StaffMembers(type, idx, email, image, phone, office, name, "
						+ "officeHours) values(?, ?, ?, ?, ?, ?, ?, ?)");
				ps.setString(1, staff.get(i).getType());
				ps.setString(2, staff.get(i).getId());
				ps.setString(3, staff.get(i).getEmail());
				ps.setString(4, staff.get(i).getImage());
				ps.setString(5, staff.get(i).getPhone());
				ps.setString(6, staff.get(i).getOffice());
				ps.setString(7, name);
				ps.setString(8, officehours);
				ps.executeUpdate();


				// Staff memebrs populated... lets populate their names and OHs as part of the same loop
				String fname = staff.get(i).getName().getFname();
				String lname = staff.get(i).getName().getLname();

				ps = conn.prepareStatement("INSERT INTO Names(fname, lname) values(?, ?)");
				ps.setString(1, fname);
				ps.setString(2, lname);
				ps.executeUpdate();

				for(int j = 0; j<staff.get(i).getOfficeHours().size(); j++) {	// office hours loop

					String day = staff.get(i).getOfficeHours().get(j).getDay();
					String start = staff.get(i).getOfficeHours().get(j).getTime().getStart();
					String end = staff.get(i).getOfficeHours().get(j).getTime().getEnd();
					String time = String.valueOf(tempT);

					ps = conn.prepareStatement("INSERT INTO OfficeHours(day, time) values(?, ?)");
					ps.setString(1, day);
					ps.setString(2, time);
					ps.executeUpdate();

					ps = conn.prepareStatement("INSERT INTO Time(start, end) values(?, ?)");
					ps.setString(1, start);
					ps.setString(2, end);
					ps.executeUpdate();

					tempT++;

				}	// end of office hours loop		
			}	// end of staff loop

			// At this point staff members part is complete and added
			// good progress
			// Lets move onto the meetings part of it

			ArrayList<Meeting> meetingsArray = course.getMeetings();

			for(int i = 0; i<meetingsArray.size(); i++) {

				String officehours = "";

				for(int j = 0; j<meetingsArray.get(i).getMeetingPeriods().size(); j++) {
					if(j!=meetingsArray.get(i).getMeetingPeriods().size()-1) {
						officehours += String.valueOf(tempOH) + ",";
					} else {
						officehours += String.valueOf(tempOH);
					}
					tempOH++;
				}

				String assistants = "";

				if(meetingsArray.get(i).getType().equals("lecture")) {
					assistants = String.valueOf(tempA);
					tempA++;
					ps = conn.prepareStatement("INSERT INTO Assistants(staffMemberID) values(?)");
					ps.setString(1, meetingsArray.get(i).getAssistants().get(0).getStaffMemberID());
					ps.executeUpdate();
				} else if(meetingsArray.get(i).getType().equals("lab")) {
					for(int k = 0; k<meetingsArray.get(i).getAssistants().size(); k++) {
						if(k!=meetingsArray.get(i).getAssistants().size()-1) {
							assistants += String.valueOf(tempA) + ",";
						} else {
							assistants += String.valueOf(tempA);
						}
						tempA++;
					}
				}

				if(assistants.equals("")) {
					assistants = null;
				}

				ps = conn.prepareStatement("INSERT INTO Meetings(type, room, section, meetingPeriods, assistants) values(?, ?, ?, ?, ?)");
				ps.setString(1, meetingsArray.get(i).getType());
				ps.setString(2, meetingsArray.get(i).getRoom());
				ps.setString(3, meetingsArray.get(i).getSection());
				ps.setString(4, officehours);
				ps.setString(5, assistants);
				ps.executeUpdate();

				// so meetings has been populated now lets populate its office hours and also assistants
				// assistants
				if(meetingsArray.get(i).getType().equals("lecture") || meetingsArray.get(i).getType().equals("lab")) {
					ArrayList<Assistant> assists = meetingsArray.get(i).getAssistants();

					for(int j = 0; j<assists.size(); j++) {
						ps = conn.prepareStatement("INSERT INTO Assistants(staffMemberID) values(?)");
						ps.setString(1, assists.get(j).getStaffMemberID());
						ps.executeUpdate();
					}

				}
				// office hours again

				for(int j = 0; j<meetingsArray.get(i).getMeetingPeriods().size(); j++) {	// office hours loop

					String day = meetingsArray.get(i).getMeetingPeriods().get(j).getDay();
					String start = meetingsArray.get(i).getMeetingPeriods().get(j).getTime().getStart();
					String end = meetingsArray.get(i).getMeetingPeriods().get(j).getTime().getEnd();
					String time = String.valueOf(tempT);

					ps = conn.prepareStatement("INSERT INTO OfficeHours(day, time) values(?, ?)");
					ps.setString(1, day);
					ps.setString(2, time);
					ps.executeUpdate();

					ps = conn.prepareStatement("INSERT INTO Time(start, end) values(?, ?)");
					ps.setString(1, start);
					ps.setString(2, end);
					ps.executeUpdate();

					tempT++;

				}	// end of office hours loop		

			}	// end of meetings loop

			// At this point, for courses, meetings as well as the staff members
			// It is now time to populate the assignments table 

			ArrayList<Assignment> assignmentsArray = course.getAssignments();

			for(int i = 0; i<assignmentsArray.size(); i++) {

				String files = "";

				for(int j = 0; j<assignmentsArray.get(i).getFiles().size(); j++) {
					if(j!=assignmentsArray.get(i).getFiles().size()-1) {
						files += String.valueOf(tempF) + ",";
					} else {
						files += String.valueOf(tempF);
					}
					tempF++;
				}

				if(files.equals("")) {
					files = null;
				}

				String delivs = "";

				for(int j = 0; j<assignmentsArray.get(i).getDeliverables().size(); j++) {
					if(j!=assignmentsArray.get(i).getDeliverables().size()-1) {
						delivs += String.valueOf(tempD) + ",";
					} else {
						delivs += String.valueOf(tempD);
					}
					tempD++;
				}

				if(delivs.equals("")) {
					delivs = null;
				}

				ps = conn.prepareStatement("INSERT INTO Assignments(number, title, assignedDate, dueDate, url, gradePercentage, files, deliverables) values(?, ?, ?, ?, ?, ?, ?, ?)");
				ps.setString(1, assignmentsArray.get(i).getNumber());
				ps.setString(2, assignmentsArray.get(i).getTitle());
				ps.setString(3, assignmentsArray.get(i).getAssignedDate());
				ps.setString(4, assignmentsArray.get(i).getDueDate());
				ps.setString(5, assignmentsArray.get(i).getUrl());
				ps.setString(6, assignmentsArray.get(i).getGradePercentage());
				ps.setString(7, files);
				ps.setString(8, delivs);
				ps.executeUpdate();

				// at this point the assignments thing is done, lets populate the files and delivs now
				for(int j = 0; j<assignmentsArray.get(i).getFiles().size(); j++) {
					ps = conn.prepareStatement("INSERT INTO Files(number, url, title) values(?, ?, ?)");
					ps.setString(1, assignmentsArray.get(i).getFiles().get(j).getNumber());
					ps.setString(2, assignmentsArray.get(i).getFiles().get(j).getUrl());
					ps.setString(3, assignmentsArray.get(i).getFiles().get(j).getTitle());
					ps.executeUpdate();
				} // end of files loop

				for(int j = 0; j<assignmentsArray.get(i).getDeliverables().size(); j++) {

					String delivFiles = "";

					for(int k = 0; k<assignmentsArray.get(i).getDeliverables().get(j).getFiles().size(); k++) {
						if(k!=assignmentsArray.get(i).getDeliverables().get(j).getFiles().size()-1) {
							delivFiles += String.valueOf(tempDF) + ",";
						} else {
							delivFiles += String.valueOf(tempDF);
						}
						tempDF++;


						ps = conn.prepareStatement("INSERT INTO DelivFiles(number, url, title) values(?, ?, ?)");
						ps.setString(1, assignmentsArray.get(i).getDeliverables().get(j).getFiles().get(k).getNumber());
						ps.setString(2,  assignmentsArray.get(i).getDeliverables().get(j).getFiles().get(k).getUrl());
						ps.setString(3, assignmentsArray.get(i).getDeliverables().get(j).getFiles().get(k).getTitle());
						ps.executeUpdate();

					}

					if(delivFiles.equals("")) {
						delivFiles = null;
					}

					ps = conn.prepareStatement("INSERT INTO Deliverables(number, gradePercentage, dueDate, title, delivFiles) values(?, ?, ?, ?, ?)");
					ps.setString(1, assignmentsArray.get(i).getDeliverables().get(j).getNumber());
					ps.setString(2, assignmentsArray.get(i).getDeliverables().get(j).getGradePercentage());
					ps.setString(3, assignmentsArray.get(i).getDeliverables().get(j).getDueDate());
					ps.setString(4, assignmentsArray.get(i).getDeliverables().get(j).getTitle());
					ps.setString(5, delivFiles);
					ps.executeUpdate();


				} // end of delivs loop

			} // end of assignments loop

			// At this point all assignments including their files and deliverables have been added
			// it is now time to move to exams which is second last part

			ArrayList<Exam> examArray = course.getExams();

			for(int i = 0; i<examArray.size(); i++) {

				String tests = "";

				for(int j = 0; j<examArray.get(i).getTests().size(); j++) {
					if(j!=examArray.get(i).getTests().size()-1) {
						tests += String.valueOf(tempTe) + ",";
					} else {
						tests += String.valueOf(tempTe);
					}
					tempTe++;
				}

				ps = conn.prepareStatement("INSERT INTO Exams(semester, year, tests) values(?, ?, ?)");
				ps.setString(1, examArray.get(i).getSemester());
				ps.setString(2, examArray.get(i).getYear());
				ps.setString(3, tests);
				ps.executeUpdate();

				// now lets fill the tests thing
				for(int j = 0; j<examArray.get(i).getTests().size(); j++) {

					String testFiles = "";

					for(int k = 0; k<examArray.get(i).getTests().get(j).getFiles().size(); k++) {
						if(k!=examArray.get(i).getTests().get(j).getFiles().size()-1) {
							testFiles += String.valueOf(tempTF) + ",";
						} else {
							testFiles += String.valueOf(tempTF);
						}
						tempTF++;

						ps = conn.prepareStatement("INSERT INTO TestFiles(number, url, title) values(?, ?, ?)");
						ps.setString(1, examArray.get(i).getTests().get(j).getFiles().get(k).getNumber());
						ps.setString(2,  examArray.get(i).getTests().get(j).getFiles().get(k).getUrl());
						ps.setString(3, examArray.get(i).getTests().get(j).getFiles().get(k).getTitle());
						ps.executeUpdate();

					}

					ps = conn.prepareStatement("INSERT INTO Tests(title, testFiles) values(?, ?)");
					ps.setString(1, examArray.get(i).getTests().get(j).getTitle());
					ps.setString(2, testFiles);
					ps.executeUpdate();
				} // end of test loop

			} // end of exams loop

			// So all original arraylists inside the course class are filled
			// it is now time for the final part - schedule

			Schedule scheduleObj = course.getSchedule(); // Processing should happen outside a main loop

			String weeks = "";

			for(int i = 0; i<scheduleObj.getWeeks().size(); i++) {
				if(i!=scheduleObj.getWeeks().size()-1) {
					weeks += String.valueOf(tempW) + ",";
				} else {
					weeks += String.valueOf(tempW);
				}
				tempW++;
			}

			ps = conn.prepareStatement("INSERT INTO Schedule(textbooks, weeks) values(?, ?)");
			ps.setString(1, "1");
			ps.setString(2, weeks);
			ps.executeUpdate();

			// Schedule filled in, lets fill in textbook now
			// hello and wecom e t

			Textbook book = scheduleObj.getTextbooks().get(0);
			ps = conn.prepareStatement("INSERT INTO Textbook(number, author, title, publisher, year, isbn) values(?, ?, ?, ?, ?, ?)");
			ps.setString(1, book.getNumber());
			ps.setString(2, book.getAuthor());
			ps.setString(3, book.getTitle());
			ps.setString(4, book.getPublisher());
			ps.setString(5, book.getYear());
			ps.setString(6, book.getIsbn());
			ps.executeUpdate();

			// final part - weeks

			ArrayList<Week> weeksArray = scheduleObj.getWeeks();

			for(int i = 0; i<weeksArray.size(); i++) {
				String labs = "";
				String lectures = "";

				for(int j = 0; j<weeksArray.get(i).getLectures().size(); j++) {

					if(j!=weeksArray.get(i).getLectures().size()-1) {
						lectures += String.valueOf(tempLE) + ",";
					} else {
						lectures += String.valueOf(tempLE);
					}
					tempLE++;

					String topics = "";

					for(int k = 0; k<weeksArray.get(i).getLectures().get(j).getTopics().size(); k++)  {

						if(k!=weeksArray.get(i).getLectures().get(j).getTopics().size()-1) {
							topics += String.valueOf(tempTo) + ",";
						} else {
							topics += String.valueOf(tempTo);
						}
						tempTo++;

						String programs = "";

						for(int l = 0; l<weeksArray.get(i).getLectures().get(j).getTopics().get(k).getPrograms().size(); l++) {
							if(l!=weeksArray.get(i).getLectures().get(j).getTopics().get(k).getPrograms().size()-1) {
								programs += String.valueOf(tempP) + ",";
							} else {
								programs += String.valueOf(tempP);
							}
							tempP++;

							String programfiles = "";

							for(int m = 0; m<weeksArray.get(i).getLectures().get(j).getTopics().get(k).getPrograms().get(l).getFiles().size(); m++) {
								if(m!=weeksArray.get(i).getLectures().get(j).getTopics().get(k).getPrograms().get(l).getFiles().size()-1) {
									programfiles += String.valueOf(tempPF) + ",";
								} else {
									programfiles += String.valueOf(tempPF);
								}
								tempPF++;

								ps = conn.prepareStatement("INSERT INTO ProgramFiles(number, url, title) values(?, ?, ?)");
								ps.setString(1, weeksArray.get(i).getLectures().get(j).getTopics().get(k).getPrograms().get(l).getFiles().get(m).getNumber());
								ps.setString(2,  weeksArray.get(i).getLectures().get(j).getTopics().get(k).getPrograms().get(l).getFiles().get(m).getUrl());
								ps.setString(3, weeksArray.get(i).getLectures().get(j).getTopics().get(k).getPrograms().get(l).getFiles().get(m).getTitle());
								ps.executeUpdate();

							}

							if(programfiles.equals("")) {
								programfiles = null;
							}

							ps = conn.prepareStatement("INSERT INTO Programs(programFiles) values(?)");
							ps.setString(1, programfiles);
							ps.executeUpdate();

						}		

						if(programs.equals("")) {
							programs = null;
						}

						ps = conn.prepareStatement("INSERT INTO Topics(url, number, chapter, title, programs) values(?, ?, ?, ?, ?)");
						ps.setString(1, weeksArray.get(i).getLectures().get(j).getTopics().get(k).getUrl());
						ps.setString(2, weeksArray.get(i).getLectures().get(j).getTopics().get(k).getNumber());
						ps.setString(3, weeksArray.get(i).getLectures().get(j).getTopics().get(k).getChapter());
						ps.setString(4, weeksArray.get(i).getLectures().get(j).getTopics().get(k).getTitle());
						ps.setString(5, programs);
						ps.executeUpdate();

					}

					ps = conn.prepareStatement("INSERT INTO Lectures(number, day, date, topics) values(?, ?, ?, ?)");
					ps.setString(1, weeksArray.get(i).getLectures().get(j).getNumber());
					ps.setString(2, weeksArray.get(i).getLectures().get(j).getDay());
					ps.setString(3, weeksArray.get(i).getLectures().get(j).getDate());
					ps.setString(4, topics);
					ps.executeUpdate();

				} // end of lectures loop

				for(int j = 0; j<weeksArray.get(i).getLabs().size(); j++) {

					if(j!=weeksArray.get(i).getLabs().size()-1) {
						labs += String.valueOf(tempLA) + ",";
					} else {
						labs += String.valueOf(tempLA);
					}
					tempLA++;

					String labFiles = "";

					for(int k = 0; k<weeksArray.get(i).getLabs().get(j).getFiles().size(); k++) {
						if(k!=weeksArray.get(i).getLabs().get(j).getFiles().size()-1) {
							labFiles += String.valueOf(tempLAF) + ",";
						} else {
							labFiles += String.valueOf(tempLAF);
						}
						tempLAF++;

						ps = conn.prepareStatement("INSERT INTO LabFiles(number, url, title) values(?, ?, ?)");
						ps.setString(1, weeksArray.get(i).getLabs().get(j).getFiles().get(k).getNumber());
						ps.setString(2,  weeksArray.get(i).getLabs().get(j).getFiles().get(k).getUrl());
						ps.setString(3, weeksArray.get(i).getLabs().get(j).getFiles().get(k).getTitle());
						ps.executeUpdate();

					}

					if(labFiles.equals("")) {
						labFiles = null;
					}

					ps = conn.prepareStatement("INSERT INTO Labs(number, url, title, labFiles) values(?, ?, ?, ?)");
					ps.setString(1, weeksArray.get(i).getLabs().get(j).getNumber());
					ps.setString(2, weeksArray.get(i).getLabs().get(j).getUrl());
					ps.setString(3, weeksArray.get(i).getLabs().get(j).getTitle());
					ps.setString(4, labFiles);
					ps.executeUpdate();

				} // end of labs loop

				ps = conn.prepareStatement("INSERT INTO Weeks(week, labs, lectures) values(?, ?, ?)");
				ps.setString(1, weeksArray.get(i).getWeek());
				ps.setString(2, labs);
				ps.setString(3, lectures);
				ps.executeUpdate();

			} // end of weeks loop

			// Everything inserted at this point!
			isPopulated = true;
			// Function complete
		} catch (SQLException e) {
			System.out.println("SQLException in insert function");
			e.printStackTrace();
		} finally{
			close();
		}
	}

	public void retrieveDatabaseAttributes(HttpSession currentSession) {

		// In the end remember to set attributes for the session that has been passed in
		connect();
		try {
			SchoolDB schoolDB = new SchoolDB();
			School school = new School();

			schoolDB.getSchools().add(school);
			school = schoolDB.getSchools().get(0);

			ps = conn.prepareStatement("SELECT * from School");
			rs = ps.executeQuery();

			if(rs.next()) {
				school.setName(rs.getString("name"));
				school.setName(rs.getString("image"));
			}

			// School set without department

			ps = conn.prepareStatement("SELECT * from Department");
			rs = ps.executeQuery();

			if(rs.next()) {
				Department dep = new Department();
				dep.setLongname(rs.getString("longName"));
				dep.setPrefix(rs.getString("prefix"));
				school.getDepartments().add(dep);
			}

			// Department set without course
			// School fully set with department

			Department dep = school.getDepartments().get(0);

			ps = conn.prepareStatement("SELECT * from Course");
			rs = ps.executeQuery();

			if(rs.next()) {
				Course course = new Course();
				course.setNumber(rs.getString("number"));
				course.setYear(rs.getString("year"));
				course.setUnits(rs.getString("units"));
				course.setTitle(rs.getString("title"));
				course.setTerm(rs.getString("term"));
				dep.getCourses().add(course);
			}

			// Course set without its interior
			// Department fully set with course

			Course course = dep.getCourses().get(0);

			ps = conn.prepareStatement("SELECT * from Syllabus");
			rs = ps.executeQuery();

			if(rs.next()) {
				Syllabus syllabus = new Syllabus();
				syllabus.setUrl(rs.getString("url"));
				course.setSyllabus(syllabus);
			}

			// Syllabus added to course
			// Time for staffmembers

			ps = conn.prepareStatement("SELECT * from StaffMembers");
			rs = ps.executeQuery();

			ArrayList<StaffMember> staff = new ArrayList<StaffMember>();

			while(true) {
				if(rs.next()) {
					StaffMember newGuy = new StaffMember();
					newGuy.setType(rs.getString("type"));
					newGuy.setId(rs.getString("id"));
					newGuy.setImage(rs.getString("image"));
					newGuy.setEmail(rs.getString("email"));
					newGuy.setOffice(rs.getString("office"));
					newGuy.setPhone(rs.getString("phone"));
					if(rs.getString("officeHours")!=null) {
						String[] hours = rs.getString("officeHours").split(",");

						ArrayList<OfficeHour> OHours = new ArrayList<OfficeHour>();

						for(int i = 0; i<hours.length; i++) {
							OfficeHour OH = new OfficeHour();
							ps = conn.prepareStatement("SELECT * from OfficeHours WHERE ID=?");
							ps.setInt(1, Integer.parseInt(hours[i]));
							rs1 = ps.executeQuery();
							ps = conn.prepareStatement("SELECT * from Time WHERE ID=?");
							ps.setInt(1, Integer.parseInt(hours[i]));
							rs2 = ps.executeQuery();
							if(rs1.next()) {
								OH.setDay(rs1.getString("day"));
							} 
							if(rs2.next()) {
								Time time = new Time();
								time.setStart(rs2.getString("start"));
								time.setEnd(rs2.getString("end"));
								OH.setTime(time);
							}
							OHours.add(OH);
						}

						newGuy.setOfficeHours(OHours);
					}


					ps = conn.prepareStatement("SELECT * from Names WHERE ID=?");
					ps.setInt(1, Integer.parseInt(rs.getString("name")));
					rs1 = ps.executeQuery();
					Name name = new Name();
					if(rs1.next()) {
						name.setFname(rs1.getString("fname"));
						name.setLname(rs1.getString("lname"));
					}
					newGuy.setName(name);
					staff.add(newGuy);
				} else {
					break;
				}
			}

			course.setStaffmembers(staff);

			// At this point the staff members retrieval is complete 
			// staff array has been added to course
			// course is still wildly incomplete though ... now is the time for meetings

			ps = conn.prepareStatement("SELECT * from Meetings");
			rs = ps.executeQuery();

			ArrayList<Meeting> meetings = new ArrayList<Meeting>();

			while(true) {
				if(rs.next()) {
					Meeting meeting = new Meeting();
					meeting.setType(rs.getString("type"));
					meeting.setSection(rs.getString("section"));
					meeting.setRoom(rs.getString("room"));

					String[] hours = rs.getString("meetingPeriods").split(",");

					ArrayList<OfficeHour> OHours = new ArrayList<OfficeHour>();
					for(int i = 0; i<hours.length; i++) {
						OfficeHour OH = new OfficeHour();
						ps = conn.prepareStatement("SELECT * from OfficeHours WHERE ID=?");
						ps.setInt(1, Integer.parseInt(hours[i]));
						rs1 = ps.executeQuery();
						ps = conn.prepareStatement("SELECT * from Time WHERE ID=?");
						ps.setInt(1, Integer.parseInt(hours[i]));
						rs2 = ps.executeQuery();
						if(rs1.next()) {
							OH.setDay(rs1.getString("day"));
						} 
						if(rs2.next()) {
							Time time = new Time();
							time.setStart(rs2.getString("start"));
							time.setEnd(rs2.getString("end"));
							OH.setTime(time);
						}
						OHours.add(OH);
					}
					meeting.setMeetingPeriods(OHours);

					if(rs.getString("assistants")!=null) {
						String[] assists = rs.getString("assistants").split(",");
						ArrayList<Assistant> assistants = new ArrayList<Assistant>();
						for(int i = 0; i<assists.length; i++) {
							Assistant A = new Assistant();
							ps = conn.prepareStatement("SELECT * from Assistants WHERE ID=?");
							ps.setInt(1, Integer.parseInt(assists[i]));
							rs1 = ps.executeQuery();
							if(rs1.next()) {
								A.setStaffMemberID(rs1.getString("staffMemberID"));
							}
							assistants.add(A);
						}
						meeting.setAssistants(assistants);

					}
					meetings.add(meeting);
				} else {
					break;
				}
			}

			course.setMeetings(meetings);
			// meetings taken care of fully at this point
			// Still on courses - now on assignments
			ps = conn.prepareStatement("SELECT * from Assignments");
			rs = ps.executeQuery();

			ArrayList<Assignment> assignments = new ArrayList<Assignment>();

			while(true) {
				if(rs.next()) {
					Assignment assignment = new Assignment();
					assignment.setNumber(rs.getString("number"));
					assignment.setAssignedDate(rs.getString("assignedDate"));
					assignment.setDueDate(rs.getString("dueDate"));
					assignment.setTitle(rs.getString("title"));
					assignment.setUrl(rs.getString("url"));
					assignment.setGradePercentage(rs.getString("gradePercentage"));

					if(rs.getString("files")!=null) {
						String[] fileID = rs.getString("files").split(",");


						ArrayList<File> files = new ArrayList<File>();

						for(int i = 0; i<fileID.length; i++) {
							File F = new File();
							ps = conn.prepareStatement("SELECT * from Files WHERE ID=?");
							ps.setInt(1, Integer.parseInt(fileID[i]));
							rs1 = ps.executeQuery();
							if(rs1.next()) {
								F.setNumber(rs1.getString("number"));
								F.setUrl(rs1.getString("url"));
								F.setTitle(rs1.getString("title"));
							}
							files.add(F);
						}
						assignment.setFiles(files);
					}

					if(rs.getString("deliverables")!=null) {
						String[] delivs = rs.getString("deliverables").split(",");
						ArrayList<Deliverable> deliverables = new ArrayList<Deliverable>();
						for(int i =0; i<delivs.length; i++) {
							Deliverable D = new Deliverable();
							ps = conn.prepareStatement("SELECT * from Deliverables WHERE ID=?");
							ps.setInt(1, Integer.parseInt(delivs[i]));
							rs1 = ps.executeQuery();
							if(rs1.next()) {
								D.setGradePercentage(rs1.getString("gradePercentage"));
								D.setNumber(rs1.getString("number"));
								D.setDueDate(rs1.getString("dueDate"));
								D.setTitle(rs1.getString("title"));
								if(rs1.getString("delivFiles")!=null) {
									String[] fileIDD = rs1.getString("delivFiles").split(",");
									ArrayList<File> delivfiles = new ArrayList<File>();

									for(int j = 0; j<fileIDD.length; j++) {
										File F = new File();
										ps = conn.prepareStatement("SELECT * from DelivFiles WHERE ID=?");
										ps.setInt(1, Integer.parseInt(fileIDD[j]));
										rs1 = ps.executeQuery();
										if(rs1.next()) {
											F.setNumber(rs1.getString("number"));
											F.setUrl(rs1.getString("url"));
											F.setTitle(rs1.getString("title"));
										}
										delivfiles.add(F);
									}
									D.setFiles(delivfiles);
								}
							}
							deliverables.add(D);
						}
						assignment.setDeliverables(deliverables);
					}

					assignments.add(assignment);
				} else {
					break;
				}
			}
			course.setAssignments(assignments);
			// assignments over and out - that was fast lol
			// lets continue with whats next in course - exam
			ps = conn.prepareStatement("SELECT * from Exams");
			rs = ps.executeQuery();

			ArrayList<Exam> exams= new ArrayList<Exam>();
			while(true) {
				if(rs.next()) {
					Exam E = new Exam();
					E.setSemester(rs.getString("semester"));
					E.setYear(rs.getString("year"));
					String[] testID = rs.getString("tests").split(",");

					ArrayList<Test> tests = new ArrayList<Test>();

					for(int i = 0; i<testID.length; i++) {
						Test T = new Test();
						ps = conn.prepareStatement("SELECT * from Tests WHERE ID=?");
						ps.setInt(1, Integer.parseInt(testID[i]));
						rs1 = ps.executeQuery();
						if(rs1.next()) {
							T.setTitle(rs1.getString("title"));

							// System.out.println(T.getTitle());

							String[] fileIDD = rs1.getString("testFiles").split(",");
							ArrayList<File> testfiles = new ArrayList<File>();

							for(int j = 0; j<fileIDD.length; j++) {
								File F = new File();
								ps = conn.prepareStatement("SELECT * from TestFiles WHERE ID=?");
								ps.setInt(1, Integer.parseInt(fileIDD[j]));
								rs2 = ps.executeQuery();
								if(rs2.next()) {
									F.setNumber(rs2.getString("number"));
									F.setUrl(rs2.getString("url"));
									F.setTitle(rs2.getString("title"));
								}
								testfiles.add(F);
							}

							T.setFiles(testfiles);
							tests.add(T);
						}
					}
					E.setTests(tests);
					exams.add(E);
				} else {
					break;
				}
			}
			course.setExams(exams);
			// exams also done
			// now time for the last part - schedule
			ps = conn.prepareStatement("SELECT * from Schedule");
			rs = ps.executeQuery();

			Schedule schedule = new Schedule();

			if(rs.next()) {
				ArrayList<Textbook> textbooks = new ArrayList<Textbook>();
				ArrayList<Week> weeks = new ArrayList<Week>();

				String[] tb = rs.getString("textbooks").split(",");
				String[] weeksID = rs.getString("weeks").split(",");

				for(int i = 0; i<tb.length; i++) {
					Textbook TB = new Textbook();
					ps = conn.prepareStatement("SELECT * from Textbook WHERE ID=?");
					ps.setInt(1, Integer.parseInt(tb[i]));
					rs1 = ps.executeQuery();
					if(rs1.next()) {
						TB.setAuthor(rs1.getString("author"));
						TB.setIsbn(rs1.getString("isbn"));
						TB.setNumber(rs1.getString("number"));
						TB.setPublisher(rs1.getString("publisher"));
						TB.setTitle(rs1.getString("title"));
						TB.setYear(rs1.getString("year"));
						textbooks.add(TB);
					}
				}

				for(int i = 0; i<weeksID.length; i++) {
					Week week = new Week();
					ps = conn.prepareStatement("SELECT * from Weeks WHERE ID=?");
					ps.setInt(1, Integer.parseInt(weeksID[i]));
					rs1 = ps.executeQuery();
					if(rs1.next()) {
						week.setWeek(rs1.getString("week"));
						String[] lecs = rs1.getString("lectures").split(",");
						String[] lbs = rs1.getString("labs").split(",");
						ArrayList<Lab> labs = new ArrayList<Lab>();
						ArrayList<Lecture> lectures = new ArrayList<Lecture>();

						for(int j = 0; j<lecs.length; j++) {
							Lecture L = new Lecture();
							ps = conn.prepareStatement("SELECT * from Lectures WHERE ID=?");
							ps.setInt(1, Integer.parseInt(lecs[j]));
							rs2 = ps.executeQuery();
							if(rs2.next()) {
								L.setDate(rs2.getString("date"));
								L.setDay(rs2.getString("day"));
								L.setNumber(rs2.getString("number"));
								ArrayList<Topic> topics = new ArrayList<Topic>();
								String[] tops = rs2.getString("topics").split(",");

								for(int k = 0; k<tops.length; k++) {
									Topic T = new Topic();
									ps = conn.prepareStatement("SELECT * from Topics WHERE ID=?");
									ps.setInt(1, Integer.parseInt(tops[k]));
									rs3 = ps.executeQuery();
									if(rs3.next()) {
										T.setChapter(rs3.getString("chapter"));
										T.setUrl(rs3.getString("url"));
										T.setNumber(rs3.getString("number"));
										T.setTitle(rs3.getString("title"));
										if(rs3.getString("programs")!=null) {
											String[] progs = rs3.getString("programs").split(",");
											ArrayList<Program> programs = new ArrayList<Program>();

											for(int l = 0; l<progs.length; l++) {
												Program P = new Program();
												ps = conn.prepareStatement("SELECT * from Programs WHERE ID=?");
												ps.setInt(1, Integer.parseInt(progs[l]));
												rs5 = ps.executeQuery();

												if(rs5.next()) {
													if(rs5.getString("programFiles")!=null) {
														String[] fileIDD = rs5.getString("programFiles").split(",");
														ArrayList<File> programfiles = new ArrayList<File>();

														for(int m = 0; m<fileIDD.length; m++) {
															File F = new File();
															ps = conn.prepareStatement("SELECT * from ProgramFiles WHERE ID=?");
															ps.setInt(1, Integer.parseInt(fileIDD[m]));
															rs6 = ps.executeQuery();
															if(rs6.next()) {
																F.setNumber(rs6.getString("number"));
																F.setUrl(rs6.getString("url"));
																F.setTitle(rs6.getString("title"));
															}
															programfiles.add(F);
														}
														P.setFiles(programfiles);
													}
												}

												programs.add(P);
											}

											T.setPrograms(programs);
										}
									}
									topics.add(T);
								}

								L.setTopics(topics);
							}
							lectures.add(L);
						}

						for(int j = 0; j<lbs.length; j++) {
							Lab L = new Lab();
							ps = conn.prepareStatement("SELECT * from Labs WHERE ID=?");
							ps.setInt(1, Integer.parseInt(lbs[j]));
							rs2 = ps.executeQuery();
							if(rs2.next()) {
								L.setNumber(rs2.getString("number"));
								L.setTitle(rs2.getString("title"));
								L.setUrl(rs2.getString("url"));
								if(rs2.getString("labFiles")!=null) {
									String[] fileIDD = rs2.getString("labFiles").split(",");
									ArrayList<File> labfiles = new ArrayList<File>();

									for(int m = 0; m<fileIDD.length; m++) {
										File F = new File();
										ps = conn.prepareStatement("SELECT * from LabFiles WHERE ID=?");
										ps.setInt(1, Integer.parseInt(fileIDD[m]));
										rs3 = ps.executeQuery();
										if(rs3.next()) {
											F.setNumber(rs3.getString("number"));
											F.setUrl(rs3.getString("url"));
											F.setTitle(rs3.getString("title"));
										}
										labfiles.add(F);
									}
									L.setFiles(labfiles);
								}
							}
							labs.add(L);
						}

						week.setLabs(labs);
						week.setLectures(lectures);
					}
					weeks.add(week);
				}

				schedule.setTextbooks(textbooks);
				schedule.setWeeks(weeks);
			}

			course.setSchedule(schedule);

			// end of it all
			// now current session attributes!!

			currentSession.setAttribute("course", course);
			currentSession.setAttribute("department", dep);
			currentSession.setAttribute("school", school);

			// end of function

		} catch (SQLException e) {
			System.out.println("SQLException in retrieve function");
			e.printStackTrace();
		} finally{
			close();
		}

	}

	public String getAddress() {
		return address;
	}

	public void sortAssignments(HttpSession currentSession, String sort, String kindOfSort) {
		connect();
		boolean temp1 = false;
		boolean temp2 = false;
		boolean temp3 = false;
		boolean temp4 = false;
		
		currentSession.setAttribute("aSort1", sort);
		currentSession.setAttribute("asort2", kindOfSort);
		
		try {
			if(sort.equals("assignedDate")) {
				if(kindOfSort.equals("asc")) {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY assignedDate ASC;");
					rs = ps.executeQuery();
					
				} else {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY assignedDate DESC;");
					rs = ps.executeQuery();
				}
			} else if(sort.equals("dueDate")) {
				if(kindOfSort.equals("asc")) {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY dueDate ASC;");
					rs = ps.executeQuery();
					temp1 = true;
				} else {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY dueDate DESC;");
					rs = ps.executeQuery(); temp2 = true;
				}
			} else {
				if(kindOfSort.equals("asc")) {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY gradePercentage ASC;");
					rs = ps.executeQuery();
					temp3 = true;
				} else {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY gradePercentage DESC;");
					rs = ps.executeQuery();
					temp4 = true;
				}
			}
		} catch(SQLException e) {

		}

		Course course = (Course) currentSession.getAttribute("course");
		ArrayList<Assignment> assignments = new ArrayList<Assignment>();

		int tempOH = 1;
		int tempN = 1;
		int tempT = 1;
		int tempA = 1;
		int tempF = 1;
		int tempD = 1;
		int tempDF = 1;
		int tempTe = 1;
		int tempW = 1;
		int tempTF = 1;
		int tempLA = 1;
		int tempLE = 1;
		int tempTo = 1;
		int tempLAF = 1;
		int tempP = 1;
		int tempPF = 1;


		try {
			while(true) {
				if(rs.next()) {
					Assignment assignment = new Assignment();
					assignment.setNumber(rs.getString("number"));
					assignment.setAssignedDate(rs.getString("assignedDate"));
					assignment.setDueDate(rs.getString("dueDate"));
					assignment.setTitle(rs.getString("title"));
					assignment.setUrl(rs.getString("url"));
					assignment.setGradePercentage(rs.getString("gradePercentage"));

					if(rs.getString("files")!=null) {
						String[] fileID = rs.getString("files").split(",");


						ArrayList<File> files = new ArrayList<File>();

						for(int i = 0; i<fileID.length; i++) {
							File F = new File();
							ps = conn.prepareStatement("SELECT * from Files WHERE ID=?");
							ps.setInt(1, Integer.parseInt(fileID[i]));
							rs1 = ps.executeQuery();
							if(rs1.next()) {
								F.setNumber(rs1.getString("number"));
								F.setUrl(rs1.getString("url"));
								F.setTitle(rs1.getString("title"));
							}
							files.add(F);
						}
						assignment.setFiles(files);
					}

					if(rs.getString("deliverables")!=null) {
						String[] delivs = rs.getString("deliverables").split(",");
						ArrayList<Deliverable> deliverables = new ArrayList<Deliverable>();
						for(int i =0; i<delivs.length; i++) {
							Deliverable D = new Deliverable();
							ps = conn.prepareStatement("SELECT * from Deliverables WHERE ID=?");
							ps.setInt(1, Integer.parseInt(delivs[i]));
							rs1 = ps.executeQuery();
							if(rs1.next()) {
								D.setGradePercentage(rs1.getString("gradePercentage"));
								D.setNumber(rs1.getString("number"));
								D.setDueDate(rs1.getString("dueDate"));
								D.setTitle(rs1.getString("title"));
								if(rs1.getString("delivFiles")!=null) {
									String[] fileIDD = rs1.getString("delivFiles").split(",");
									ArrayList<File> delivfiles = new ArrayList<File>();

									for(int j = 0; j<fileIDD.length; j++) {
										File F = new File();
										ps = conn.prepareStatement("SELECT * from DelivFiles WHERE ID=?");
										ps.setInt(1, Integer.parseInt(fileIDD[j]));
										rs1 = ps.executeQuery();
										if(rs1.next()) {
											F.setNumber(rs1.getString("number"));
											F.setUrl(rs1.getString("url"));
											F.setTitle(rs1.getString("title"));
										}
										delivfiles.add(F);
									}
									D.setFiles(delivfiles);
								}
							}
							deliverables.add(D);
						}
						assignment.setDeliverables(deliverables);
					}

					assignments.add(assignment);
				} else {
					break;
				}
			}
		} catch(SQLException e) {

		}

		if(temp1) {
			Assignment temp = assignments.get(0);
			assignments.add(temp);
			assignments.remove(0);
		} else if(temp2) {
			Assignment temp = assignments.get(5);
			assignments.remove(5);
			assignments.add(0, temp);
		} else if(temp3) {
			Assignment temp = assignments.get(0);
			assignments.add(temp);
			assignments.remove(0);
		} else {
			Assignment temp = assignments.get(5);
			assignments.remove(5);
			assignments.add(0, temp);
		}
		
		course.setAssignments(assignments);
		currentSession.setAttribute("course", course);

	}

	public void sortDeliverables(HttpSession currentSession, String Dsort, String DkindOfSort) {
		connect();
		boolean temp1 = false;
		boolean temp2 = false;
		boolean temp3 = false;
		boolean temp4 = false;
		
		String sort = (String) currentSession.getAttribute("aSort1");
		String kindOfSort = (String) currentSession.getAttribute("asort2");
		
		try {
			if(sort.equals("assignedDate")) {
				if(kindOfSort.equals("asc")) {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY assignedDate ASC;");
					rs = ps.executeQuery();
					
				} else {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY assignedDate DESC;");
					rs = ps.executeQuery();
				}
			} else if(sort.equals("dueDate")) {
				if(kindOfSort.equals("asc")) {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY dueDate ASC;");
					rs = ps.executeQuery();
					temp1 = true;
				} else {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY dueDate DESC;");
					rs = ps.executeQuery(); temp2 = true;
				}
			} else {
				if(kindOfSort.equals("asc")) {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY gradePercentage ASC;");
					rs = ps.executeQuery();
					temp3 = true;
				} else {
					ps = conn.prepareStatement("SELECT * from Assignments ORDER BY gradePercentage DESC;");
					rs = ps.executeQuery();
					temp4 = true;
				}
			}
		} catch(SQLException e) {

		}

		Course course = (Course) currentSession.getAttribute("course");
		ArrayList<Assignment> assignments = new ArrayList<Assignment>();

		int tempOH = 1;
		int tempN = 1;
		int tempT = 1;
		int tempA = 1;
		int tempF = 1;
		int tempD = 1;
		int tempDF = 1;
		int tempTe = 1;
		int tempW = 1;
		int tempTF = 1;
		int tempLA = 1;
		int tempLE = 1;
		int tempTo = 1;
		int tempLAF = 1;
		int tempP = 1;
		int tempPF = 1;


		try {
			while(true) {
				if(rs.next()) {
					Assignment assignment = new Assignment();
					assignment.setNumber(rs.getString("number"));
					assignment.setAssignedDate(rs.getString("assignedDate"));
					assignment.setDueDate(rs.getString("dueDate"));
					assignment.setTitle(rs.getString("title"));
					assignment.setUrl(rs.getString("url"));
					assignment.setGradePercentage(rs.getString("gradePercentage"));

					if(rs.getString("files")!=null) {
						String[] fileID = rs.getString("files").split(",");


						ArrayList<File> files = new ArrayList<File>();

						for(int i = 0; i<fileID.length; i++) {
							File F = new File();
							ps = conn.prepareStatement("SELECT * from Files WHERE ID=?");
							ps.setInt(1, Integer.parseInt(fileID[i]));
							rs1 = ps.executeQuery();
							if(rs1.next()) {
								F.setNumber(rs1.getString("number"));
								F.setUrl(rs1.getString("url"));
								F.setTitle(rs1.getString("title"));
							}
							files.add(F);
						}
						assignment.setFiles(files);
					}

					if(rs.getString("deliverables")!=null) {
						String[] delivs = rs.getString("deliverables").split(",");
						ArrayList<Deliverable> deliverables = new ArrayList<Deliverable>();
						for(int i =0; i<delivs.length; i++) {
							Deliverable D = new Deliverable();
							ps = conn.prepareStatement("SELECT * from Deliverables WHERE ID=?");
							ps.setInt(1, Integer.parseInt(delivs[i]));
							rs1 = ps.executeQuery();
							if(rs1.next()) {
								D.setGradePercentage(rs1.getString("gradePercentage"));
								D.setNumber(rs1.getString("number"));
								D.setDueDate(rs1.getString("dueDate"));
								D.setTitle(rs1.getString("title"));
								if(rs1.getString("delivFiles")!=null) {
									String[] fileIDD = rs1.getString("delivFiles").split(",");
									ArrayList<File> delivfiles = new ArrayList<File>();

									for(int j = 0; j<fileIDD.length; j++) {
										File F = new File();
										ps = conn.prepareStatement("SELECT * from DelivFiles WHERE ID=?");
										ps.setInt(1, Integer.parseInt(fileIDD[j]));
										rs1 = ps.executeQuery();
										if(rs1.next()) {
											F.setNumber(rs1.getString("number"));
											F.setUrl(rs1.getString("url"));
											F.setTitle(rs1.getString("title"));
										}
										delivfiles.add(F);
									}
									D.setFiles(delivfiles);
								}
							}
							deliverables.add(D);
						}
						assignment.setDeliverables(deliverables);
					}

					assignments.add(assignment);
				} else {
					break;
				}
			}
		} catch(SQLException e) {

		}

		if(temp1) {
			Assignment temp = assignments.get(0);
			assignments.add(temp);
			assignments.remove(0);
		} else if(temp2) {
			Assignment temp = assignments.get(5);
			assignments.remove(5);
			assignments.add(0, temp);
		} else if(temp3) {
			Assignment temp = assignments.get(0);
			assignments.add(temp);
			assignments.remove(0);
		} else {
			Assignment temp = assignments.get(5);
			assignments.remove(5);
			assignments.add(0, temp);
		}
		
		course.setAssignments(assignments);
		currentSession.setAttribute("course", course);
	}

	public boolean isPopulated() {
		connect();
		try {
			ps = conn.prepareStatement("SELECT * from Course");
			rs = ps.executeQuery();

			if(rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}

	public void setAddress(String address) {
		this.address = address;
	}
}
