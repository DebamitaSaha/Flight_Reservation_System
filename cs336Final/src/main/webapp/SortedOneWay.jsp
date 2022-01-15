<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorted One Way</title>
</head>
<body>
<%@ page import ="java.sql.*" %>


<h2>This is the Sorted One Way Flight List.</h2>

<%
	String flightNumb;
	
	try {
 		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
	   
		//String Class = request.getParameter("class");
		String isFlexible = request.getParameter("isFlexible");
		String departingTime = request.getParameter("take_off_times");
		String arrivingTime = request.getParameter("landing_times");
		String DepartingAirport =  request.getParameter("departingAirport");
		String ArrivingAirport =  request.getParameter("arrivingAirport");
		String DepartingDate =  request.getParameter("departureDate");
		String sortBy = request.getParameter("sortBy");
		String price = request.getParameter("price");
		String stops = request.getParameter("stops");
		String name = request.getParameter("2LetterID");
		
		String weekday = "SELECT dayname(" + '"' + DepartingDate + '"' + ") as day";
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
		
		
		//String ahhhhhhh = "10:00:00";
		//String string;
		//String testing = "SELECT flightNum, aTime, dTime FROM FlightOperatedby WHERE " +
			//	" dTime <= CAST('" + ahhhhhhh + "' AS TIME)";
		//Statement test = con.createStatement();
		//ResultSet test1 = test.executeQuery(testing);
		//test1.next();
		//while (test1.next()) {	
			//string = test1.getString("flightNum");
			//out.print(string);
		//}
		
		
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
		
		%>
		
		

		<style>
			.alert {
			  padding: 20px;
			  background-color: #f44336;
			  color: white;
			}
			
			.closebtn {
			  margin-left: 15px;
			  color: white;
			  font-weight: bold;
			  float: right;
			  font-size: 22px;
			  line-height: 20px;
			  cursor: pointer;
			  transition: 0.3s;
			}
			
			.closebtn:hover {
			  color: black;
			}
		</style>
			<div class="alert">
			  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			  <strong>Caution!</strong> If you want to reserve a flight, then write 
			  down the operating date in the box under Operating Date/Reserve in (YYYY-MM-DD) 
			  format and click on the reserve button.
			</div>
			
			<br>
			<br>
			<br>

	<%	

		
		String oneWayFlight;
		if(isFlexible.equals("0")){
			
	    oneWayFlight = "SELECT flight_num, aTime, dTime, dep_airport, " +
	    		"arr_airport, 2letterid, operatingDays, price, " +
	    		"class "
	    		+ "FROM flight join FlightDates using(2letterid) " 
	    		+ "WHERE dep_airport = ('"+ DepartingAirport + "') " +
	    		"and arr_airport = ('" + ArrivingAirport + "') " + "and " + 
	    		"2letterid = '" + name + "' and price <=" 
	    		+ price + " and dTime <= CAST('" + departingTime + "' AS time) "  
	    		+ "and aTime <= CAST('" + arrivingTime + "' AS time) " 
	    		+ "and operatingDays " +
	    		"like '" + rsDayName.getString("day") + "' ORDER BY " + sortBy + ";";
		} else{
			oneWayFlight = "SELECT flight_num, aTime, dTime, dep_airport, " +
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
									+ rsDayAdd3.getString("dayAdd3") + "') ORDER BY " + sortBy 
		    		+ ";";
		}
			
			Statement oneWaySearch = con.createStatement();
			//Run the query against the database.
			ResultSet resultOneWaySearch = oneWaySearch.executeQuery(oneWayFlight);
	%>

	
			<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">
			<th>Airline Company</th>
			<th>Flight Number</th>
			<th>Departure Time</th>
			<th>Arrival Time</th>
			<th>Departure Airport</th>
			<th>Arrival Airport</th>
			<th>Operating Days</th>
			<th>Operating Date</th>
			<th>Price</th>
			<th>Class</th>
			<th>Operating Date/Reserve</th>
			
		</tr>
		<%
			
				while (resultOneWaySearch.next()) {	
					flightNumb = resultOneWaySearch.getString("flight_num");
		%>

		<tr>
			<td><%=resultOneWaySearch.getString("2letterid")%></td>
			<td><%=resultOneWaySearch.getString("flight_num")%></td>
			<td><%=resultOneWaySearch.getString("dTime")%></td>
			<td><%=resultOneWaySearch.getString("aTime")%></td>
			<td><%=resultOneWaySearch.getString("dep_airport")%></td>
			<td><%=resultOneWaySearch.getString("arr_airport")%></td>
			<td><%=resultOneWaySearch.getString("operatingDays")%></td>
			
			<%

			if(resultOneWaySearch.getString("operatingDays").equalsIgnoreCase(rsDayMinus3.getString("dayMinus3"))) {
				%>
				
				<td><%=rsDateMinus3.getString("dateMinus3")%></td>
				<%
			} else if (resultOneWaySearch.getString("operatingDays").equalsIgnoreCase(rsDayMinus2.getString("dayMinus2"))) {
				%>
				<td><%=rsDateMinus2.getString("dateMinus2")%></td>
				<%
			} else if (resultOneWaySearch.getString("operatingDays").equalsIgnoreCase(rsDayMinus1.getString("dayMinus1"))) {
				%>
				<td><%=rsDateMinus1.getString("dateMinus1")%></td>
				<% 
			} else if (resultOneWaySearch.getString("operatingDays").equalsIgnoreCase(rsDayAdd1.getString("dayAdd1"))) {
				%>
				<td><%=rsDateAdd1.getString("dateAdd1")%></td>
				<%
			} else if (resultOneWaySearch.getString("operatingDays").equalsIgnoreCase(rsDayAdd2.getString("dayAdd2"))) {
				%>
				<td><%=rsDateAdd2.getString("dateAdd2")%></td>
				<%
			} else if (resultOneWaySearch.getString("operatingDays").equalsIgnoreCase(rsDayAdd3.getString("dayAdd3"))) {
				%>
				<td><%=rsDateAdd3.getString("dateAdd3")%></td>
				<%
			} else {
				%>
				<td><%=DepartingDate%></td>
				<%
			}		
		%>
			
			<td><%=resultOneWaySearch.getString("price")%></td>
			<td><%=resultOneWaySearch.getString("class")%></td>
			
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