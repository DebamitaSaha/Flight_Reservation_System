<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Answering a Question 2</title>
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
    
    String questionNum = request.getParameter("question_number");
	String crid = request.getParameter("crid");
	
	int ques_num = Integer.parseInt(questionNum);

    
	String cidStr = "Select cid from questions where question_num = " + ques_num;
	Statement stmtCid = con.createStatement();
	ResultSet resultCid = stmtCid.executeQuery(cidStr);
	resultCid.next();
	String cid = resultCid.getString("cid");
	
    String questionStr = "Select question from questions where question_num = " + ques_num;
	Statement stmtQuestion = con.createStatement();
	ResultSet resultQuestion = stmtQuestion.executeQuery(questionStr);
	
	%> 
	
		<style>
		div {
		  margin-bottom: 15px;
		  padding: 4px 12px;
		}
		
		.warning {
		  background-color: #ffdddd;
		  border-left: 6px solid #f44336;
		}
		</style>
		
		<h2>Notes</h2>

		
		<div class="warning">
		  <p><strong>Caution!</strong> Your answer is 
		  limited to 1000 characters. </p>
		</div>
		
			
		<br>
		<br>
		<br>
	<table border="4" bgcolor="deeppink" cellspacing="4" cellpadding="3">
		<tr bgcolor="008000">
			<th>Question</th>

		</tr>
		<%

		while (resultQuestion.next()) {	
			questionIterator = resultQuestion.getString("question");
					
		%>

		<tr>
			<td><%=resultQuestion.getString("question")%></td>
		<tr>
	</table>
	<br>
	<br>
	<br>
	
		<%
				} 
		%>
		<form method="post" action = "AnsweringAQuestion3.jsp">
				<!-- hidden type name trip_type = "1"-->
				
						<label for="answer">Please enter the answer to the question.</label>
							<br>
							<textarea id="answer" name="answer" rows="4" cols="50"> </textarea>
							  <br>
							  <br>
							 
				<input type="hidden" name="question_number" value="<%=request.getParameter("question_number")%>" />
				<input type="hidden" name="crid" value="<%=request.getParameter("crid")%>" />
				<input type="hidden" name="cid" value="<%=cid%>" />
				<input type="submit" value="submit">
			</form>
			<%
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>