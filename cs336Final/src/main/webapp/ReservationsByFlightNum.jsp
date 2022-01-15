<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservations By Flight Number</title>
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
  
    <h2>
		<b>Reservations By Flight Number</b>
	</h2>

<%
String ticketIterator;

try {
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
   
    String flightNum = request.getParameter("flight_number");
    
    int flightNumb = Integer.parseInt(flightNum);
    
		String ticketStr = "Select * from ticket where flight_num = " 
		+ flightNumb + " and booking_fee IS NOT NULL";
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
		
			<%
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>


</body>
</html>