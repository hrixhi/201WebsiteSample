<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Configure Website</title>
	<h1>Welcome!</h2>
</head>

<body>

<form action="upload" method="post" enctype="multipart/form-data">
 	<div>
   		<h3>Step 1: Choose database settings!</h3>
   		Enter MySQL IP: 
   		<input type = "text" name = "ip" /><br/>
   		Enter MySQL username: 
   		<input type = "text" name = "username" /><br/>
   		Enter MySQL Password (can be blank): 
   		<input type = "password" name = "password" /><br/>
   		Use SSL: 
   		<input type = "checkbox" name = "ssl" value="selected"><br>
		<h3>Step 2: Choose a template!</h3>
   		<input type = "radio" name = "radio" value="design1" checked> Design 1 (Hint: The better design!)<br>
   		<input type = "radio" name = "radio" value="design2"> Design 2<br>
   		<h3>Step 3: Upload a JSON File!</h3>
   		<input type="file" accept=".json" name="file" /><br>
   		<h3>Step 4: Click submit!</h3>
   		<input type="submit" value="submit info" />

			<p>
				<%
					HttpSession currentSession = request.getSession();
					String error = (String) currentSession.getAttribute("error");
					if (error != null && !error.equals("")) {
				%>
				<font color="red">Error! <%=error%><br /></font>
				<%
					}
				%>
			</p>


		</div>
</form>
</body>

</html>

