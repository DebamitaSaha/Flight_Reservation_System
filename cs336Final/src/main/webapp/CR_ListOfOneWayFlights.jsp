<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative List of One Way Flights</title>
</head>
<body>
<%@ page import ="java.sql.*" %>

	<h2>
		<b>Customer Representative List of All One-Way Flights </b>
	</h2>
	
	<%
	String flightNumb;
	
	try {
 		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
	   
		String oneWayFlightString = "SELECT flight_num, aTime, dTime, dep_airport, " +
	    		"arr_airport, 2letterid, operatingDays, price, " +
	    		"class " 
	    		+ "FROM flight join FlightDates using(2letterid)"; 
	
		Statement stmt = con.createStatement();
			
		ResultSet result = stmt.executeQuery(oneWayFlightString);
	
		
		String flightNumber;
		int total;
	%>
	
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">
			<th>Airline Company</th>
			<th>Flight Number</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Departure Airport</th>
			<th>Arrival Airport</th>
			<th>Operating Date</th>
			<th>Price</th>
			<th>Class</th>
			
		</tr>
		<%
			
				while (result.next()) {	
					flightNumb = result.getString("flight_num");
		%>

		<tr>
			<td><%=result.getString("2letterid")%></td>
			<td><%=result.getString("flight_num")%></td>
			<td><%=result.getString("dTime")%></td>
			<td><%=result.getString("aTime")%></td>
			<td><%=result.getString("dep_airport")%></td>
			<td><%=result.getString("arr_airport")%></td>
			<td><%=result.getString("operatingDays")%></td>
			<td><%=result.getString("price")%></td>
			<td><%=result.getString("class")%></td>
	
		<tr>
		<%
				}
		%>
	</table>

	<%
	con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>
			

	<br>
	<form method="post" action="CR_OneWaySpecificAndInterval.jsp">
		<!-- hidden type name trip_type = "1"-->
		<table>
		<tr>
				<td>Please Enter OneWay or Round Trip again:</td>
				<td><input type="text" name="OneOrRound"></td>
			</tr>
			<tr>
				<td>Departure Airport</td>
				<td><input type="text" name="departingAirport"></td>
			</tr>
			<tr>
				<td>Arrival Airport</td>
				<td><input type="text" name="arrivingAirport"></td>
			</tr>
			<tr>
				<td>Departure Date as YYYY-MM-DD</td>
				<td><input type="date" name="departureDate"></td>
			</tr>
		</table>
		<p>
			<select name="sortFlight" size=1>
				<!-- 1 means one way, 2 means round-trip-->
				<option value="price">price</option>
				<option value="dTime">take-off time</option>
				<option value="aTime">landing time</option>
				<option value="duration">duration of flight</option>
			</select>&nbsp;
		</p>

		<br> <select name="isFlexible" size=1>
			<!-- 1 means flexible, 0 means not-->
			<option value="1">Flexible</option>
			<option value="0">Not flexible</option>
		</select>&nbsp; <br> <input type="submit" value="submit">
	</form>
	<br>
	

</body>
</html>