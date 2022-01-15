<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Reserve Part 2</title>
</head>
<body>

 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*"%>

<%
	
	try {
 		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
	    
		String OneWayOrRound = request.getParameter("tripType");
		String Class = request.getParameter("class");
		String cid = request.getParameter("cid");
		String departureAirport = request.getParameter("departureAirport");
		String arrivalAirport = request.getParameter("arrivalAirport");
		String departureDate = request.getParameter("departure_date");
		String flightNum = request.getParameter("flight_number");
		
		String seatsStr = "select seats from flight join aircraft using(2letterid) " +
				"where flight_num = " + flightNum;
		Statement stmtSeats = con.createStatement();
		ResultSet resultSeats = stmtSeats.executeQuery(seatsStr);
		resultSeats.next();
		
		String seats = resultSeats.getString("seats");
		int intOfSeats = Integer.parseInt(seats);
		
		String seatNumsStr = "select count(*) from ticket where flight_num = " 
		+ flightNum + " and departure_date = '" + departureDate + "'";
		Statement stmtSeatNums = con.createStatement();
		ResultSet resultSeatNums = stmtSeatNums.executeQuery(seatNumsStr);
		resultSeatNums.next();
		
		String count = resultSeatNums.getString("count(*)");
		int count1 = Integer.parseInt(count);
		
		int seatNum = count1 + 1;
		
		if (intOfSeats == count1) {
			
			out.println("The flight is full. You are being directed to the waitlist. "+ "<p align='left'> <a href='CR_Waitlist.jsp'></a>  </p>");
			%>
			
	<br>
	<form method="post" action = "CR_Waitlist.jsp">
		<!-- hidden type name trip_type = "1"-->
		<input type="hidden" name="flight_number" value="<%=request.getParameter("flight_number")%>" />
		<input type="hidden" name="class" value="<%=request.getParameter("class")%>" />
		<input type="hidden" name="cid" value="<%=request.getParameter("cid")%>" />
		<input type="hidden" name="tripType" value="<%=request.getParameter("tripType")%>" />
		<input type="hidden" name="departureAirport" value="<%=request.getParameter("departureAirport")%>" /> 
		<input type="hidden" name="arrivalAirport" value="<%=request.getParameter("arrivalAirport")%>" /> 
		<input type="hidden" name="departure_date" value="<%=request.getParameter("departure_date")%>" />
		<input type="submit" value="submit">
	</form>
			
			<%
			
		} else {
			
			out.print("The flight is available. Please click submit to continue.");
		

			%>
				
		
	
		
	<br>
	<form method="post" action = "CR_reserve3.jsp">
		<!-- hidden type name trip_type = "1"-->
		
	<input type="hidden" name="seat_number" value="<%=seatNum%>" /> 
		<input type="hidden" name="flight_number" value="<%=request.getParameter("flight_number")%>" />
		<input type="hidden" name="class" value="<%=request.getParameter("class")%>" />
		<input type="hidden" name="cid" value="<%=request.getParameter("cid")%>" />
		<input type="hidden" name="tripType" value="<%=request.getParameter("tripType")%>" />
		<input type="hidden" name="departureAirport" value="<%=request.getParameter("departureAirport")%>" /> 
		<input type="hidden" name="arrivalAirport" value="<%=request.getParameter("arrivalAirport")%>" /> 
		<input type="hidden" name="departure_date" value="<%=request.getParameter("departure_date")%>" />
		<input type="submit" value="submit">
	</form>
	
				
		<%
		}

	con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>