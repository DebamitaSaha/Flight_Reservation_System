<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Revenue Part 2</title>
</head>
<body>

	<%
		//1 means one way, 2 means round-trip
		String filterRevenue = request.getParameter("FilterRevenue");
	
	
		if(filterRevenue.equals("flight_number")){
			
			%>
			<form method="post" action="RevenueByFlightNum.jsp">
			
		<table>
			<tr>
				<td>Enter a flight number and then click submit.</td>
				<td><input type="text" name="flight_number"></td>
			</tr>	
		</table>
				<input type="hidden" name="filter_revenue" value="<%=request.getParameter("FilterRevenue")%>" />
				<input type="submit" value="submit">
				</form>
				<%
			
		}
		
		else if(filterRevenue.equals("2letterid")){
			
			%>
			<form method="post" action="RevenueByAirlineID.jsp">
			
		<table>
			<tr>
				<td>Enter an airline ID (2-letter id) and then click submit.</td>
				<td><input type="text" name="2letterid"></td>
			</tr>	
		</table>
				<input type="hidden" name="filter_revenue" value="<%=request.getParameter("FilterRevenue")%>" />
				<input type="submit" value="submit">
				</form>
				<%
		} else if(filterRevenue.equals("cid")){
			
			%>
			<form method="post" action="RevenueByCid.jsp">
			
		<table>
			<tr>
				<td>Enter a cid and then click submit.</td>
				<td><input type="text" name="cid"></td>
			</tr>	
		</table>
				<input type="hidden" name="filter_revenue" value="<%=request.getParameter("FilterRevenue")%>" />
				<input type="submit" value="submit">
				</form>
				<%
		
		} else{
			out.println("Select flight number, Airline ID, or cid"); 
		}
		%>


</body>
</html>