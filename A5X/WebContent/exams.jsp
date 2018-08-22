<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="FileInputParser.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import= "java.lang.*" %>

<% HttpSession currentSession = request.getSession();
if(currentSession.getAttribute("course") == null) {
	response.sendRedirect("index.jsp");
	return;
}
String design = (String) currentSession.getAttribute("design");

	%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>USC: CSCI 201L Fall 2017</title>
   <link rel="stylesheet" type="text/css" href="<%=design%>" />
</head>
<body>

<%
	// beginning of JAVA CODE
	

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
	
	
	// STILL TO DO!! ! !! ! ! ! ! ! ! ! !! ! ! !
	// COME TO TITLE LATER ON DONT FORGET --- TEACHING ASSISTANT EDGE CASE -- TEST THAT ITS A JSON
	//  ! ! ! ! ! ! ! ! ! !!
	
%>

<div id="container">    	<!-- CONTAINER DIV -->
	
        			<div id="header">  	<!-- HEADER DIV -->
        			<br/>
        			<table width = 500px>
          		<td align= "center"><a href="http://www.usc.edu"><img src=${school.getImage()} border="0"/></a><br /><br /></td>
          		<td align= "left">
            		<b><font size="+3"><%=department.getPrefix()%> <%=course.getNumber()%></font></b><br />
            		<b><i><font size="+1"><%=course.getTitle()%> - <%=course.getUnits()%> units</font></i></b><br />
            		<b><i><font size="+1"><%=course.getTerm()%> <%=course.getYear()%> </font></i></b><br />
 				</td>
 				</table>
          
          		
          		</div><br>


    
    <div id="nav">  <!-- NAVIGATION DIV -->
        
          	<div id = "browse">
          	
			<p text-align="center" align="center"> <b><font size="+1">Browse CSCI201L</font></b> </p>

          	<font size="+1"><a href="http://cs.usc.edu">CS Department</a></font><br /><br />
          	<font size="+1"><a href="homepage.jsp"> CSCI 201L Home </a></font><br /><br />
          	<font size="+1"><a href="<%=syllabus.getUrl()%>">Syllabus</a></font><br /><br />
          	<font size="+1"><a href = "lectures.jsp">Lectures</a></font><br /><br />
          	<font size="+1"><a href="assignments.jsp">Assignments</a></font><br /><br />
          	<font size="+1">Previous Exams</font><br /><br />
          	</div>
          
          	<br>
          	
   		
   	</div>
   	
   	 
   	 
	<div id="main">
	<p><font size="-1">
	 		 <p text-align="center" align="center"> <b><font size="+1">Previous Exams</font></b> </p>
            		<table border="2" cellpadding="5" width="590">
            		
            		
            		 <tr>
              <th align="center">Semester</th><th align="center">Written Exam #1</th><th align="center">Programming Exam #1</th><th>Written Exam #2</th><th>Programming Exam #2</th>
				</tr>
            
            
           <% for(int i = 0; i<exams.size(); i++) { %>
           	<tr>
           	
           	<td align ="center"> <%=exams.get(i).getSemester()%> <br><%=exams.get(i).getYear()%> </td>
           	
           	
           	<% for(int j = 0; j< exams.get(i).getTests().size(); j++) { %>
           		<td align ="center">
           		<% for(int k = 0; k< exams.get(i).getTests().get(j).getFiles().size(); k++) { %>
           		
           		<% if(! exams.get(i).getTests().get(j).getFiles().get(k).getTitle().equals("")) {%>
                			
                			<a href="<%=exams.get(i).getTests().get(j).getFiles().get(k).getUrl() %>"> <%=exams.get(i).getTests().get(j).getFiles().get(k).getTitle()%> <br/></a>
                			
                			<% } %>
                			<% if(k!=exams.get(i).getTests().get(j).getFiles().size()-1) { %>
                				<hr>
                			<%}%>
           		
           		<% } %>
           		</td>
           	
           	<% } %>
           	
           	
           	</tr>
   			<% } //FOR ALL EXAMS LOOP %>
            
           
              	
             	</table>
             	
             	</div>
             	<div id = "footer"></div>
             	</div>
             	
</body>
</html>