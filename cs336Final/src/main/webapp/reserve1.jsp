<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reserve Part 1</title>
</head>
<body>

<br>
	<form method="post" action = "reserve2.jsp">
		<!-- hidden type name trip_type = "1"-->
		
		

		<table>
			<tr>
				<td>Please Enter the Flight Number you wish to reserve</td>
				<td><input type="text" name="flight_number"></td>
			</tr>
			
			
		</table>
		
		
		<p>
			<select name="class" size=1>
				<option value="Economy">Economy</option>
				<option value="First">First</option>
				<option value="Business">Business</option>
			</select>&nbsp;
		</p>
		
		<input type="hidden" name="tripType" value="<%=request.getParameter("trip_type")%>" />
		<input type="hidden" name="departureAirport" value="<%=request.getParameter("departure_airport")%>" /> 
		<input type="hidden" name="arrivalAirport" value="<%=request.getParameter("arrival_airport")%>" /> 
		<input type="hidden" name="departure_date" value="<%=request.getParameter("departure_date")%>" />
		<input type="submit" value="submit">
	</form>

</body>
</html>