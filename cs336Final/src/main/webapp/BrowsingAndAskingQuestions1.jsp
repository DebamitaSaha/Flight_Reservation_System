<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browsing and Asking Questions Part 1</title>
</head>
<body>


<%@
 page import ="java.sql.*"
  %>
  
    <h2>
		<b>Browsing and Asking Questions</b>
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
    
		String questionStr = "Select * from questions join answers using(question_num, cid)";
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
		
		.warning {
		  background-color: #ffdddd;
		  border-left: 6px solid #f44336;
		}
		
		</style>
		
		
		<h2>Notes</h2>
		
		<div class="info">
		  <p><strong>Info!</strong> <br>
		The customer ID is the customer that asked the question.
		<br>
		The customer representative ID is the customer 
		representative that answered the question.
		<br>
		Click the question button to ask a question 
		</p>
		</div>
		
		<div class="warning">
		  <p><strong>Warning!</strong> <br>
		You will not be able to see questions that have not been answered here.
		<br>
		To avoid asking repeats, click the "All Questions" link to
		see all the questions that have been asked.  
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
			<th>Customer ID</th>
			<th>Question</th>
			<th>Customer Representative ID</th>
			<th>Answer</th>
		</tr>
		<%

		while (resultQuestion.next()) {	
			questionIterator = resultQuestion.getString("question_num");
					
		%>
		<tr>
			<td><%=resultQuestion.getString("question_num")%></td>
			<td><%=resultQuestion.getString("cid")%></td>
			<td><%=resultQuestion.getString("question")%></td>
			<td><%=resultQuestion.getString("crid")%></td>
			<td><%=resultQuestion.getString("answer")%></td>
			
			
			
		<tr>

	
		<%
				} 
		%>
			</table>

		<br>
		 <a href='AllQuestions.jsp'>All Questions Link</a>
		 <br>
		 <br>
		 <br>
		 
	 	
			<%
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>



</body>
</html>