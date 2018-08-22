<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="FileInputParser.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import= "java.lang.*" %>
<%
 	String input = request.getParameter("inputname");
 	input = input.toLowerCase();	
 
 	//System.out.println(input);
 	
	HttpSession currentSession = request.getSession();
	
	if(currentSession.getAttribute("course") == null) {
		response.sendRedirect("index.jsp");
		return;
	}
	
	//System.out.println("session loaded");
	
	Course course = (Course) currentSession.getAttribute("course");
	ArrayList<StaffMember> staff = course.getStaffmembers();
	ArrayList<String> matches = new ArrayList<String>();
	
	for(int i = 0; i < staff.size(); i++) {
		
		String fullName = staff.get(i).getName().getFname().toLowerCase() + " " + staff.get(i).getName().getLname().toLowerCase();
		String firstName = staff.get(i).getName().getFname().toLowerCase();
		String lastName = staff.get(i).getName().getLname().toLowerCase();

		
		if(input.equals(fullName) || input.equals(lastName) || input.equals(firstName)) {
			
			matches.add(fullName);
			
		}
		
	}
	
	String output = "";
	
	for(int i = 0; i < matches.size(); i++) {
		if(i != matches.size() - 1) {
			output += matches.get(i) + ",";
		}
		else {
			output += matches.get(i);
		}
	}

	System.out.println(output);
 %>
 
 
 <%= output %>

