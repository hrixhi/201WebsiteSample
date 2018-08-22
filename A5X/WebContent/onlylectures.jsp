<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="FileInputParser.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import= "java.lang.*" %>
<%

//beginning of JAVA CODE
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

%>
<table border="2" cellpadding="5" width="450"> 
              		<tr>
              <th align="center">Week #</th><th align="center">Lab</th><th align="center">Lecture #</th><th align="center">Day</th><th align="center" width="200">Date</th><th align="center">Lecture Topic</th><th align="center">Chapter</th><th>Program</th>
            </tr>

              		
                		
                		<% for(int i = 0; i< weeks.size(); i++) { // i for weeks
                			
                			int count = 0;
                			ArrayList<Assignment> assignmentsDue = new ArrayList<Assignment>();
                			ArrayList<Deliverable> deliverablesDue = new ArrayList<Deliverable>();
                			
                			for(int w = 0; w<weeks.get(i).getLectures().size(); w++) { // w for lecture
                				for(int v = 0; v<assignments.size(); v++) { // v for assignments 
                				
                					
                					//System.out.println("\nLecture Date  " + weeks.get(i).getLectures().get(w).getDate());
                					//System.out.println("Assignment Date  " + assignments.get(v).getDueDate());
                						
                						
                					if(weeks.get(i).getLectures().get(w).getDate().equals( assignments.get(v).getDueDate() )) {
       	//System.out.println("going through");
                						assignmentsDue.add(assignments.get(v)); count++;
                					}
                				
                					for(int u = 0; u < assignments.get(v).getDeliverables().size(); u++) {
                						
                						if(weeks.get(i).getLectures().get(w).getDate().equals( assignments.get(v).getDeliverables().get(u).getDueDate() )) {
                							deliverablesDue.add(assignments.get(v).getDeliverables().get(u)); count ++;
;                						}
                						
                					}
                					
                				}
                			}
                			
                			//xxSystem.out.println(count);
                			int rs = weeks.get(i).getLectures().size();
                		%>
                		
                		<tr>
                			
                			<!-- This is for week number -->
                			<td align="center" rowspan="<%=rs%>"><%=weeks.get(i).getWeek() %></td>
                		
                			<!-- This is for labs -->
                			<td align ="center" rowspan="<%=rs%>"><table>
                			<%for(int j = 0; j<weeks.get(i).getLabs().size(); j++) { %>
                			<tr><td>
                			<a href="<%=weeks.get(i).getLabs().get(j).getUrl() %>"> <%=weeks.get(i).getLabs().get(j).getTitle()%> </a>
                			<% for(int k = 0; k<weeks.get(i).getLabs().get(j).getFiles().size(); k++) {%>
                				<a href="<%=weeks.get(i).getLabs().get(j).getFiles().get(k).getUrl() %>"> <%=weeks.get(i).getLabs().get(j).getFiles().get(k).getTitle()%> <br/></a>
                			<% } %>
                			
                			<% if(j!=weeks.get(i).getLabs().size()-1) {%>
                			<hr>
                			<% }%>
                			</td><%} // j loop%>
                			</table></td>
                			
                			<% for(int a = 0; a<weeks.get(i).getLectures().size(); a++) {%>
                				
                				<td align="center"> <%=weeks.get(i).getLectures().get(a).getNumber()%> </td>
                				<td align="center"> <%=weeks.get(i).getLectures().get(a).getDay()%> </td>
                				<td align="center"> <%=weeks.get(i).getLectures().get(a).getDate()%> </td>
                				
                				
                				
                			<td align="center">
                	
                			<% for(int b = 0; b<weeks.get(i).getLectures().get(a).getTopics().size(); b++) {%>
                				<div class="<%=weeks.get(i).getLectures().get(a).getTopics().get(b).getTitle().toLowerCase()%>">
                				
                				<a href="<%=weeks.get(i).getLectures().get(a).getTopics().get(b).getUrl() %>"> <%=weeks.get(i).getLectures().get(a).getTopics().get(b).getTitle()%> <br/></a>
                			
                			
                			<% if(b!=weeks.get(i).getLectures().get(a).getTopics().size()-1) {%>
                			<hr>
                			<%} %>
                			
                			</div>
                			
                			<% } %>
                			
                			</td>
                			
                			<td align="center">
                				<% // process the files for chapter
                					int min=1000, max=0;
                					//ArrayList<Program> programs = new ArrayList<Program>();
                					ArrayList<String> allChapters = new ArrayList<String>();
                					ArrayList<Integer> allChaptersInt = new ArrayList<Integer>();
                					
                					for(int p = 0; p<weeks.get(i).getLectures().get(a).getTopics().size(); p++) {
                						/* 
                						int num = Integer.parseInt(weeks.get(i).getLectures().get(a).getTopics().get(p).getChapter());
                						if(min>=num) {
                							min = num;
                						}
                						if(max<=num) {
                							max = num;
                						} */
                						allChapters.add(weeks.get(i).getLectures().get(a).getTopics().get(p).getChapter());
                						
                					}
                					
                					 for(int kp = 0; kp < allChapters.size(); kp++) {

                			              String chapter = allChapters.get(kp);

                			             // System.out.println("1 " + chapter);

                			              if(chapter != null && chapter.indexOf('-') == -1 && chapter.indexOf(',') == -1) {

                			              allChaptersInt.add(Integer.parseInt(chapter));

                			              }

                			              else if(chapter != null) {

                			              int index = chapter.indexOf('-');

                			              if(index == -1) {

                			              index = chapter.indexOf(',');

                			              }

                			              if(chapter.substring(0, index) != "") {

                			              allChaptersInt.add(Integer.parseInt(chapter.substring(0, index)));

                			              }

                			              if(chapter.substring(index + 1) != "") {

                			              allChaptersInt.add(Integer.parseInt(chapter.substring(index + 1)));

                			              }

                			              }

                			              }
                					int mx = 0, Mx = 0;
                					   for(int kpp = 0; kpp < allChaptersInt.size(); kpp++) {

                				              if(allChaptersInt.get(kpp) < allChaptersInt.get(mx)) {

                				              mx = kpp;

                				              }

                				              if(allChaptersInt.get(kpp) > allChaptersInt.get(Mx)) {

                				              Mx = kpp;

                				              }

                				              }
                					   
                					   min = allChaptersInt.get(mx);
                							   max = allChaptersInt.get(Mx);
                					
                					
	                			%>	
                		
                				<%=min%>-<%=max%>
                						
                			</td>
                			             			
                			<td align="center">
                				<% // process the files;
                					//int min=1000, max=0;
                					ArrayList<Program> programs = new ArrayList<Program>();
                					
                					for(int p = 0; p<weeks.get(i).getLectures().get(a).getTopics().size(); p++) {
                						programs.addAll(weeks.get(i).getLectures().get(a).getTopics().get(p).getPrograms());
                					}
                					 
                					ArrayList<File> allFiles = new ArrayList<File>();
                					
                					for(int p = 0; p<programs.size(); p++) {
                						allFiles.addAll(programs.get(p).getFiles());
                					}
                				
                				for(int x = 0; x< allFiles.size(); x++) {%>
                				
                				<a href="<%=allFiles.get(x).getUrl() %>"> <%=allFiles.get(x).getTitle()%> <br/></a>
                				
                				<% }%>
                			</td>
                	
                			
                			
                				</tr>
                				
                				<%-- <% for(int ad = 0; ad < assignmentsDue.size(); ad++) { 
                				if(weeks.get(i).getLectures().get(a).getDate().equals( assignmentsDue.get(ad).getDueDate())) { %>
                				
                				<tr>
                				<td></td>
                				<td align="center"><%=weeks.get(i).getLectures().get(a).getDay() %></td>
                				<td align="center"><%=weeks.get(i).getLectures().get(a).getDate() %></td>
                				<% if(!assignmentsDue.get(ad).getNumber().equals("Final Project")) { %>
                				<td align="center" colspan = "3"><font size="+1" color="red"><b>ASSIGNMENT <%= assignmentsDue.get(ad).getNumber()%></b></font></td>
                				<% } else { %>
                				<td align="center" colspan = "3"><font size="+1" color="red"><b>FINAL PROJECT</b></font></td>
                				<% } %>
                				</tr>
                				
                				<%} else {%>
                					
                				<% }} %>
                				
                				
                				
                				<% for(int ad = 0; ad < deliverablesDue.size(); ad++) { 
                				if(weeks.get(i).getLectures().get(a).getDate().equals( deliverablesDue.get(ad).getDueDate())) { %>
                				
                				<tr>
                				<td></td>
                				<td align="center"><%=weeks.get(i).getLectures().get(a).getDay() %></td>
                				<td align="center"><%=weeks.get(i).getLectures().get(a).getDate() %></td>
                				<td align="center" colspan = "3"><font size="+1" color="red"><b><%= deliverablesDue.get(ad).getTitle().toUpperCase()%></b></font></td>
                				
                				</tr>
                				
                				<%} else {%>
                					
                				<% }} %> --%>
                				
                			
                			<%} // a loop for lectures in week i%>
                			
                			
                			
                			<!--  /tr --></tr>
                		
                		
                		<% 
                		} // i loop - iterates through weeks
                		%>
                		

            
             		
             	 </table>