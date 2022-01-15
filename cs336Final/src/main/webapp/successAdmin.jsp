<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success Admin</title>
</head>
<body>
<% 			if(session.getAttribute("user")!=null) {%>

	    	Welcome <%=session.getAttribute("user")%> <br> <%--this will display the username that is stored in the session.--%>
	    	<br>
	    	<a href='logout.jsp'>Log out</a><br>
	    	 <a href='FilterReservations.jsp'> Filtering Reservations</a>
	    	 <br>
	    	 <a href='FilterRevenue.jsp'> Filtering Revenue</a>
	    	 <br>
	    	 <a href='CustomerThatGeneratedMostRevenue.jsp'> Customer that Generated the Most Revenue</a>
	    	 <br>
	    	 <a href='FlightWithMostTicketsSold.jsp'> Most Active Flight</a>
	    	 <br>
	    	 
<%}
	else {%>
	You are not logged in<br/>
	<a href="login.jsp">Please Login</a>
	<%} 
	%>
</body>
</html>