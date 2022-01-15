<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Revenue by a Particular Flight Number</title>
</head>
<body>


<%@
 page import ="java.sql.*"
  %>
  
    <h2>
		<b>Revenue By a Particular Flight Number</b>
	</h2>

<%
String ticketIterator;

try {
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
   
    String flightNum = request.getParameter("flight_number");
    
    int flightNumb = Integer.parseInt(flightNum);
    
		String ticketStr = "SELECT ROUND(SUM(total_fare),2) as total " + 
				"FROM ticket WHERE flight_num = " + flightNumb;
		Statement stmtTicket = con.createStatement();
		ResultSet resultTicket = stmtTicket.executeQuery(ticketStr);
		
		
		%> 
		
		
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">	
		</tr>
		<%
			
		while (resultTicket.next()) {	
			ticketIterator = resultTicket.getString("total");
			
			if (ticketIterator != null) {
			%>
			<tr>
				<td>$<%=resultTicket.getString("total")%></td>
			<tr>
			<%
		} else {
			%>
		<tr>
			<td>$0</td>
		<tr>		
		<%
}
		}
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>


</body>
</html>