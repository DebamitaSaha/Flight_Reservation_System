<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Get Off Waiting List Check 2</title>
</head>
<body>


<%@
 page import ="java.sql.*,
 java.util.ArrayList,
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
	    
	    
	    String cid = request.getParameter("cid");
		String flightNum = request.getParameter("flight_number");
		String departureDate = request.getParameter("departure_date");
		 String tripType = request.getParameter("trip_type");
		String seatNumber = request.getParameter("seat_number");
		String Class = request.getParameter("class");
		String priorityNumber = request.getParameter("priority_number");
		
		
		String currentDateStr = "SELECT CURDATE()";
		Statement stmtCurrentDate = con.createStatement();
		ResultSet resultCurrentDate = stmtCurrentDate.executeQuery(currentDateStr);
		resultCurrentDate.next();
		String currentDate = resultCurrentDate.getString("CURDATE()");
		
		try {
		 SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
	      Date currentD = sdformat.parse(currentDate);
	      Date departureD = sdformat.parse(departureDate);
	      if(currentD.compareTo(departureD) < 0) {
	    	  
	    	  if (tripType.equalsIgnoreCase("RoundTrip")) {
	  			out.print("Remember that if you were waitlisted for a Round Trip flight, " +
	  		"that it isn't enough to just get off the waiting list for half of your flight. You " +
	  					" have to go back and book the other half of your flight after booking this one.");
	  			
	  		}
	  		

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
	  			ps.executeUpdate();
	  			ps.close();
	  			
	  			
	  		//	String update = "insert into waitinglist(cid, " +
	  			//		" flight_num, class, priorityNum, departure_date) values (?, ?, ?, ?, ?)";                                 
	  					
	  					
	  			 PreparedStatement waitingListUpdate = con.prepareStatement("DELETE FROM waitinglist WHERE cid = ? and " +
	  				     "flight_num = ? and class = ? and priorityNum = ? and departure_date = ?");                                 
	  				    		

	  				    		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
	  				    		
	  				    		waitingListUpdate.setInt(1, ICid);
	  				    		waitingListUpdate.setInt(2, flight_num);
	  				    		waitingListUpdate.setString(3, Class);
	  				    		waitingListUpdate.setInt(4, Integer.parseInt(priorityNumber));
	  				    		waitingListUpdate.setDate(5, java.sql.Date.valueOf(departureDate));
	  				    		
	  				    		 // call executeUpdate to execute our sql update statement
	  				    		 waitingListUpdate.executeUpdate();
	  				    		waitingListUpdate.close();
	  			
			   out.println("<br>");
			   out.println("<br>");
			   out.println("<br>");
			   out.println("<br>");
	  			out.print("successfully added!");
	  			

	  		
	  		
	  		%>
	  		<a href='success.jsp'>The Link To Go Back</a>
	

	<%
	      } else {
	    	  out.print("Sorry, your flight has left already since your expected departure date was before the current date.");
	      }
		} catch (ParseException e) {
			out.print(e);
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