<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answering a Question Part 1</title>
</head>
<body>


<%@
 page import ="java.sql.*"
  %>
  
    <h2>
		<b>Answering a Question</b>
	</h2>

<%

	String questionIterator;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinewebsite","root", "Isa5927@");
    
    String id = (String)session.getAttribute("user");
	String password = (String)session.getAttribute("userPassword");

	String cridStr = "Select crid from customer_rep where cr_user = '" + id +
	"' and cr_pass = '" + password + "'";
	Statement stmtCrid = con.createStatement();
	ResultSet resultCrid = stmtCrid.executeQuery(cridStr);
	resultCrid.next();
	
	String crid = resultCrid.getString("crid");
    
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
		Click the answer button to answer a question.
		</p>
		</div>
		
		<br>
		<br>
		<br>
		
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">
			<th>Question Number</th>
			<th>Was the Question Answered?</th>
			<th>Customer ID</th>
			<th>Question</th>
			<th>Answer A Question!</th>
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
			
			
				<td>
				<form action="AnsweringAQuestion2.jsp">
				
						<table>
								<tr>
									<td>Please enter the question number that you wish to answer.</td>
									<td><input type="text" name="question_number"></td>
								</tr>
						</table>

					<input type="hidden" name="crid" value="<%=crid%>" />
					<p align="right">
					<input type="submit" value="Answer">
					<p>
				</form>
				
			</td>
			
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