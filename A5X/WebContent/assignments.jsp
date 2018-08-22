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


<script>

document.addEventListener("DOMContentLoaded", function() {
	
	// When the first deliv radio buutton is clicked
	document.getElementById("delivDueDate").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("innertable").innerHTML = xhttp.responseText;
		}
		
		xhttp.open("GET", "delivduedatesort.jsp?AD1=" + document.delivsort.AD1.value, true);
		xhttp.send();

	});
	
	// When the second deliv radio buutton is clicked
	document.getElementById("delivTitle").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("innertable").innerHTML = xhttp.responseText;
		}
		
		xhttp.open("GET", "delivtitlesort.jsp?AD1=" + document.delivsort.AD1.value, true);
		xhttp.send();

	});
	
	// When the third deliv radio buutton is clicked
	document.getElementById("delivGP").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("innertable").innerHTML = xhttp.responseText;
		}
		
		xhttp.open("GET", "delivgpsort.jsp?AD1=" + document.delivsort.AD1.value, true);
		xhttp.send();

	});
	
	// When the first assign radio buutton is clicked
	document.getElementById("assignDueDate").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("mainTable").innerHTML = xhttp.responseText;
		}
		
		xhttp.open("GET", "assignduedatesort.jsp?AD2=" + document.assignsort.AD2.value, true);
		xhttp.send();

	});
	
	// When the second assign radio buutton is clicked
	document.getElementById("assignAssignedDate").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("mainTable").innerHTML = xhttp.responseText;
		}
		
		xhttp.open("GET", "assignassigneddatesort.jsp?AD2=" + document.assignsort.AD2.value, true);
		xhttp.send();

	});
	
	// When the third assign radio buutton is clicked
	document.getElementById("assignGP").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("mainTable").innerHTML = xhttp.responseText;
		}
		
		xhttp.open("GET", "assigngpsort.jsp?AD2=" + document.assignsort.AD2.value, true);
		xhttp.send();

	});
	
	// AD2 - A
	document.getElementById("assignA").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("mainTable").innerHTML = xhttp.responseText;
		}
		

		if(document.getElementById("assignDueDate").checked) {
			xhttp.open("GET", "assignduedatesort.jsp?AD2=" + document.assignsort.AD2.value, true);
			xhttp.send();
		} else if(document.getElementById("assignAssignedDate").checked) {
			xhttp.open("GET", "assignassigneddatesort.jsp?AD2=" + document.assignsort.AD2.value, true);
			xhttp.send();
		} else {
			xhttp.open("GET", "assigngpsort.jsp?AD2=" + document.assignsort.AD2.value, true);
			xhttp.send();
		}

	});
	
	// AD2 - D
	document.getElementById("assignD").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("mainTable").innerHTML = xhttp.responseText;
		}
		

		if(document.getElementById("assignDueDate").checked) {
			xhttp.open("GET", "assignduedatesort.jsp?AD2=" + document.assignsort.AD2.value, true);
			xhttp.send();
		} else if(document.getElementById("assignAssignedDate").checked) {
			xhttp.open("GET", "assignassigneddatesort.jsp?AD2=" + document.assignsort.AD2.value, true);
			xhttp.send();
		} else {
			xhttp.open("GET", "assigngpsort.jsp?AD2=" + document.assignsort.AD2.value, true);
			xhttp.send();
		}

	});
	
	// AD1 - A
	document.getElementById("delivA").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("innertable").innerHTML = xhttp.responseText;
		}
		

		if(document.getElementById("delivDueDate").checked) {
			xhttp.open("GET", "delivduedatesort.jsp?AD1=" + document.delivsort.AD1.value, true);
			xhttp.send();
		} else if(document.getElementById("delivTitle").checked) {
			xhttp.open("GET", "delivtitlesort.jsp?AD1=" + document.delivsort.AD1.value, true);
			xhttp.send();
		} else {
			xhttp.open("GET", "delivgpsort.jsp?AD1=" + document.delivsort.AD1.value, true);
			xhttp.send();
		}

	});
	
	// AD1 - D
	document.getElementById("delivD").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("innertable").innerHTML = xhttp.responseText;
		}
		

		if(document.getElementById("delivDueDate").checked) {
			xhttp.open("GET", "delivduedatesort.jsp?AD1=" + document.delivsort.AD1.value, true);
			xhttp.send();
		} else if(document.getElementById("delivTitle").checked) {
			xhttp.open("GET", "delivtitlesort.jsp?AD1=" + document.delivsort.AD1.value, true);
			xhttp.send();
		} else {
			xhttp.open("GET", "delivgpsort.jsp?AD1=" + document.delivsort.AD1.value, true);
			xhttp.send();
		}

	});
	
	

});



</script>


</head>
<body>
<div id="container">
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
		
%>

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
          	<font size="+1">Assignments</font><br /><br />
          	<font size="+1"><a href = "exams.jsp">Previous Exams </a></font><br /><br />
          	</div>
          
          	<br>
          	<div id = "homesearch">
          	<p text-align="center" align="center"> <b><font size="+1">Sort Deliverables</font></b> </p>
          
          	<font size ="1">
          	<form name = "delivsort" method = "GET">
          	
          		<input type="radio" id = "delivDueDate" name="deliv" value="dueDate" checked/>Due Date
          		<input type="radio" id = "delivTitle"name="deliv" value="title" />Title
          		<input type="radio" id = "delivGP" name="deliv" value="GP" />GradePercentage
          		<hr/>
          		<input type="radio" id = "delivA" name="AD1" value="asc" checked />Ascending
          		<input type="radio" id = "delivD" name="AD1" value="desc" />Descending
          		
          	</form>
          	<p text-align="center" align="center"> <b><font size="+1">Sort Assignments</font></b> </p>
          	<form name = "assignsort" method = "GET">
          	
          		<input type="radio" id = "assignDueDate" name="assign" value="dueDate" checked />Due Date
          		<input type="radio" id = "assignAssignedDate" name="assign" value="assign" />Assigned Date
          		<input type="radio" id = "assignGP" name="assign" value="GP" />GradePercentage
          		<hr/>
          		<input type="radio" id= "assignA" name="AD2" value="asc" checked/>Ascending
          		<input type="radio" id = "assignD" name="AD2" value="desc" />Descending
          		
          	</form>
          	</font>
          	
          	</div>
   		
   		
   	</div>
   	
   	 
   	 
	<div id="main">
            		<p><font size="-1">
            		 <p text-align="center" align="center"> <b><font size="+1">Assignments</font></b> </p>
            		
            		<!-- Assignments table -->
            		<div id = mainTable>
          
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
            	
            	<div id = "innertable">
            	
            	<table  border="2" cellpadding="5">		<!--  This is the table that is going to be used for the final project  -->
            	
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
            	
            	</div>
            	
            	
            	</td>
            	 <td></td>  <td></td>
        
            	
            	</tr>
            	<%} } //end of assignments%>	
              	
             	</table> </div>
             	
             	<br></p>
            
</div>

<div id="footer"></div>
</div>

</body>
</html>