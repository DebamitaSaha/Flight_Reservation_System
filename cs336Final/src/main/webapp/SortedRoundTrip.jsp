<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorted Round Trip</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
	<%
	
	String flightNumb;
	
	try {
 		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
	   
		String OneWayOrRound = request.getParameter("OneWayOrRound");
		String departingTime = request.getParameter("take_off_times");
		String arrivingTime = request.getParameter("landing_times");
		String Class = request.getParameter("class");
		String price = request.getParameter("price");
		String isFlexible = request.getParameter("isFlexible");
		String DepartingAirport =  request.getParameter("departingAirport");
		String ArrivingAirport =  request.getParameter("arrivingAirport");
		String DepartingDate =  request.getParameter("departureDate");
		String ReturnDate =  request.getParameter("returnDate");
		String sortBy = request.getParameter("sortBy");
		String stops = request.getParameter("stops");
		String name = request.getParameter("2LetterID");
		
		String weekday = "SELECT dayname(" + '"' + DepartingDate + '"' +  ") as day";
		String intervalMinus1 = "SELECT dayname(DATE_SUB(" + '"' + DepartingDate + '"' + ", INTERVAL 1 DAY))"
				+ "as dayMinus1";
		String dateIntervalMinus1 = "SELECT (DATE_SUB(" + '"' + DepartingDate + '"' + ", INTERVAL 1 DAY))"
				+ "as dateMinus1";
		String intervalMinus2 = "SELECT dayname(DATE_SUB(" + '"' + DepartingDate + '"' + ", INTERVAL 2 DAY))"
				+ "as dayMinus2";
		String dateIntervalMinus2 = "SELECT (DATE_SUB(" + '"' + DepartingDate + '"' + ", INTERVAL 2 DAY))"
				+ "as dateMinus2";
		String intervalMinus3 = "SELECT dayname(DATE_SUB(" + '"' + DepartingDate + '"' + ", INTERVAL 3 DAY))"
				+ "as dayMinus3";
		String dateIntervalMinus3 = "SELECT (DATE_SUB(" + '"' + DepartingDate + '"' + ", INTERVAL 3 DAY))"
				+ "as dateMinus3";
		String intervalAddition1 = "SELECT dayname(DATE_ADD(" + '"' + DepartingDate + '"' + ", INTERVAL 1 DAY))"
				+ "as dayAdd1";
		String dateIntervalAddition1 = "SELECT (DATE_ADD(" + '"' + DepartingDate + '"' + ", INTERVAL 1 DAY))"
				+ "as dateAdd1";
		String intervalAddition2 = "SELECT dayname(DATE_ADD(" + '"' + DepartingDate + '"' + ", INTERVAL 2 DAY))"
				+ "as dayAdd2";
		String dateIntervalAddition2 = "SELECT (DATE_ADD(" + '"' + DepartingDate + '"' + ", INTERVAL 2 DAY))"
				+ "as dateAdd2";
		String intervalAddition3 = "SELECT dayname(DATE_ADD(" + '"' + DepartingDate + '"' + ", INTERVAL 3 DAY))"
				+ "as dayAdd3";
		String dateIntervalAddition3 = "SELECT (DATE_ADD(" + '"' + DepartingDate + '"' + ", INTERVAL 3 DAY))"
				+ "as dateAdd3";
		
		Statement givenWeekday = con.createStatement();
		Statement intervalSub1 = con.createStatement();
		Statement dateIntervalSub1 = con.createStatement();
		Statement intervalSub2 = con.createStatement();
		Statement dateIntervalSub2 = con.createStatement();
		Statement intervalSub3 = con.createStatement();
		Statement dateIntervalSub3 = con.createStatement();
		Statement intervalAdd1 = con.createStatement();
		Statement dateIntervalAdd1 = con.createStatement();
		Statement intervalAdd2 = con.createStatement();
		Statement dateIntervalAdd2 = con.createStatement();
		Statement intervalAdd3 = con.createStatement();
		Statement dateIntervalAdd3 = con.createStatement();
			
		ResultSet rsDayName = givenWeekday.executeQuery(weekday);
		rsDayName.next();
		
		ResultSet rsDayMinus1 = intervalSub1.executeQuery(intervalMinus1);
		rsDayMinus1.next();
		
		ResultSet rsDateMinus1 = dateIntervalSub1.executeQuery(dateIntervalMinus1);
		rsDateMinus1.next();
		
		ResultSet rsDayMinus2 = intervalSub2.executeQuery(intervalMinus2);
		rsDayMinus2.next();
		
		ResultSet rsDateMinus2 = dateIntervalSub2.executeQuery(dateIntervalMinus2);
		rsDateMinus2.next();
		
		ResultSet rsDayMinus3 = intervalSub3.executeQuery(intervalMinus3);
		rsDayMinus3.next();
		
		ResultSet rsDateMinus3 = dateIntervalSub3.executeQuery(dateIntervalMinus3);
		rsDateMinus3.next();
		
		ResultSet rsDayAdd1 = intervalAdd1.executeQuery(intervalAddition1);
		rsDayAdd1.next();
		
		ResultSet rsDateAdd1 = dateIntervalAdd1.executeQuery(dateIntervalAddition1);
		rsDateAdd1.next();
		
		ResultSet rsDayAdd2 = intervalAdd2.executeQuery(intervalAddition2);
		rsDayAdd2.next();
		
		ResultSet rsDateAdd2 = dateIntervalAdd2.executeQuery(dateIntervalAddition2);
		rsDateAdd2.next();
		
		ResultSet rsDayAdd3 = intervalAdd3.executeQuery(intervalAddition3);
		rsDayAdd3.next();
		
		ResultSet rsDateAdd3 = dateIntervalAdd3.executeQuery(dateIntervalAddition3);
		rsDateAdd3.next();
		
		String roundTripFlight;
		if(isFlexible.equals("0")){
	    
			roundTripFlight = "SELECT flight_num, aTime, dTime, dep_airport, " +
	    		"arr_airport, 2letterid, operatingDays, price, " +
	    		"class "
	    		+ "FROM flight join FlightDates using(2letterid) " 
	    		+ "WHERE dep_airport = ('"+ DepartingAirport + "') " +
	    		"and arr_airport = ('" + ArrivingAirport + "') " + "and " + 
	    	    		"2letterid = '" + name + "' and price <=" 
	    	    		+ price + " and dTime <= CAST('" + departingTime + "' AS time) "  
	    	    		+ "and aTime <= CAST('" + arrivingTime + "' AS time) " 
	    	    		+ "and operatingDays " +
	    		"like '" + rsDayName.getString("day") + "' ORDER BY " + sortBy;
		} else{
			roundTripFlight = "SELECT flight_num, aTime, dTime, dep_airport, " +
		    		"arr_airport, 2letterid, operatingDays, price, " +
		    		"class " 
		    		+ "FROM flight join FlightDates using(2letterid) " 
		    		+ "WHERE dep_airport = ('"+ DepartingAirport + "') " +
		    		"and arr_airport = ('" + ArrivingAirport + "') and " + 
				    		"2letterid = '" + name + "' and price <= " 
				    		+ price
				    		+ " and dTime <= CAST('" + departingTime + "' AS time)" + 
				    		" and aTime <= CAST('" + arrivingTime + "' AS time)" 
				    		+  " and (operatingDays " +
		    		"like '" + rsDayMinus1.getString("dayMinus1") + "'  "+  
		    				"or operatingDays like '" 
					+ rsDayMinus2.getString("dayMinus2") + "' or operatingDays " +
					"like '" + rsDayMinus3.getString("dayMinus3")
					+ "' or operatingDays like '" + rsDayName.getString("day")
							+ "' or operatingDays like '" + rsDayAdd1.getString("dayAdd1")
									+ "' or operatingDays like '" 
							+ rsDayAdd2.getString("dayAdd2") + "' or operatingDays like '" 
									+ rsDayAdd3.getString("dayAdd3") + "') ORDER BY " + sortBy;
		}
			
			Statement roundTripSearch = con.createStatement();
			//Run the query against the database.
			ResultSet resultRoundTripSearch = roundTripSearch.executeQuery(roundTripFlight);
	%>
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">
			<th>Airline Company</th>
			<th>Flight Number</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Departure Airport</th>
			<th>Arrival Airport</th>
			<th>Operating Day</th>
			<th>Operating Date</th>
			<th>Price</th>
			<th>Class</th>
			<th>Operating Date/Reserve</th>
			
		</tr>
		<%
			
				while (resultRoundTripSearch.next()) {	
					flightNumb = resultRoundTripSearch.getString("flight_num");
		%>

		<tr>
			<td><%=resultRoundTripSearch.getString("2letterid")%></td>
			<td><%=resultRoundTripSearch.getString("flight_num")%></td>
			<td><%=resultRoundTripSearch.getString("dTime")%></td>
			<td><%=resultRoundTripSearch.getString("aTime")%></td>
			<td><%=resultRoundTripSearch.getString("dep_airport")%></td>
			<td><%=resultRoundTripSearch.getString("arr_airport")%></td>
			<td><%=resultRoundTripSearch.getString("operatingDays")%></td>
			
					
			<%

			if(resultRoundTripSearch.getString("operatingDays").equalsIgnoreCase(rsDayMinus3.getString("dayMinus3"))) {
				%>
				
				<td><%=rsDateMinus3.getString("dateMinus3")%></td>
				<%
			} else if (resultRoundTripSearch.getString("operatingDays").equalsIgnoreCase(rsDayMinus2.getString("dayMinus2"))) {
				%>
				<td><%=rsDateMinus2.getString("dateMinus2")%></td>
				<%
			} else if (resultRoundTripSearch.getString("operatingDays").equalsIgnoreCase(rsDayMinus1.getString("dayMinus1"))) {
				%>
				<td><%=rsDateMinus1.getString("dateMinus1")%></td>
				<% 
			} else if (resultRoundTripSearch.getString("operatingDays").equalsIgnoreCase(rsDayAdd1.getString("dayAdd1"))) {
				%>
				<td><%=rsDateAdd1.getString("dateAdd1")%></td>
				<%
			} else if (resultRoundTripSearch.getString("operatingDays").equalsIgnoreCase(rsDayAdd2.getString("dayAdd2"))) {
				%>
				<td><%=rsDateAdd2.getString("dateAdd2")%></td>
				<%
			} else if (resultRoundTripSearch.getString("operatingDays").equalsIgnoreCase(rsDayAdd3.getString("dayAdd3"))) {
				%>
				<td><%=rsDateAdd3.getString("dateAdd3")%></td>
				<%
			} else {
				%>
				<td><%=DepartingDate%></td>
				<%
			}		
		%>
			
			<td><%=resultRoundTripSearch.getString("price")%></td>
			<td><%=resultRoundTripSearch.getString("class")%></td>
			
			<td>
				<form action="reserve1.jsp">
				
				<table>
						<tr>
							<tr>
								<td><input type="date" name="departure_date"></td>
							</tr>
						</tr>
				</table>

					<input
						type="hidden" name="departure_airport"
						value="<%=request.getParameter("departingAirport")%>" /> <input
						type="hidden" name="arrival_airport"
						value="<%=request.getParameter("arrivingAirport")%>" /> <input
						type="hidden" name="trip_type"
						value="<%=request.getParameter("OneOrRound")%>" /> <input
						type="submit" value="Reserve">
				</form>
				

			</td>
		
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


</body>
</html>