<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer that Generated the Most Revenue</title>
</head>
<body>


<%@
 page import ="java.sql.*"
  %>
  
    <h2>
		<b>Customer (cid) that Generated the Most Revenue</b>
	</h2>

<%
String ticketIterator;

try {
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
 

		String ticketStr = "SELECT round(sum(total_fare), 2) as total, cid from ticket group by cid order by total desc limit 1";
		Statement stmtTicket = con.createStatement();
		ResultSet resultTicket = stmtTicket.executeQuery(ticketStr);
		
		%> 
		
		
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">	
		</tr>
		<%	
				while (resultTicket.next()) {	
					ticketIterator = resultTicket.getString("cid");
					
					if (ticketIterator != null) {
		%>
		<tr>
			<td><%=resultTicket.getString("cid")%></td>
		<tr>
		<%
				} else {
					%>
				<tr>
					<td>There aren't any customers yet.</td>
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