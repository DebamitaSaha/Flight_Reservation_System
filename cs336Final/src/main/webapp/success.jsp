<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
</head>
<body>



<%@
 page import ="java.sql.*,
 java.util.ArrayList"
  %>

<%
	    if ((session.getAttribute("user") == null)) {
	%>
	You are not logged in<br/>
	<a href="login.jsp">Please Login</a>
	<%} else {
	%>
	Welcome <%=session.getAttribute("user")%>  //this will display the username that is stored in the session.
	<br>
		<a href='logout.jsp'>Log out</a>
		<br>
	 <a href='FlightInputs.jsp'>Flight Inputs One Way or Round Trip</a>
	 <br>
	 <a href='CancelReservation1.jsp'>Cancel a Reservation</a>
	 <br>
	 <a href='PastAndUpcomingReservations.jsp'>Past and Upcoming Reservations</a>
	 <br>
	  <a href='BrowsingAndAskingQuestions1.jsp'>Sending a Question to a Customer Representative and Browsing Existing Questions</a>
	  <br>
	
<%
	
	try {
 		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
	    
	    
	    String id = (String)session.getAttribute("user");
		String password = (String)session.getAttribute("userPassword");

		String cidStr = "Select cid from user where u_user = '" + id +
		"' and u_pass = '" + password + "'";
		Statement stmtCid = con.createStatement();
		ResultSet resultCid = stmtCid.executeQuery(cidStr);
		resultCid.next();
		
		String cid = resultCid.getString("cid");
	
		
		String flightNumsInWaitingList;
		
		
		String flightNumsInWaitingListStr = "select flight_num from waitinglist where cid = " + cid;
		Statement stmtflightNums = con.createStatement();
		ResultSet resultflightNums = stmtflightNums.executeQuery(flightNumsInWaitingListStr);
		

		%>
		 <br>
		  <br>
		<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
			<tr bgcolor="008000">
				<th>Flight Number</th>
				
			</tr>
			<%
				
					while (resultflightNums.next()) {	
						flightNumsInWaitingList = resultflightNums.getString("flight_num");
			%>

			<tr>
				<td><%=resultflightNums.getString("flight_num")%></td>
			<tr>
			<%
					}
			%>
		</table>

		<br>
	<form method="post" action = "GetOffWaitingListCheck1.jsp">
		<!-- hidden type name trip_type = "1"-->
		
		<table>
			<tr>
				<td>Please Enter the Flight Number that you are waitlisted for that you 
				want to check to see if there are any empty seats if applicable</td>
				<td><input type="text" name="flight_number"></td>
			</tr>
		</table>
		
				<table>
						<tr>
							<td>Please enter the departure date of your waitlisted flight 
							in (YYYY-MM-DD format) if applicable.</td>
							<td><input type="text" name="departure_date"></td>
						</tr>
					</table>
					
					<table>
						<tr>
							<td>Please enter the trip type of your waitlisted
							 flight if applicable. (OneWay or RoundTrip) </td>
							<td><input type="text" name="trip_type"></td>
						</tr>
					</table>
					
		<input type="hidden" name="cid" value="<%=cid%>" />
		<input type="submit" value="submit">
	</form>
		
		
		
		
		<%
	
		con.close();
	} catch (Exception e) {
		out.print(e);
	}
	%>
	
	

	<%
	    }
	%>
	
</body>
</html>