<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Cancel One-Way Reservation Part 2</title>
</head>
<body>

<%@
 page import ="java.sql.*, 
 java.util.Date, 
 java.text.SimpleDateFormat, 
 java.util.Calendar,
 java.time.LocalDate,
 java.util.ArrayList"
  %>

<%
String ticketIterator;
try {
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
    
    String cid = request.getParameter("cid");
		
		String ticketStr = "Select * from ticket where cid = " 
		+ cid + " and flight_num IS NOT NULL";
		Statement stmtTicket = con.createStatement();
		ResultSet resultTicket = stmtTicket.executeQuery(ticketStr);
		%> 
		
		
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">
			<th>Cid</th>
			<th>Flight Number</th>
			<th>Ticket Number</th>
			<th>Booking Fee</th>
			<th>Class</th>
			<th>Seat Number</th>
			<th>Total Fare</th>
			<th>Departure Date</th>
			<th>Date of Purchase</th>
			<th>Time of Purchase</th>		
		</tr>
		<%
			
				while (resultTicket.next()) {	
					ticketIterator = resultTicket.getString("cid");
		%>

		<tr>
			<td><%=resultTicket.getString("cid")%></td>
			<td><%=resultTicket.getString("flight_num")%></td>
			<td><%=resultTicket.getString("ticket_num")%></td>
			<td><%=resultTicket.getString("booking_fee")%></td>
			<td><%=resultTicket.getString("class")%></td>
			<td><%=resultTicket.getString("seatnum")%></td>
			<td><%=resultTicket.getString("total_fare")%></td>
			<td><%=resultTicket.getString("departure_date")%></td>
			<td><%=resultTicket.getString("date_of_purchase")%></td>
			<td><%=resultTicket.getString("time_of_purchase")%></td>
		<tr>
		<%
				}
		%>
	</table>
	
	
<br>
	<form method="post" action = "CR_CancelReservation3.jsp">
		<!-- hidden type name trip_type = "1"-->
		
		<table>
			<tr>
				<td>Please Enter the Flight Number you wish to cancel</td>
				<td><input type="text" name="flight_number"></td>
			</tr>
			<tr>
				<td>Please Enter the Ticket Number you wish to cancel</td>
				<td><input type="text" name="ticket_number"></td>
			</tr>
			
			
		</table>
		
		
		<p>
			<select name="class" size=1>
				<option value="Economy">Economy</option>
				<option value="First">First</option>
				<option value="Business">Business</option>
			</select>&nbsp;
		</p>
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