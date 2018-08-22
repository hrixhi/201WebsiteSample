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
	
	// MAIN WORK !!!
	
		SQLConnection SQLConn = (SQLConnection) currentSession.getAttribute("SQLConn");
		String kindOfSort = request.getParameter("AD1");	int i = 0 ;
		// SQL SORTING
		SQLConn.sortDeliverables(currentSession, "gradePercentage", kindOfSort);

		
	
	
	// retrieval
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
	
	
	
	// additional display work 
	ArrayList<Deliverable> delivs = new ArrayList<Deliverable>();
	for(int x = 0; x<assignments.size(); x++) {
		
	
	if(assignments.get(x).getDeliverables().size() == 0) {
		continue;
	} else {
		i = x;
		delivs = assignments.get(x).getDeliverables();
		//System.out.println(i);
	}
	
	}
	

	
	if(kindOfSort.equals("asc")) {
		
		CompareGP comp = new CompareGP();
		ArrayList<String> listOfDates = new ArrayList<String>();
		ArrayList<Deliverable> sortedArray = new ArrayList<Deliverable>();
		
		for(int ix = 0; ix<delivs.size(); ix++) {
			listOfDates.add(delivs.get(ix).getGradePercentage());
		}
		

	
		Collections.sort(listOfDates, comp);
		
	ArrayList<Integer> temp = new ArrayList<Integer>();
		
		for(int j = 0; j<delivs.size(); j++) {
			temp.add(0);
		}
	
	
	
		for(int ix = 0; ix<listOfDates.size(); ix++) {
			for(int j = 0; j<delivs.size(); j++) {
				if(temp.get(j) == 1) { continue; }
				if(listOfDates.get(ix).equals(delivs.get(j).getGradePercentage())) {
					sortedArray.add(delivs.get(j)); temp.set(j, 1); break;
				}
			}
		}

		assignments.get(i).setDeliverables(sortedArray);
	

		
	} else {
		
		CompareGP comp = new CompareGP();
		
		ArrayList<String> listOfDates = new ArrayList<String>();
		ArrayList<Deliverable> sortedArray = new ArrayList<Deliverable>();
		
		for(int ix = 0; ix<delivs.size(); ix++) {
			listOfDates.add(delivs.get(ix).getGradePercentage());
		}
		

	
		Collections.sort(listOfDates, comp);
		Collections.reverse(listOfDates);
		
		ArrayList<Integer> temp = new ArrayList<Integer>();
		
		for(int j = 0; j<delivs.size(); j++) {
			temp.add(0);
		}
	
	
	
		for(int ix = 0; ix<listOfDates.size(); ix++) {
			for(int j = 0; j<delivs.size(); j++) {
				if(temp.get(j) == 1) { continue; }
				if(listOfDates.get(ix).equals(delivs.get(j).getGradePercentage())) {
					sortedArray.add(delivs.get(j)); temp.set(j, 1); break;
				}
			}
		}

		assignments.get(i).setDeliverables(sortedArray);
		
		
	}
	

	
%>


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

