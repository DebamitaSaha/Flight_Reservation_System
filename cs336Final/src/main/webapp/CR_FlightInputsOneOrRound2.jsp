<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Flight Inputs One or Round Pt. 2</title>
</head>
<body>

	<%
		//1 means one way, 2 means round-trip
		String oneOrRound = request.getParameter("OneOrRound");
		if(oneOrRound.equals("OneWay")){
			out.println("Selected trip type: One-Way =============> "+ "<p align='left'> <a href='CR_ListOfOneWayFlights.jsp'> Continue to Search Flight</a>  </p>");
		}
		
		else if(oneOrRound.equals("RoundTrip")){
			out.println("Selected trip type: Round trip =============> + <p align='left'> <a href='CR_ListOfRoundTripFlights.jsp'> Continue to Search Flight</a>  </p>");
		}
		
		else{
			out.println("Enter OneWay or RoundTrip"); 
		}
	
	
	%>
	<form method="post" action="CR_OneWaySpecificAndInterval.jsp">
		<input type="hidden" name="OneOrRound" value="<%=request.getParameter("OneWayOrRound")%>" />
		</form>
		<form method="post" action="CR_RoundTripSpecificAndInterval.jsp">
		<input type="hidden" name="OneOrRound" value="<%=request.getParameter("OneWayOrRound")%>" />
		</form>


</body>
</html>