<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Flight Inputs One Way or Round Trip</title>
</head>
<body>

	<h2>
	Please Select a One Way (Enter OneWay) or Round Trip (Enter RoundTrip):
	</h2>

	<br>
	<form method="post" action="CR_FlightInputsOneOrRound2.jsp">
		<select name="OneOrRound" size=1>
			<!-- 1 means one way, 2 means round-trip-->
			<option value="OneWay">One-way</option>
			<option value="RoundTrip">Round trip</option>	
		</select>&nbsp;<br> <input type="submit" value="submit">
	<br>
	
	</form>

</body>
</html>