<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight With Most Tickets Sold</title>
</head>
<body>


<%@
 page import ="java.sql.*"
  %>
  
    <h2>
		<b>Flight With Most Tickets Sold</b>
	</h2>

<%
String ticketIterator;

try {
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
 

		String ticketStr = "SELECT COUNT(flight_num) as counted, flight_num " +
				"FROM ticket GROUP BY flight_num ORDER BY counted DESC limit 1";
		Statement stmtTicket = con.createStatement();
		ResultSet resultTicket = stmtTicket.executeQuery(ticketStr);
		
		%> 
		
		
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">	
		</tr>
		<%	
				while (resultTicket.next()) {	
					ticketIterator = resultTicket.getString("flight_num");
					
					if (ticketIterator != null) {
		%>
		<tr>
			<td><%=resultTicket.getString("flight_num")%></td>
		<tr>
		<%
				} else {
					%>
				<tr>
					<td>There aren't any flights yet.</td>
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