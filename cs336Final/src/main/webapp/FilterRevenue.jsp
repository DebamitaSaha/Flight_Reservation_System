<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Revenue Part 1</title>
</head>
<body>

<h2>
	Please Select a Way to Filter Revenue (Either by Flight Number, Airline ID, or by Cid):
	</h2>

	<br>
	<form method="post" action="FilterRevenue2.jsp">
		<select name="FilterRevenue" size=1>
			<!-- 1 means one way, 2 means round-trip-->
			<option value="flight_number">Flight Number</option>
			<option value="2letterid">Airline ID</option>
			<option value="cid">Cid</option>	
		</select>&nbsp;<br> <input type="submit" value="submit">
	<br>
	
	</form>

</body>
</html>