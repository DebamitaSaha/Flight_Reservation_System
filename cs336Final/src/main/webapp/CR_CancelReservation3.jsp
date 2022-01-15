<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancel One-Way Reservation Part 3</title>
</head>
<body>

<%@
 page import ="java.sql.*, 
 java.util.Date, 
 java.text.SimpleDateFormat, 
 java.util.Calendar,
 java.time.LocalDate,
 java.util.ArrayList"
  %>

<%

try {
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
    
    String cid = request.getParameter("cid");
	String Class = request.getParameter("class");
	String ticketNum = request.getParameter("ticket_number");
	String flightNum = request.getParameter("flight_number");
	
	if (Class.equalsIgnoreCase("Economy")) {
		out.print("Sorry, since the flight is economy, you are not allowed to cancel the ticket.");
		
	} else {
		
	
    
     PreparedStatement ps = con.prepareStatement("UPDATE ticket SET flight_num = ?, " +
     "booking_fee = ?, cancelfee = ?, class = ?, seatnum = ?, total_fare = ?, " +
    		 "departure_date = ?, date_of_purchase = ?, time_of_purchase = ? WHERE cid = ? AND ticket_num = ?");                                 
    		

    		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
    		
    		ps.setString(1, null);
    		ps.setString(2, null);
    		ps.setInt(3, 50);
    		ps.setString(4, null);
    		ps.setString(5, null);
    		ps.setString(6, null);
    		ps.setString(7, null);
    		ps.setString(8, null);
    		ps.setString(9, null);
    		ps.setInt(10, Integer.parseInt(cid));
    		ps.setInt(11, Integer.parseInt(ticketNum));
    		
    		 // call executeUpdate to execute our sql update statement
    		 ps.executeUpdate();
    		    ps.close();
	
    		    
    		    
    
	out.print("The customer has been charged a cancellation fee of $50.");
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