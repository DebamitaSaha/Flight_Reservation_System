<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reserve Pt. 3</title>
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
    
	String OneWayOrRound = request.getParameter("tripType");
	String Class = request.getParameter("class");
	String departureAirport = request.getParameter("departureAirport");
	String arrivalAirport = request.getParameter("arrivalAirport");
	String departureDate = request.getParameter("departure_date");
	String flightNum = request.getParameter("flight_number");
	String seatNumber = request.getParameter("seat_number");
	
	
	String price = "SELECT price from flight where flight_num = " + flightNum
 				+ " and class = '" + Class + "'";
		
		Statement stmt = con.createStatement();
		
		ResultSet result = stmt.executeQuery(price);
		result.next();
	
		String rsPrice = result.getString("price");

		String dateStr = "select CURRENT_DATE() as date";
		Statement stmtDate = con.createStatement();
		ResultSet resultDate = stmtDate.executeQuery(dateStr);
		resultDate.next();
		String date = resultDate.getString("date");
		
		String timeStr = "select CURRENT_TIME() as time";
		Statement stmtTime = con.createStatement();
		//Run the query against the database.
		ResultSet resultTime = stmtTime.executeQuery(timeStr);
		resultTime.next();
		String time = resultTime.getString("time");
		
		
		String id = (String)session.getAttribute("user");
		String password = (String)session.getAttribute("userPassword");

		String cidStr = "Select cid from user where u_user = '" + id +
		"' and u_pass = '" + password + "'";
		Statement stmtCid = con.createStatement();
		ResultSet resultCid = stmtCid.executeQuery(cidStr);
		resultCid.next();
		
		String cid = resultCid.getString("cid");
		
		String insert = "insert into ticket(cid, flight_num, class, seatnum, " + 
		"total_fare, departure_date, date_of_purchase, time_of_purchase) values (?, ?, ?, ?, ?, ?, ?, ?)";                                 
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
	PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
	
		int ICid = Integer.parseInt(cid);
		
	int flight_num = Integer.parseInt(flightNum);
		
		float fprice = Float.parseFloat(rsPrice);
		int seatNumb = Integer.parseInt(seatNumber);
		
		
		ps.setInt(1, ICid);
		ps.setInt(2, flight_num);
		ps.setString(3, Class);
		ps.setFloat(4, seatNumb);
		ps.setFloat(5, fprice + 25);
		ps.setDate(6, java.sql.Date.valueOf(departureDate));
		ps.setDate(7,  java.sql.Date.valueOf(date));
		ps.setTime(8, java.sql.Time.valueOf(time));


		 // call executeUpdate to execute our sql update statement
		 ps.executeUpdate();
		    ps.close();
		
		out.println("You have successfully booked the flight!");
	%>  
		
		<%
	con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>