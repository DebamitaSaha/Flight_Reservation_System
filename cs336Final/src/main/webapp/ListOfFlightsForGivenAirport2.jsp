<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Flights For a Given Airport Part 2</title>
</head>
<body>

<%@
 page import ="java.sql.*"
  %>
  
    <h2>
		<b>List Of Flights For a Given Airport</b>
	</h2>

<%

	String flightIterator;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
   
    String airport = request.getParameter("Airports");
    
		String flightStr = "Select flight_num, dep_airport, arr_airport, dTime, "  + 
				"aTime, duration, price, 2letterid, class from flight " +
				"where dep_airport = '" + airport + "'" +  
				" or arr_airport = '" + airport + "'";
		Statement stmtFlight = con.createStatement();
		ResultSet resultFlight = stmtFlight.executeQuery(flightStr);
		%> 
		
		Please note that if the table is empty, then
		that means that there are no flights in the database
		for that airport.
		<br>
		<br>
		<br>
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">
			<th>Flight Number</th>
			<th>Departing Airport</th>
			<th>Arriving Airport</th>
			<th>Departing Time</th>
			<th>Arriving Time</th>
			<th>Duration</th>
			<th>Price</th>
			<th>Airport ID</th>
			<th>Class</th>		
		</tr>
		<%

		while (resultFlight.next()) {	
			flightIterator = resultFlight.getString("flight_num");
					
		%>

		<tr>
			<td><%=resultFlight.getString("flight_num")%></td>
			<td><%=resultFlight.getString("dep_airport")%></td>
			<td><%=resultFlight.getString("arr_airport")%></td>
			<td><%=resultFlight.getString("dTime")%></td>
			<td><%=resultFlight.getString("aTime")%></td>
			<td><%=resultFlight.getString("duration")%></td>
			<td><%=resultFlight.getString("price")%></td>
			<td><%=resultFlight.getString("2letterid")%></td>
			<td><%=resultFlight.getString("class")%></td>
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