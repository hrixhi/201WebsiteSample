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

 
 <!--  A C T U A L   C O D E   -->
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>USC: CSCI 201L Fall 2017</title>
    <link rel="stylesheet" type="text/css" href="<%=design%>" />
   
    
</head>

  <script>
		
		document.addEventListener("DOMContentLoaded", function() {
			document.getElementById("searchButton").addEventListener("click", function() {

				var xhttp = new XMLHttpRequest();
				xhttp.open("GET", "${pageContext.request.contextPath}/staffsearch.jsp?inputname=" + document.searchform.inputname.value, false);
				xhttp.send();
				
				
	
				//if (xhttp.responseText.trim().length > 0) {
					//document.getElementById("formerror").innerHTML= xhttp.responseText;
					
					var responseText = xhttp.responseText.trim();
					console.log(responseText);
					
					var textArray = responseText.split(",");
					
					console.log(textArray);
					
					if(textArray.length >=2 ) {
						console.log(textArray.length);
					}
					
					var rest = document.getElementsByTagName("td");
					 
					 for(var a = 0; a<rest.length; a++) {
							
						rest[a].style.backgroundColor = "white";
							
						} 
					
					
					
						for(var b = 0; b<textArray.length; b++) {
							
							var temp = document.getElementsByClassName(textArray[b]);
							console.log(textArray[b]);
							console.log(temp);
							
							
							for(var a = 0; a<temp.length; a++) {
								//System.out.println("hrishi");
								temp[a].style.backgroundColor = "#bfbfbf";
								
							} 
							
							document.getElementById("forReset").value = "";	
							document.getElementById("forReset").placeholder = "Enter Text...";
							
						}


			});
			
			document.getElementById("clearbutton").addEventListener("click", function() {

				var xhttp = new XMLHttpRequest();
				xhttp.open("GET", "${pageContext.request.contextPath}/staffsearch.jsp?inputname=" + document.searchform.inputname.value, false);
				xhttp.send();
	
			
					document.getElementById("forReset").placeholder = "Enter Text...";
					//document.getElementById("inputname").text = "";
					
					 var rest = document.getElementsByTagName("td");
					 
					 for(var a = 0; a<rest.length; a++) {
							
						rest[a].style.backgroundColor = "white";
							
						} 
					
					
				

			});
		});
	
	
</script>


<body>

<%
	// beginning of JAVA CODE
	/* Course course = (Course) request.getAttribute("course");
	Department department = (Department) request.getAttribute("department");
	School school = (School) request.getAttribute("school"); */
	
	
	
	
	Course course = (Course) currentSession.getAttribute("course");
	School school = (School) currentSession.getAttribute("school");
	Department department = (Department) currentSession.getAttribute("department");
	
	
	

  	ArrayList<StaffMember> staff = course.getStaffmembers();
  	ArrayList<Meeting> meetings = course.getMeetings();
    ArrayList<Assignment> assignments = course.getAssignments();
	ArrayList<Exam> exams = course.getExams();
	
	int counter = 0;
	
	Syllabus syllabus = course.getSyllabus();

	
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
          	<font size="+1">CSCI 201L Home</font><br /><br />
          	<font size="+1"><a href="<%=syllabus.getUrl()%>">Syllabus</a></font><br /><br />
          	<font size="+1"><a href="lectures.jsp">Lectures</a></font><br /><br />
          	<font size="+1"><a href="assignments.jsp">Assignments</a></font><br /><br />
          	<font size="+1"><a href="exams.jsp">Previous Exams</a></font><br /><br />
          	</div>
          
          	<br>
          	<div id = "homesearch">
          	<p text-align="center" align="center"> <b><font size="+1">Search Staff</font></b> </p>
          
          	<form name = "searchform" method="GET">
          		<div id = "formerror"></div>
          		<input id = "forReset" type ="text" name="inputname" placeholder="Enter Text..."/><br> <br>
          		
          
          	<input type = "reset" class = "button" id = "clearbutton"/><br/>
          	
	

          	</form>
          	
          		<button class = "button" id = "searchButton">Search</button> <br/><br/>
          	
          	</div>
   		
   	</div>
   	
   
   	
   	 
   	 
	<div id="main">
          		
          		<p><font size="-1">
            		 <p text-align="center" align="center"> <b><font size="+1">Professor</font></b> </p>
            		<table id = "professorsTable" border="2" width="650" align="center">
              		<tr>
                		<th align="center">Picture</th>
                		<th align="center">Professor</th>
                		<th align="center">Office</th>
                		<th align="center">Phone</th>
                		<th align="center">Email</th>
                		<th align="center">Office Hours</th>
              		</tr>
              		<tr>
                		
                		<% for(int i = 0; i< staff.size(); i++) {
                			if(staff.get(i).getType().equals("instructor")) {			
                		%>
                		
                		<td align="center" class="<%=staff.get(i).getName().getFname().toLowerCase() + " " + staff.get(i).getName().getLname().toLowerCase()%>"><img width="100" height="100" src="<%=staff.get(i).getImage() %>" /></td>
                		<td align="center" class="<%=staff.get(i).getName().getFname().toLowerCase() + " " + staff.get(i).getName().getLname().toLowerCase()%>"><font size="-1"><%=staff.get(i).getName().getFname()%> <%=staff.get(i).getName().getLname()%></font></td>
                		<td align="center"><font size="-1"><%=staff.get(i).getOffice() %></font></td>
                		<td align="center"><font size="-1"><%=staff.get(i).getPhone() %></font></td>
                		<td align="center"><font size="-1"><%=staff.get(i).getEmail() %></font></td>
                		<td align="center"><font size="-1"> 
                  		<% for(int j = 0; j< staff.get(i).getOfficeHours().size();j++) {%>
                  			<%= staff.get(i).getOfficeHours().get(j).getDay() %> <%= staff.get(i).getOfficeHours().get(j).getTime().getStart()%>-<%= staff.get(i).getOfficeHours().get(j).getTime().getEnd()%><hr/>
                  		<%}%>
                  		Any day by appointment
                			</font></td>
                		
                		<% }
                		}
                		%>
                		
        

                		
                		
                		
             		</tr>
             		
             	 </table><br>
             	           		
         <p text-align="center" align="center"> <b><font size="+1">Lecture Schedule</font></b> </p>
          <table id = "lecturesTable" border="2" cellpadding="5" width="590">
            <tr>
              <th align="center">Sect. No.</th><th align="center">Day &amp; Time</th><th align="center">Room</th><th>Lecture Assistant</th>
            </tr>
            
            <% for(int i = 0; i<meetings.size(); i++) { 
            if(meetings.get(i).getType().equals("lecture")) {
            %>
            
            <tr>
              <td align="center"><font size="-1"><%=meetings.get(i).getSection()%></font></td>
              <td align="center"><font size="-1">
              
              <% for (int j = 0; j<meetings.get(i).getMeetingPeriods().size(); j++) {%>
              	<%=meetings.get(i).getMeetingPeriods().get(j).getDay()%>
              	<%if(j!=meetings.get(i).getMeetingPeriods().size() - 1) { %>/
              	<% } %>
              <%} %>
              
              <br />
              
              
              <%=meetings.get(i).getMeetingPeriods().get(0).getTime().getStart()%>-<%=meetings.get(i).getMeetingPeriods().get(0).getTime().getEnd()%>
            
              
              </font></td>
              <td align="center"><font size="-1"><%=meetings.get(i).getRoom()%></font></td>
              
              <% for(int j = 0; j<staff.size(); j++) { 
              if(meetings.get(i).getAssistants().get(0).getStaffMemberID().equals(staff.get(j).getId())) {
              %>
              <td align="center" class="<%=staff.get(j).getName().getFname().toLowerCase() + " " + staff.get(j).getName().getLname().toLowerCase()%>"><font size="-1"><img src="<%=staff.get(j).getImage()%>"><br /><a href="mailto:<%=staff.get(j).getEmail()%>"><%=staff.get(j).getName().getFname()%> <%=staff.get(j).getName().getLname()%></a></font></td>
			<%}} %>	            
				            
            </tr>
            
            <%}} %>
            
          </table><br>
        
          
                		
         <p text-align="center" align="center"> <b><font size="+1">Lab Schedule</font></b> </p>
          <table border="2" cellpadding="5" width="590" id = "labsTable">
            <tr>
              <th align="center">Sect. No.</th><th align="center">Day &amp; Time</th><th align="center">Room</th><th>Lecture Assistants</th>
            </tr>
            
            <% for(int i = 0; i<meetings.size(); i++) { 
            if(meetings.get(i).getType().equals("lab")) {
            %>
            
            <tr>
              <td align="center"><font size="-1"><%=meetings.get(i).getSection()%></font></td>
              <td align="center"><font size="-1">
              
              <% for (int j = 0; j<meetings.get(i).getMeetingPeriods().size(); j++) {%>
              	<%=meetings.get(i).getMeetingPeriods().get(j).getDay()%>
              <%} %>
              
              <br />
              
              
              <%=meetings.get(i).getMeetingPeriods().get(0).getTime().getStart()%>-<%=meetings.get(i).getMeetingPeriods().get(0).getTime().getEnd()%>
            
              
              </font></td>
              <td align="center"><font size="-1"><%=meetings.get(i).getRoom()%></font></td>
              
              <!-- Supposed to add a <td> here that has a table with only 1 horizontal row but multiple columns -->     
              <td align="center">
              <table> <tr>
              <% for(int j = 0; j<meetings.get(i).getAssistants().size(); j++)  {
              		for(int k = 0; k<staff.size(); k++) {
              			if(staff.get(k).getId().equals(meetings.get(i).getAssistants().get(j).getStaffMemberID())) {
              %>
              
              <td align="center" class="<%=staff.get(k).getName().getFname().toLowerCase() + " " + staff.get(k).getName().getLname().toLowerCase()%>"><font size="-1"><img src="<%=staff.get(k).getImage()%>"><br /><a href="mailto:<%=staff.get(k).getEmail()%>"><%=staff.get(k).getName().getFname()%> <%=staff.get(k).getName().getLname()%></a></font></td>
              
              <% } } } %> 
              </tr>  
              </table>  
				 </td>           
            </tr>
            
            <%}} %>
          
           </table><br>
 
          
                		
          <p text-align="center" align="center"> <b><font size="+1">Office Hours </b><br></font><font size="2">
          All staff office hours are held in the SAL Open Lab. Prof. Miller's office hours are listed above. </font> </p>
         
          <table border="2" cellpadding="5" width="590" id = "officehoursTable">
            <tr>
              <th align="center"></th><th align="center">10:00a.m.-12:00p.m.</th><th align="center">12:00p.m.-2:00p.m.</th><th align="center">2:00p.m.-4:00p.m.</th><th align="center">4:00p.m.-6:00p.m.</th><th align="center">6:00p.m.-8:00p.m.</th>
            </tr>
            
            <% String week[] = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
            
            for(int k = 0; k<week.length; k++) {
            %>
            
            <tr>
      
            
            	<td><%=week[k]%></td> 
            
            <% counter = 0;
            for(int i = 0; i<staff.size(); i++) { 
        		for(int j=0; j<staff.get(i).getOfficeHours().size(); j++) {
        			if(staff.get(i).getOfficeHours().get(j).getDay().equals(week[k]) && !staff.get(i).getType().equals("instructor") && staff.get(i).getOfficeHours().get(j).getTime().getStart().equals("10:00a.m.")) {
            	counter++;
            %>
            
            <td align="center" class="<%=staff.get(i).getName().getFname().toLowerCase() + " " + staff.get(i).getName().getLname().toLowerCase()%>"><font size="-1"><img src="<%=staff.get(i).getImage()%>"><br /><a href="mailto:<%=staff.get(i).getEmail()%>"><%=staff.get(i).getName().getFname()%> <%=staff.get(i).getName().getLname()%></a></font></td>
            
            <%}}} %> 
            
            <% if(counter==0) { %>
            <td></td>
            <%} %>
            
            <% counter=0;
            for(int i = 0; i<staff.size(); i++) { 
        		for(int j=0; j<staff.get(i).getOfficeHours().size(); j++) {
        			if(staff.get(i).getOfficeHours().get(j).getDay().equals(week[k]) && !staff.get(i).getType().equals("instructor") && staff.get(i).getOfficeHours().get(j).getTime().getStart().equals("12:00p.m.")) {
     		counter++;
        				%>
            
            <td align="center" class="<%=staff.get(i).getName().getFname().toLowerCase() + " " + staff.get(i).getName().getLname().toLowerCase()%>"><font size="-1"><img src="<%=staff.get(i).getImage()%>"><br /><a href="mailto:<%=staff.get(i).getEmail()%>"><%=staff.get(i).getName().getFname()%> <%=staff.get(i).getName().getLname()%></a></font></td>
            
            <%}}} %> 
             <% if(counter==0) { %>
            <td></td>
            <%} %>
            
            
            <% counter=0;
            for(int i = 0; i<staff.size(); i++) { 
        		for(int j=0; j<staff.get(i).getOfficeHours().size(); j++) {
        			if(staff.get(i).getOfficeHours().get(j).getDay().equals(week[k]) && !staff.get(i).getType().equals("instructor") && staff.get(i).getOfficeHours().get(j).getTime().getStart().equals("2:00p.m.")) {
           counter++;
        				%>
            
            <td align="center" class="<%=staff.get(i).getName().getFname().toLowerCase() + " " + staff.get(i).getName().getLname().toLowerCase()%>"><font size="-1"><img src="<%=staff.get(i).getImage()%>"><br /><a href="mailto:<%=staff.get(i).getEmail()%>"><%=staff.get(i).getName().getFname()%> <%=staff.get(i).getName().getLname()%></a></font></td>
            
            <%}}} %> 
             <% if(counter==0) { %>
            <td></td>
            <%} %>
            
            
            <% counter = 0;
            for(int i = 0; i<staff.size(); i++) { 
        		for(int j=0; j<staff.get(i).getOfficeHours().size(); j++) {
        			if(staff.get(i).getOfficeHours().get(j).getDay().equals(week[k]) && !staff.get(i).getType().equals("instructor") && staff.get(i).getOfficeHours().get(j).getTime().getStart().equals("4:00p.m.")) {
           	counter++;
        				%>
            
            <td align="center" class="<%=staff.get(i).getName().getFname().toLowerCase() + " " + staff.get(i).getName().getLname().toLowerCase()%>"><font size="-1"><img src="<%=staff.get(i).getImage()%>"><br /><a href="mailto:<%=staff.get(i).getEmail()%>"><%=staff.get(i).getName().getFname()%> <%=staff.get(i).getName().getLname()%></a></font></td>
            
            <%}}} %> 
             <% if(counter==0) { %>
            <td></td>
            <%} %>
            
            
            <% counter=0;
            for(int i = 0; i<staff.size(); i++) { 
        		for(int j=0; j<staff.get(i).getOfficeHours().size(); j++) {
        			if(staff.get(i).getOfficeHours().get(j).getDay().equals(week[k]) && !staff.get(i).getType().equals("instructor") && staff.get(i).getOfficeHours().get(j).getTime().getStart().equals("6:00p.m.")) {
           counter++;
        				%>
            
            <td align="center" class="<%=staff.get(i).getName().getFname().toLowerCase() + " " + staff.get(i).getName().getLname().toLowerCase()%>"><font size="-1"><img src="<%=staff.get(i).getImage()%>"><br /><a href="mailto:<%=staff.get(i).getEmail()%>"><%=staff.get(i).getName().getFname()%> <%=staff.get(i).getName().getLname()%></a></font></td>
            
            <%}}} %> 
             <% if(counter==0) { %>
            <td></td>
            <%} %>
            
            </tr>
            
            <% } %>
            
            
            </table><br>	
            
            </div>
            
            <div id="footer">
            
            	
            	
            </div>

</div>

</body>

</html>