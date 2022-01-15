<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Reservations Part 2</title>
</head>
<body>

	<%
		//1 means one way, 2 means round-trip
		String filterReservations = request.getParameter("FilterReservations");
	
	
		if(filterReservations.equals("flight_number")){
			
			%>
			<form method="post" action="ReservationsByFlightNum.jsp">
			
		<table>
			<tr>
				<td>Enter a flight number and then click submit.</td>
				<td><input type="text" name="flight_number"></td>
			</tr>	
		</table>
				<input type="hidden" name="filter_reservations" value="<%=request.getParameter("FilterReservations")%>" />
				<input type="submit" value="submit">
				</form>
				<%
			
		}
		
		else if(filterReservations.equals("cid")){
			
			%>
			<form method="post" action="ReservationsByCid.jsp">
			
		<table>
			<tr>
				<td>Enter a cid and then click submit.</td>
				<td><input type="text" name="cid"></td>
			</tr>	
		</table>
				<input type="hidden" name="filter_reservations" value="<%=request.getParameter("FilterReservations")%>" />
				<input type="submit" value="submit">
				</form>
				<%
		}
		
		else{
			out.println("Select flight number or cid"); 
		}
		%>
	

</body>
</html>