<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Customers that are on the Waiting List for a Particular Flight Number Part 1</title>
</head>
<body>

<br>
	<form method="post" action = "CustomersWaitingListPerFlight2.jsp">
		<!-- hidden type name trip_type = "1"-->
		
					<table>
						<tr>
							<td>Please enter the flight number that you want to check.</td>
							<td><input type="text" name="flight_number"></td>
						</tr>
					</table>
		<input type="submit" value="submit">
	</form>
		

</body>
</html>