<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check Login Details</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
	<%
	    String userid = request.getParameter("username");   
	    String pwd = request.getParameter("password");
	    
	    String useridAdmin = request.getParameter("username");   
	    String pwdAdmin = request.getParameter("password");
	    
	    String useridCustomerRep = request.getParameter("username");   
	    String pwdCustomerRep = request.getParameter("password");
	    
	    
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
	    
	    Statement st1 = con.createStatement();
	    Statement st2 = con.createStatement();
	    Statement st3 = con.createStatement();
	    
	    ResultSet rs;
	    rs = st1.executeQuery("select * from user where u_user='" + userid + "' and u_pass='" + pwd + "'");
	    
	    ResultSet rsAdmin;
	    rsAdmin = st2.executeQuery("select * from administrator where a_user='" + useridAdmin + "' and a_pass='" + pwdAdmin + "'");
	    
	    ResultSet rsCustomerRep;
	    rsCustomerRep = st3.executeQuery("select * from customer_rep where cr_user='" + useridCustomerRep + "' and cr_pass='" + pwdCustomerRep + "'");
	    
	    if (rs.next()) {
	        session.setAttribute("user", userid); 
	        session.setAttribute("userPassword", pwd);
	        out.println("welcome " + userid);
	        
	        out.println("<p align='right'> <a href='logout.jsp'>Log out</a>");
	        response.sendRedirect("success.jsp");
	     } else if (rsAdmin.next()) {
	    	session.setAttribute("user", useridAdmin); // the username will be stored in the session
	        out.println("welcome " + useridAdmin);
	        out.println("<a href='logout.jsp'>Log out</a>");
	        response.sendRedirect("successAdmin.jsp");
	     } else if (rsCustomerRep.next()) {
		    	session.setAttribute("user", useridCustomerRep); // the username will be stored in the session
		    	session.setAttribute("userPassword", pwdCustomerRep);
		    	out.println("welcome " + useridCustomerRep);
		        out.println("<a href='logout.jsp'>Log out</a>");
		        response.sendRedirect("successCR.jsp");
		   
	    } else {
	    	out.println("Invalid password <a href='login.jsp'>try again</a>");
	    }
	    con.close();
	%>
	
</body>
</html>