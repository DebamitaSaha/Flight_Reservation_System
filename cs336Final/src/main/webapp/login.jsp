<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Form</title>
</head>
<body>

<form action="checkLoginDetails.jsp" method="POST">
       First Name: <input type="text" name="first_name"/> <br/>
       Last Name: <input type="text" name="last_name"/> <br/>
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     
</body>
</html>