<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Customer Registration</title>
</head>
<body>

<form action="Register" method="post">
<table>
<tr><td>First Name: </td><td><input type="text" name="first_name"></td><tr>
<tr><td>Last Name: </td><td><input type="text" name="last_name"></td><tr>
<tr><td>Username: </td><td><input type="text" name="username"></td><tr>
<tr><td>Password: </td><td><input type="password" name="password"></td><tr>
<tr><td></td><td><input type="submit" value="register"></td><tr>


</table>

</form>
 <p>
  Existing user. <a href="login.jsp">Login Here</a>
</body>
</html>