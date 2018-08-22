package FileInputParser;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.NoSuchElementException;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;



@WebServlet("/upload")
@MultipartConfig
public class fileParserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public fileParserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String content = null;
		boolean fileFound = true;

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String ip = request.getParameter("ip");
		String[] sslInput = request.getParameterValues("ssl");
		String ssl = null;
		boolean errorExists = false;

		HttpSession currentSession = request.getSession(); 

		if(sslInput==null) {
			ssl = "false";
		} else {
			ssl = "true";
		}

		if(username==null || username.equals("")) {
			currentSession.setAttribute("error", "Enter username please!");
			errorExists = true;
		}

		if(ip==null || ip.equals("")) {
			currentSession.setAttribute("error", "Enter ip address please!");
			errorExists = true;
		}

		if(!errorExists) {
			String address = null;

			if(password==null || password.equals("")) {
				address = "jdbc:mysql://" + ip + "/hrishivo_201_site?user=" + username + "&useSSL=" + ssl;
			} else {
				address = "jdbc:mysql://" + ip + "/hrishivo_201_site?user=" + username + "&password=" + password + "&useSSL=" + ssl;
			}
			
			
			System.out.println(address);

			SQLConnection SQLConn = new SQLConnection(address);

			try {
				Part filePart = request.getPart("file"); 
				if(filePart==null) {
					System.out.println("hrishi is the best");
				}
				InputStream fileContent = filePart.getInputStream();
				if(fileContent==null) {
					System.out.println("hrishi is the best II");
				}
				Scanner scanner = new Scanner(fileContent);
				content = scanner.useDelimiter("\\Z").next();
				Gson gson = new Gson();
				//System.out.println(content);	
				fileFound = true;
			} catch (FileNotFoundException e) {
				System.out.println("That file could not be found.\n"); // edge case
				fileFound = false;
			} catch(NoSuchElementException e) {
				fileFound = false;
			}

			if(!SQLConn.isConnected()) {
				currentSession.setAttribute("error", "Error establishing connection!");
				errorExists = true;
			}

			if(!errorExists) {
				if(fileFound) {

					Gson gson = new Gson();
					SchoolDB schoolDB = gson.fromJson(content, SchoolDB.class);
					// School
					School school = schoolDB.getSchools().get(0);
					request.setAttribute("school", school);
					// Department
					Department dept = school.getDepartments().get(0);
					request.setAttribute("department", dept);
					// Course
					Course course = dept.getCourses().get(0);
					request.setAttribute("course", course);

					currentSession.setAttribute("course", course);
					currentSession.setAttribute("department", dept);
					currentSession.setAttribute("school", school);
					currentSession.setAttribute("SQLConn", SQLConn);

					SQLConn.populateDatabase(schoolDB);

				} else {
					// If file not found retrieve information from database
					if(SQLConn.isPopulated()) {
						SQLConn.retrieveDatabaseAttributes(currentSession);
						currentSession.setAttribute("SQLConn", SQLConn);
					} else {
						currentSession.setAttribute("error", "MySQL database has not been populated yet! Pass in the JSON first");
						errorExists = true;
					}	
				}
				
				if(!errorExists) {
					String input = request.getParameter("radio");
					String d1 = "design1.css"; 
					String d2 = "design2.css";

					if(input.equals("design1")) {
						currentSession.setAttribute("design", d1);
					} else {
						currentSession.setAttribute("design", d2);
					}
					
					currentSession.setAttribute("aSort1", "dueDate");
					currentSession.setAttribute("asort2", "asc");

					currentSession.setMaxInactiveInterval(60);
				}


			}

		}


		RequestDispatcher dispatcher1 = request.getRequestDispatcher("/homepage.jsp");  
		if (dispatcher1 != null) {  
			dispatcher1.forward(request, response);  
		}

	}

}

