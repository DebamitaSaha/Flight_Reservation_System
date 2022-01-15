<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answering a Question Part 3</title>
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
    String crid = request.getParameter("crid");
	String questNum = request.getParameter("question_number");
	String answer = request.getParameter("answer");


     PreparedStatement ps = con.prepareStatement("UPDATE questions SET answeredOrNot = ? " +
     " WHERE question_num = ?");                                 
    		

    		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
    		
    		ps.setInt(1, 1);
    		ps.setInt(2, Integer.parseInt(questNum));
    
    		 // call executeUpdate to execute our sql update statement
    		 ps.executeUpdate();
    		    ps.close();
    		    
  		    String insert = "insert into answers(cid, question_num, crid, answer) " + 
		    "values (?, ?, ?, ?)";                                 
    		    		
    		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
  		    PreparedStatement preparedStatement = con.prepareStatement(insert);

  		    //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself

		    preparedStatement.setInt(1, Integer.parseInt(cid));
		    preparedStatement.setInt(2, Integer.parseInt(questNum));
		    preparedStatement.setInt(3, Integer.parseInt(crid));
		    preparedStatement.setString(4, answer);


		    // call executeUpdate to execute our sql update statement
 	 		preparedStatement.executeUpdate();
		    preparedStatement.close();
	
		    out.println("You have successfully answered this question. " 
		    + "Your response will be sent to the customer. ");
		%>
		
		<%
		con.close();
		} catch (Exception e) {
			out.print(e);
		}
		%>




</body>
</html>