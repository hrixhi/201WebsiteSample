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
	
	//System.out.println(input);
	
	Course course = (Course) currentSession.getAttribute("course");
	Schedule schedule = course.getSchedule();
	ArrayList<Week> weeks = schedule.getWeeks();
	ArrayList<String> matches = new ArrayList<String>();
	
	for(int i = 0; i < weeks.size(); i++) {
		for(int j = 0; j < weeks.get(i).getLectures().size(); j++) {
			ArrayList<Topic> topics = weeks.get(i).getLectures().get(j).getTopics();
			for(int k = 0; k<topics.size(); k++) {
				
				
				
				if(topics.get(k).getTitle().toLowerCase().equals(input)) {
					matches.add(input);
				} else {
					
					if(topics.get(k).getTitle().toLowerCase().equals("garbage collection")) {
						System.out.println("in");
					}
					
					String[] words = topics.get(k).getTitle().toLowerCase().split("\\s+");
					
					for (int l = 0; l < words.length; l++) {
					   	 words[l] = words[l].replaceAll("[^\\w]", "");
						}
					
					
					//System.out.println(words[0]);
					if(topics.get(k).getTitle().toLowerCase().equals("garbage collection")) {
						System.out.println(words[0]);
					}
				
					
					for (int l = 0; l < words.length; l++) {
				   		if(input.equals(words[l])) {
				   			matches.add(topics.get(k).getTitle().toLowerCase());
				   			break;
				   		}
					}
				}
			}			
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

System.out.println(output + "<-yeas ");
 %>
 
 
 <%=output%>


