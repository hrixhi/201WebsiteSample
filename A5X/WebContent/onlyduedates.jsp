<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="FileInputParser.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import= "java.lang.*" %>
<%


	HttpSession currentSession = request.getSession();
if(currentSession.getAttribute("course") == null) {
	response.sendRedirect("index.jsp");
	return;
}

	Course course = (Course) currentSession.getAttribute("course");
	School school = (School) currentSession.getAttribute("school");
	Department department = (Department) currentSession.getAttribute("department");
	
	ArrayList<StaffMember> staff = course.getStaffmembers();
	ArrayList<Meeting> meetings = course.getMeetings();
 ArrayList<Assignment> assignments = course.getAssignments();
	ArrayList<Exam> exams = course.getExams();
	
	Schedule schedule = course.getSchedule();
	ArrayList<Week> weeks = schedule.getWeeks();
	ArrayList<Textbook> textbooks = schedule.getTextbooks();
	
	Syllabus syllabus = course.getSyllabus();

	ArrayList<Assignment> assignmentsDue = new ArrayList<Assignment>();
	ArrayList<Deliverable> deliverablesDue = new ArrayList<Deliverable>();
	ArrayList<String> weeksDue = new ArrayList<String>();
	
%>
<table border="2" cellpadding="5" width="450"> 
        
        <!-- FIRST ROW THAT HAS HEADERS -->      
        <tr>
        <th align="center">Week #</th><th align="center">Lab</th><th align="center">Lecture #</th><th align="center">Day</th><th align="center" width="200">Date</th><th align="center">Lecture Topic</th><th align="center">Chapter</th><th>Program</th>
        </tr>
        
        <% for(int i = 0; i< weeks.size(); i++) { // i for weeks
                			
 						//assignments due
 						//delevrables due
                			
                			
                			for(int w = 0; w<weeks.get(i).getLectures().size(); w++) { // w for lecture
                				for(int v = 0; v<assignments.size(); v++) { // v for assignments 
                				
                					
                			
                					if(weeks.get(i).getLectures().get(w).getDate().equals( assignments.get(v).getDueDate() )) {
 
                						assignmentsDue.add(assignments.get(v));
                						weeksDue.add(weeks.get(i).getWeek());
                					}
                				
                					for(int u = 0; u < assignments.get(v).getDeliverables().size(); u++) {
                						
                						if(weeks.get(i).getLectures().get(w).getDate().equals( assignments.get(v).getDeliverables().get(u).getDueDate() )) {
                							deliverablesDue.add(assignments.get(v).getDeliverables().get(u));
                							weeksDue.add(weeks.get(i).getWeek());
;                						}
                						
                					}
                					
                				}
                			}
                		}
                		

                		%>
                		
                		
                		<%	

                			int a=0, d=0, w=0;
                			CompareDate comp = new CompareDate();
                			while((a!=assignmentsDue.size()) || (d!=deliverablesDue.size())) {
							System.out.println("iteration");
                				if (a == assignmentsDue.size()) {
                					for(; d<deliverablesDue.size(); d++) {
                		%>
                			<tr>
                			<td colspan ="3" align="center"><%=weeksDue.get(w) %></td>
                			<td align="center">Sunday</td>
                			<td align="center"><%=deliverablesDue.get(d).getDueDate() %></td>
                				<td align="center" colspan = "3"><font size="+1" color="red"><b><%= deliverablesDue.get(d).getTitle().toUpperCase()%></b></font></td>
                			</tr>
                		<% w++;}} else if(d == deliverablesDue.size()) {
                			for(; a<assignmentsDue.size(); a++) { %>
                		
                			<tr>
                			<td colspan ="3" align="center"><%=weeksDue.get(w) %></td>
                			<td align="center">Sunday</td>
                			<td align="center"><%=assignmentsDue.get(a).getDueDate() %></td>
                			<td align="center" colspan = "3"><font size="+1" color="red"><b>ASSIGNMENT <%= assignmentsDue.get(a).getNumber()%></b></font></td>
                			</tr>
                		
                		<% w++; }} else if( comp.compare(assignmentsDue.get(a).getDueDate(), deliverablesDue.get(d).getDueDate()) == 1) {%>
                		
                			<tr>
                			<td colspan ="3" align="center"><%=weeksDue.get(w) %></td>
                			<td align="center">Sunday</td>
                			<td align="center"><%=assignmentsDue.get(a).getDueDate() %></td>
                			<td align="center" colspan = "3"><font size="+1" color="red"><b>ASSIGNMENT <%= assignmentsDue.get(a).getNumber()%></b></font></td>
                			</tr>
                		
                		<% w++; a++; } else { %>
                		
                			<tr>
                			<td colspan ="3" align="center"><%=weeksDue.get(w) %></td>
                			<td align="center">Sunday</td>
                			<td align="center"><%=assignmentsDue.get(a).getDueDate() %></td>
                			<td align="center" colspan = "3"><font size="+1" color="red"><b><%= deliverablesDue.get(d).getTitle().toUpperCase()%></b></font></td>
                				
                			</tr>
                		
                		<% w++; d++; }	 //end of else
                		} //end of while%>
                		


</table>