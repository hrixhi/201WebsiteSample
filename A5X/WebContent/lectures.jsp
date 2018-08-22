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
	
	// When Search is clicked 
	document.getElementById("searchButton").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "${pageContext.request.contextPath}/topicsearch.jsp?inputname=" + document.searchform.inputname.value, false);
		xhttp.send();
		
		
		var responseText = xhttp.responseText.trim();
		console.log(responseText);
		
		var textArray = responseText.split(",");
		
		if(textArray.length >=2 ) {
			console.log("more than 2");
		}
		
		var rest = document.getElementsByTagName("div");
		 
		 for(var a = 0; a<rest.length; a++) {
				
			rest[a].style.backgroundColor = "white";
				
			} 
		
			for(var b = 0; b<textArray.length; b++) {
				
				var temp = document.getElementsByClassName(textArray[b]);
				
				
				for(var a = 0; a<temp.length; a++) {
					//System.out.println("hrishi");
					temp[a].style.backgroundColor = "#bfbfbf";
					
				} 
				
				document.getElementById("forReset").value = "";	
				document.getElementById("forReset").placeholder = "Enter Text...";
				
			}
	
			

	});
	
	document.getElementById("clearButton").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		xhttp.open("GET", "topicsearch.jsp?inputname=" + document.searchform.inputname.value, false);
		xhttp.send();

		
			
		document.getElementById("forReset").placeholder = "Enter Text...";
			 
			 var rest = document.getElementsByTagName("div");
			 
			 for(var a = 0; a<rest.length; a++) {
					
				rest[a].style.backgroundColor = "white";
					
				} 
			
			
		

	});
	
	// When the first radio buutton is clicked
	document.getElementById("lectures").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("lecturesTable").innerHTML = xhttp.responseText;
		}
		
		xhttp.open("GET", "onlylectures.jsp", true);
		xhttp.send();

		/* if (xhttp.responseText.trim().length > 0) {
			
			console.log("hrihsi");
			var responseText = xhttp.responseText.trim();	
			document.getElementById("lecturesTable").innerHTML = reponseText;
			
		} */

	});
	
	// When the second radio buutton is clicked
	document.getElementById("all").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			document.getElementById("lecturesTable").innerHTML = xhttp.responseText;
		}
		
		xhttp.open("GET", "fulllecturestable.jsp", true);
		xhttp.send();

		/* if (xhttp.responseText.trim().length > 0) {
			
			console.log("hrihsi");
			var responseText = xhttp.responseText.trim();	
			document.getElementById("lecturesTable").innerHTML = reponseText;
			
		} */

	});
	
	
	// When the first all buutton is clicked
	document.getElementById("duedatesonly").addEventListener("click", function() {

		var xhttp = new XMLHttpRequest();
		
		xhttp.onreadystatechange = function() {
			console.log(xhttp.responseText);
			document.getElementById("lecturesTable").innerHTML = xhttp.responseText;
		}
		
		xhttp.open("GET", "onlyduedates.jsp", true);
		xhttp.send();

		
		/* if (xhttp.responseText.trim().length > 0) {
			
			console.log("hrihsi");
			var responseText = xhttp.responseText.trim();	
			document.getElementById("lecturesTable").innerHTML = reponseText;
			
		} */

	});
	
});


</script>

</head>
<body>
<div id="container">

<%
	
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
	
/* 
	if(currentSession.getAttribute("course") == null) {
		response.sendRedirect("index.jsp");
		return;
	}
	
	 */
	// STILL TO DO!! ! !! ! ! ! ! ! ! ! !! ! ! !
	// COME TO TITLE LATER ON DONT FORGET --- TEACHING ASSISTANT EDGE CASE -- TEST THAT ITS A JSON
	//  ! ! ! ! ! ! ! ! ! !!
	
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
          	<font size="+1">Lectures</font><br /><br />
          	<font size="+1"><a href="assignments.jsp">Assignments</a></font><br /><br />
          	<font size="+1"><a href="exams.jsp">Previous Exams</a></font><br /><br />
          	</div>
          
          	<br>
          	<div id = "homesearch">
          	<p text-align="center" align="center"> <b><font size="+1">Search Topics</font></b> </p>
          
          	<form name = "searchform" method="GET">
          		<input id = "forReset" type ="text" name="inputname" placeholder="Enter Text..."/><br> <br>
          		<input type = "reset" class = "button" id = "clearButton"><br/>
          		<br>          	
          	</form>
          	
          	<button class = "button" id = "searchButton">Search</button> <br/><br/>
          	
          	<font size = "2">
          	<form>
          	<input id="lectures" type="radio" name = "sort" value="lectures"> Show Lectures<br>
          	<input id="duedatesonly" type="radio" name = "sort" value="duedates">Show Due Dates<br>
          	<input id="all" type="radio" name = "sort" value="all" checked>Show All<br>
          	<br>
          	</form>
        		</font>
          	
          	</div>
   		
   		
   	</div>
   	
   	 
          		<div id="main">
          		<p><font size="-1">
          		<font size="+1"><b><p align="center"> Course Textbook</p></b></font>
          		<p align = "center"><font size="2">
            		Chapter references are from Liang, Y. Daniel. Introduction to Java Programming, Comprehensive Version, 10<sup>th</sup> Edition, Prentice Hall, Inc., 2014. ISBN 978-0133761313
</font>
       
            	 <p text-align="center" align="center"> <b><font size="+1">Lectures</b><br></font>
            	 
            	 	<div id="lecturesTable">
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
                			int rs = weeks.get(i).getLectures().size() + count;
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
                				
                				<% for(int ad = 0; ad < assignmentsDue.size(); ad++) { 
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
                					
                				<% }} %>
                				
                			
                			<%} // a loop for lectures in week i%>
                			
                			
                			
                			<!--  /tr --></tr>
                		
                		
                		<% 
                		} // i loop - iterates through weeks
                		%>
                		

            
             		
             	 </table>
             	 </div>
             	 <br>
             	 
        
             	    
    		</div>
    		
    		<div id = "footer"></div>
</div>
</body>
</html>