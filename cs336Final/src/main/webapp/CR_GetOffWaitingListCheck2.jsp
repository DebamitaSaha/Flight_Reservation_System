<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Get Off Waiting List Check 2</title>
</head>
<body>


<%@
 page import ="java.sql.*,
 java.util.ArrayList"
  %>

	
<%
	
	try {
 		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");

		String cid = request.getParameter("cid");

		
		String flightNumsInWaitingList;
		
		
		String flightNumsInWaitingListStr = "select flight_num from waitinglist where cid = " + cid;
		Statement stmtflightNums = con.createStatement();
		ResultSet resultflightNums = stmtflightNums.executeQuery(flightNumsInWaitingListStr);
		

		%>
		Please note that if you see a blank screen, then that means that the cid you have entered is not waitlisted for any flights.
		<br>
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
	<form method="post" action = "CR_GetOffWaitingListCheck3.jsp">
		<!-- hidden type name trip_type = "1"-->
		
		<table>
			<tr>
				<td>Please Enter the Flight Number that the cid is waitlisted for that you 
				want to check to see if there are any empty seats</td>
				<td><input type="text" name="flight_number"></td>
			</tr>
		</table>
		
				<table>
						<tr>
							<td>Please enter the departure date of the waitlisted flight 
							in (YYYY-MM-DD format).</td>
							<td><input type="text" name="departure_date"></td>
						</tr>
					</table>
					
					<table>
						<tr>
							<td>Please enter the trip type of the waitlisted
							 flight. (OneWay or RoundTrip) </td>
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



</body>
</html>