<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Wait List</title>
</head>
<body>


<%@
 page import ="java.sql.*, 
 java.util.Date, 
 java.text.SimpleDateFormat, 
 java.util.Calendar,
 java.time.LocalDate,
 java.util.ArrayList,
 java.text.ParseException"
  %>

<%
	
	try {
 		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
	    
		String OneWayOrRound = request.getParameter("tripType");
		String Class = request.getParameter("class");
		String departureAirport = request.getParameter("departureAirport");
		String arrivalAirport = request.getParameter("arrivalAirport");
		String departureDate = request.getParameter("departure_date");
		String flightNum = request.getParameter("flight_number");
		
		
		String id = (String)session.getAttribute("user");
		String password = (String)session.getAttribute("userPassword");

		String cidStr = "Select cid from user where u_user = '" + id +
		"' and u_pass = '" + password + "'";
		Statement stmtCid = con.createStatement();
		ResultSet resultCid = stmtCid.executeQuery(cidStr);
		resultCid.next();
		
		String cid = resultCid.getString("cid");
		
		
		String whoGetsWaitlistPriority = "select count(*) from waitinglist where flight_num = " 
		+ flightNum + " and departure_date = '" + departureDate + "'";
		Statement stmtWho = con.createStatement();
		ResultSet resultWho = stmtWho.executeQuery(whoGetsWaitlistPriority);
		resultWho.next();
		
		String personWithPriority = resultWho.getString("count(*)");
		int personWaitlistPriority = Integer.parseInt(personWithPriority);
		
		int thisPersonsPriorityNum = personWaitlistPriority + 1;
		
		
		String insert = "insert into waitinglist(cid, " +
		" flight_num, class, priorityNum, departure_date) values (?, ?, ?, ?, ?)";                                 
		
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		
			int ICid = Integer.parseInt(cid);
			
		int flight_num = Integer.parseInt(flightNum);
			
			ps.setInt(1, ICid);
			ps.setInt(2, flight_num);
			ps.setString(3, Class);
			ps.setInt(4, thisPersonsPriorityNum);
			ps.setDate(5, java.sql.Date.valueOf(departureDate));
			
			 // call executeUpdate to execute our sql update statement
   		 ps.executeUpdate();
   		    ps.close();
			
			out.println("You have entered the waiting list.");
		
	

		con.close();
		} catch (Exception e) {
			out.print(e);
		}
		%>

</body>
</html>