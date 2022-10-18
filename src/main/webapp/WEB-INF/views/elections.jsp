<%@page import="com.cdac.VotingApp.models.Election"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Election</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/user-style.css">
</head>
<body>
	<%
	if (request.getSession(false) == null)
		response.sendRedirect("/index");
	else if (request.getSession(false).getAttribute("isAdmin").equals("yes"))
		response.sendRedirect("/userlogin");

	List<Election> list = (List<Election>) request.getAttribute("list");
	%>
	<jsp:include page="navbarnew.jsp"></jsp:include>
	<div class="container my-container mt-5 p-5">
		<div class="row p-3">
			<div class="col-lg-6 col-md-12 col-sm-12 p-2">
			
			</div>
			<div class="col-lg-6 col-md-12 col-sm-12 p-2">
			<h3>Choose Election</h3>
				<form action="candidate" method="post">	
				Election : <select name="eid" class="form-select">
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
			<option value="<%=list.get(i).getEid() %>">
			<%=list.get(i).getName()%>
			</option>
			<%
			}
			%>
		</select>
		<br />

		<div class="d-grid gap-2 mt-2">
		<button class="btn btn-primary my-btn">Submit</button>
		</div>
	</form>
			</div>
		</div>
	</div>
	
</body>
</html>