<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Get Off Waiting List Check 3</title>
</head>
<body>


<%@
 page import ="java.sql.*"
  %>
  
  
<%
	
	try {
 		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
	    
	    
	    String cid = request.getParameter("cid");
		String flightNum = request.getParameter("flight_number");
		String departureDate = request.getParameter("departure_date");
		
		
		String seatsStr = "select seats from flight join aircraft using(2letterid) " +
				"where flight_num = " + flightNum;
		Statement stmtSeats = con.createStatement();
		ResultSet resultSeats = stmtSeats.executeQuery(seatsStr);
		resultSeats.next();
		
		String seats = resultSeats.getString("seats");
		int intOfSeats = Integer.parseInt(seats);
		
		String seatNumsStr = "select count(*) from ticket where flight_num = " 
		+ flightNum + " and departure_date = '" + departureDate + "'";
		Statement stmtSeatNums = con.createStatement();
		ResultSet resultSeatNums = stmtSeatNums.executeQuery(seatNumsStr);
		resultSeatNums.next();
		
		String count = resultSeatNums.getString("count(*)");
		int count1 = Integer.parseInt(count);
		
		int seatNum = count1 + 1;
		
		if (intOfSeats == count1) {
			
			out.println("Sorry. There are still no available seats. Click the link below to go back " +
					"and check on their other waitlisted flights if applicable.");
						
						 out.println("<a href='successCR.jsp'>Go back</a>");	
		} else {
			
			
			String priorityCheckStr = "Select cid from waitinglist where flight_num = " 
			+ flightNum + " and departure_date = '" + departureDate + "' order " +
			"by priorityNum limit 1";
			Statement stmtPriorityCheck = con.createStatement();
			ResultSet resultPriorityCheck = stmtPriorityCheck.executeQuery(priorityCheckStr);
			resultPriorityCheck.next();
			
			String priorityCheck = resultPriorityCheck.getString("cid");
			
			int person = Integer.parseInt(cid);
			
 			String priorityNumberStr = "Select priorityNum from waitinglist where flight_num = " 
					+ flightNum + " and departure_date = '" + departureDate + "' and " +
			" cid = " + person + " order " +
					"by priorityNum limit 1";
					Statement stmtPriorityNumber = con.createStatement();
					ResultSet resultPriorityNumber = stmtPriorityNumber.executeQuery(priorityNumberStr);
					resultPriorityNumber.next();
					
					String priorityNumber = resultPriorityNumber.getString("priorityNum");
					
			
			if ((Integer.parseInt(priorityCheck)) == (Integer.parseInt(cid))) {
			
			// THIS IS HOW YOU CHECK FOR PRIORITY FROM THE WAITLIST
			//select cid from waitinglist where flight_num = 1 and departure_date = "2021-12-22" order by priorityNum limit 1;
			// IF CID = CID THEN PROCEED
			
			out.println("There is a seat available. Select what class the cid was waitlisted " +
					"for and click submit to go forward.");
						
			%>
			<br>
			<form method="post" action = "CR_GetOffWaitingListCheck4.jsp">
			
			
				<p>
					<select name="class" size=1>
						<option value="Economy">Economy</option>
						<option value="First">First</option>
						<option value="Business">Business</option>
					</select>&nbsp;
				</p>
					
				<!-- hidden type name trip_type = "1"-->
				<input type="hidden" name="priority_number" value="<%=priorityNumber%>" />
				<input type="hidden" name="flight_number" value="<%=request.getParameter("flight_number")%>" />
				<input type="hidden" name="cid" value="<%=request.getParameter("cid")%>" />
				<input type="hidden" name="departure_date" value="<%=request.getParameter("departure_date")%>" />
				<input type="hidden" name="trip_type" value="<%=request.getParameter("trip_type")%>" />
				<input type="hidden" name="seat_number" value="<%=seatNum%>" />
				<input type="submit" value="submit">
			</form>
			<%
			
		} else {
			out.println("Sorry. There are still no available seats. Click the link below to go back " +
					"and check on their other waitlisted flights if applicable.");
						
						 out.println("<a href='successCR.jsp'>Go back</a>");	
		}
		}

		
		con.close();
	} catch (Exception e) {
		out.print(e);
	}
	%>

</body>
</html>