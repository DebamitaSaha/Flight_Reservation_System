<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Flights For a Given Airport Part 1</title>
</head>
<body>

	<h2>
	Please Select an Airport
	</h2>

	<br>
	<form method="post" action="ListOfFlightsForGivenAirport2.jsp">
		<select name="Airports" size=1>
			<!-- 1 means one way, 2 means round-trip-->
			<option value="JFK">JFK</option>
			<option value="EWR">EWR</option>
			<option value="BOS">BOS</option>
			<option value="SEA">SEA</option>
			<option value="ICN">ICN</option>
			<option value="BKK">BKK</option>
			<option value="SIN">SIN</option>
			<option value="HKG">HKG</option>
			<option value="NRT">NRT</option>
			<option value="DEL">DEL</option>
			<option value="CCU">CCU</option>
			<option value="PVG">PVG</option>
			<option value="PEK">PEK</option>
			<option value="DTW">DTW</option>
			<option value="ATL">ATL</option>
			<option value="SFO">SFO</option>
			<option value="LAX">LAX</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	<br>
	
	</form>

</body>
</html>