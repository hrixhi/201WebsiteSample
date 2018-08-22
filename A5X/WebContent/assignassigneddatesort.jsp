<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="FileInputParser.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import= "java.lang.*" %>
<%@ page import= "java.util.*" %>
<%
	// beginning of JAVA CODE
	
	
	
	 HttpSession currentSession = request.getSession();
	if(currentSession.getAttribute("course") == null) {
		response.sendRedirect("index.jsp");
		return;
	}
	
	String kindOfSort = request.getParameter("AD2");	// can either be asc or something else
	SQLConnection SQLConn = (SQLConnection) currentSession.getAttribute("SQLConn");
	
	// SORTING HAPPENS USING SCRIPT!!!!!!
	SQLConn.sortAssignments(currentSession, "assignedDate", kindOfSort);

	
	Course course = (Course) currentSession.getAttribute("course");
	School school = (School) currentSession.getAttribute("school");
	Department department = (Department) currentSession.getAttribute("department");
	
  	ArrayList<StaffMember> staff = course.getStaffmembers();
  	ArrayList<Meeting> meetings = course.getMeetings();
    ArrayList<Assignment> assignments = course.getAssignments();
	ArrayList<Exam> exams = course.getExams();
	
	Schedule schedule = course.getSchedule();
	Syllabus syllabus = course.getSyllabus();
	ArrayList<Week> weeks = schedule.getWeeks();
	ArrayList<Textbook> textbooks = schedule.getTextbooks();
	
	/*
String kindOfSort = request.getParameter("AD2");
	
	if(kindOfSort.equals("asc")) {
		CompareDate comp = new CompareDate();
		ArrayList<String> listOfDates = new ArrayList<String>();
		ArrayList<Assignment> sortedArray = new ArrayList<Assignment>();
		for(int i = 0; i<assignments.size()-1; i++) {
			listOfDates.add(assignments.get(i).getAssignedDate());
		}
		Collections.sort(listOfDates, comp);
		

		for(int i = 0; i<listOfDates.size(); i++) {
			for(int j = 0; j<assignments.size(); j++) {
				if(listOfDates.get(i).equals(assignments.get(j).getAssignedDate())) {
					sortedArray.add(assignments.get(j)); break;
				}
			}
		}
		sortedArray.add(assignments.get(assignments.size()-1));
		assignments = sortedArray;
		
	} else {
		
		CompareDate comp = new CompareDate();
		ArrayList<String> listOfDates = new ArrayList<String>();
		ArrayList<Assignment> sortedArray = new ArrayList<Assignment>();
		for(int i = 0; i<assignments.size()-1; i++) {
			listOfDates.add(assignments.get(i).getAssignedDate());
		}
		Collections.sort(listOfDates, comp);
	

		for(int i = 0; i<listOfDates.size(); i++) {
			for(int j = 0; j<assignments.size(); j++) {
				if(listOfDates.get(i).equals(assignments.get(j).getAssignedDate())) {
					sortedArray.add(assignments.get(j)); break;
				}
			}
		}
		sortedArray.add(assignments.get(assignments.size()-1));
		Collections.reverse(sortedArray);
		assignments = sortedArray;
		
	} */
	
%>

<table border="2" cellpadding="5" width="720">
            		
            		
            		 <tr>
              <th align="center">Homework #</th><th align="center" width="100">Assigned</th><th align="center" width="100">Due</th><th>Assignment</th><th>% Grade</th><th>Grading Criteria</th><th>Solution</th>
            </tr>
            
            <% for(int i =0; i<assignments.size(); i++) {%>
            	<tr>
            	<% if(!assignments.get(i).getNumber().equals("Final Project")) { %>
            	<td align="center"><%=assignments.get(i).getNumber()%></td>
            	<td align="center"><%=assignments.get(i).getAssignedDate()%></td>
            	<td align="center"><%=assignments.get(i).getDueDate()%></td>
            	<td align="center">  	
            	<table>
                			
                			<tr><td align ="center">
                			<%  if( assignments.get(i).getTitle() != null && !assignments.get(i).getTitle().isEmpty()) {  //COME BACK TO THIS SHIT LATER LIKE     %>
                				<a href="<%=assignments.get(i).getUrl()%>"> <%=assignments.get(i).getTitle()%> </a><hr>
                			<% }  %>
                				
                			
                			
                			<% for(int k = 0; k<assignments.get(i).getFiles().size(); k++) {%>
                			<% if(! assignments.get(i).getFiles().get(k).getTitle().equals("")) {%>
                			
                			<a href="<%=assignments.get(i).getFiles().get(k).getUrl() %>"> <%=assignments.get(i).getFiles().get(k).getTitle()%> <br/></a>
                			
                			<% } %>
                			<% if(k!=assignments.get(i).getFiles().size()-1) { %>
                				<hr>
                			<%}%>
                			
                			<% } %>
                			
                			
                			</td></tr>
             </table>
            	
            	</td>
            	<td align = "center"> <%=assignments.get(i).getGradePercentage()%> </td>
       		<td></td>
       		<td></td>
          
            	
            	<% } else { //FINAL PROJECT ROW%>
            	
            	<td align="center"><%=assignments.get(i).getNumber()%></td>
            	<td align="center"><%=assignments.get(i).getAssignedDate()%></td>
            	<td align="center" colspan="3">
            	
            	
            	<table id = "innertable" border="2" cellpadding="5">		<!--  This is the table that is going to be used for the final project  -->
            	
            	<tr><td colspan="3" align="center"> 
            	
            	<a href="<%=assignments.get(i).getUrl()%>"> <%=assignments.get(i).getTitle()%> </a><hr>
            	
            	<% for(int k = 0; k<assignments.get(i).getFiles().size(); k++) {%>
                			<% if(! assignments.get(i).getFiles().get(k).getTitle().equals("")) {%>
                			
                			<a href="<%=assignments.get(i).getFiles().get(k).getUrl() %>"> <%=assignments.get(i).getFiles().get(k).getTitle()%> <br/></a>
                			
                			<% } %>
                			<% if(k!=assignments.get(i).getFiles().size()-1) { %>
                				<hr>
                			<%}%>
                			
                			<% } %>
            	
            	</td></tr>
            	
            <% for(int d = 0; d<assignments.get(i).getDeliverables().size(); d++) { %>
            
            <tr>
            
            <td><%=assignments.get(i).getDeliverables().get(d).getDueDate()%></td>
            <td><%=assignments.get(i).getDeliverables().get(d).getTitle()%><br>
            
            <% for(int f = 0; f<assignments.get(i).getDeliverables().get(d).getFiles().size(); f++) {%>
            		<% if(! assignments.get(i).getDeliverables().get(d).getFiles().get(f).getTitle().equals("")) {%>
                			
                			<a href="<%=assignments.get(i).getDeliverables().get(d).getFiles().get(f).getUrl() %>"> <%=assignments.get(i).getDeliverables().get(d).getFiles().get(f).getTitle()%> <br/></a>
                			
                			<% } %>
                			<% if(f!=assignments.get(i).getDeliverables().get(d).getFiles().size()-1) { %>
                				<hr>
                			<%}%>
            <% } %>
            
            </td>
            <td><%=assignments.get(i).getDeliverables().get(d).getGradePercentage()%></td>
           
            </tr>
            
            <% } %>
            	
            	
            	</table>
            	
            	
            	</td>
            	 <td></td>  <td></td>
        
            	
            	</tr>
            	<%} } //end of assignments%>	
              	
             	</table>