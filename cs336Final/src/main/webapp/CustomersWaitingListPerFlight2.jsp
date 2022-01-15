<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Customers that are on the Waiting List for a Particular Flight Number Part 2</title>
</head>
<body>


<%@
 page import ="java.sql.*"
  %>
  
    <h2>
		<b>List of Customer IDs that are on the Waiting List for a Particular Flight Number</b>
	</h2>

<%

	String flightIterator;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
   
    String flightNum = request.getParameter("flight_number");
    
		String cidStr = "Select cid from waitinglist " + 
				"where flight_num = " + flightNum;
		Statement stmtCid = con.createStatement();
		ResultSet resultCid = stmtCid.executeQuery(cidStr);
		%> 
		
		Please note that if the table is empty, then
		that means that there are no cids that are on the 
		waiting list for that particular flight number.
		<br>
		<br>
		<br>
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">
			<th>Customer ID</th>		
		</tr>
		<%

		while (resultCid.next()) {	
			flightIterator = resultCid.getString("cid");
					
		%>

		<tr>
			<td><%=resultCid.getString("cid")%></td>
		<tr>
		<%
				} 
		%>
		
			<%
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>


</body>
</html>