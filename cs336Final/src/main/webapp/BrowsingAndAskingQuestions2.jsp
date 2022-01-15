<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browsing and Asking Questions Part 2</title>
</head>
<body>


<%@
 page import ="java.sql.*"
  %>
  
    <h2>
		<b>Asking a Question</b>
	</h2>
	
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
		  <p><strong>Caution!</strong> Your question is 
		  limited to 1000 characters. </p>
		</div>
		
		<br>
		<br>
			<form method="post" action = "BrowsingAndAskingQuestions3.jsp">
				<!-- hidden type name trip_type = "1"-->
				
						<label for="question">Please enter the question you wish to ask.</label>
							<br>
							<textarea id="question" name="question" rows="4" cols="50"> </textarea>
							  <br>
							  <br>
				<input type="hidden" name="cid" value="<%=request.getParameter("cid")%>" />
				<input type="submit" value="submit">
			</form>

</body>
</html>