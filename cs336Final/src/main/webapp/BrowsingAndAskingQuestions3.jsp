<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browsing and Asking Questions Part 3</title>
</head>
<body>


<%@ page import ="java.sql.*" %>
	<%
	

	String flightNumb;
	
	try {
 		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
	    
		String question = request.getParameter("question");
		String cid = request.getParameter("cid");

	
		String insert = "insert into questions(cid, question) values (?, ?)";                                 
		
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
	PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
	
		int ICid = Integer.parseInt(cid);
		
		
		ps.setInt(1, ICid);
		ps.setString(2, question);

		 // call executeUpdate to execute our sql update statement
		 ps.executeUpdate();
		    ps.close();
		
		out.println("Your question has been sent to a customer representative. " 
		+ "Please note that you will not be able to see your question until " + 
				" it has been answered unless you click the All Questions link " +
		"after clicking the Sending a Question to a Customer Representative " +
				"and Browsing Existing Questions link.");

		%>
		<br>
		<br>
		<br>
	  		<a href='success.jsp'>The Link To Go Back</a>
	
		<%
		con.close();
			} catch (Exception e) {
				out.print(e);
			}
		%>
</body>
</html>