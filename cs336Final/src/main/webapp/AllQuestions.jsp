<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Questions Link</title>
</head>
<body>

<%@
 page import ="java.sql.*"
  %>
  
    <h2>
		<b>All Questions Link</b>
	</h2>

<%

	String questionIterator;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
    
    String id = (String)session.getAttribute("user");
  		String password = (String)session.getAttribute("userPassword");
  	
  		String cidStr = "Select cid from user where u_user = '" + id +
  		"' and u_pass = '" + password + "'";
  		Statement stmtCid = con.createStatement();
  		ResultSet resultCid = stmtCid.executeQuery(cidStr);
  		resultCid.next();
  		
  		String cid = resultCid.getString("cid");
    
    String questionStr = "Select * from questions";
	Statement stmtQuestion = con.createStatement();
	ResultSet resultQuestion = stmtQuestion.executeQuery(questionStr);
	%> 
	
	<style>
	div {
	  margin-bottom: 15px;
	  padding: 4px 12px;
	}
	
	.info {
	  background-color: #e7f3fe;
	  border-left: 6px solid #2196F3;
	}
	
	</style>
	
	
	<h2>Notes</h2>
	
	<div class="info">
	  <p><strong>Info!</strong> <br>
	0 means that the question was not answered.
	<br>
	1 means that the question was answered.
	<br>
	The customer ID is the customer that asked the question.
	<br>
	The customer representative ID is the customer 
	representative that answered the question.
	<br>
	Click the question button to ask a question.
	</p>
	</div>
	
	<br>

	<form action="BrowsingAndAskingQuestions2.jsp">

		<input type="hidden" name="cid" value="<%=cid%>" />
		<input type="submit" value="Question">
	</form>
	<br>
	<br>
			
		
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">
			<th>Question Number</th>
			<th>Was the Question Answered?</th>
			<th>Customer ID</th>
			<th>Question</th>
		</tr>
		<%

	while (resultQuestion.next()) {	
		questionIterator = resultQuestion.getString("question_num");
				
	%>

	<tr>
		<td><%=resultQuestion.getString("question_num")%></td>
		<td><%=resultQuestion.getString("answeredOrNot")%></td>
		<td><%=resultQuestion.getString("cid")%></td>
		<td><%=resultQuestion.getString("question")%></td>
		
		<tr>
	
	
	
	<%
			} 
	%>
	</table>
	
		<%
		con.close();
	} catch (Exception e) {
		out.print(e);
	}
%>
    <br>
    To go back to the previous page, click this link:
    <br>
     <a href='BrowsingAndAskingQuestions1.jsp'>The Previous Page</a>
     <br>
     <br>
     <br>
    	

</body>
</html>