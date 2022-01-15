<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success CR</title>
</head>
<body>


<%@
 page import ="java.sql.*,
 java.util.ArrayList"
  %>

<% 			if(session.getAttribute("user")!=null) {%>

	    	Welcome <%=session.getAttribute("user")%> <br> <%--this will display the username that is stored in the session.--%>
	    	<br>
	    	<a href='logout.jsp'>Log out</a><br>
	    	 <a href='CR_FlightInputs.jsp'>Flight Inputs One Way or Round Trip</a>
	 <br>
	 <a href='CR_CancelReservation1.jsp'>Cancel a Reservation</a>
	 <br>
	 <a href='CR_GetOffWaitingListCheck1.jsp'>Check if a customer will get off a flight waiting list</a>
	  <br>
	  <a href='ListOfFlightsForGivenAirport.jsp'>List of Flights for a Given Airport</a>
	   <br>
	   <a href='CustomersWaitingListPerFlight.jsp'>List of Customer Ids that are on a Waiting List for a Given Flight Number</a>
	   <br>
	   <a href='AnsweringAQuestion1.jsp'>Answering Questions from Customers</a>
	 	   <br>  	 
		<%
		}
	else {
	%>
	You are not logged in<br/>
	<a href="login.jsp">Please Login</a>
	
	<%
	} 
	%>
</body>
</html>