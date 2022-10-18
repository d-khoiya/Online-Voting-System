<%@page import="com.cdac.VotingApp.models.Candidate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/user-style.css">

<link rel="stylesheet" href="/css/forms-custom.css">

</head>
<body>

	<%
	if (request.getSession(false) == null)
		response.sendRedirect("/index");
	else if(request.getSession(false).getAttribute("isAdmin").equals("no"))
		response.sendRedirect("/userlogin");
	
	List<Candidate> candList = (List<Candidate>) request.getAttribute("list");
	%>
	<jsp:include page="navbartwo.jsp"></jsp:include>
	<h3 class="text-center">CANDIDATES TABLE</h3>
	<div class="container">
		<table class="table table-striped">
		<tr>
			<th>CandidateID</th>
			<th>ElectionID</th>
			<th>Name</th>
			<th>Party</th>
			<th>DOB</th>
			<th>Delete</th>
		</tr>
		<%
		for (int i = 0; i < candList.size(); i++) {
		%>
		<tr>
			<td><%=candList.get(i).getCid()%></td>
			<td><%=candList.get(i).getEid()%></td>
			<td><%=candList.get(i).getName()%></td>
			<td><%=candList.get(i).getParty()%></td>
			<td><%=candList.get(i).getDob()%></td>
			<td><a
				href="deleteCandidate?cid=<%=candList.get(i).getCid()%>&eid=<%=candList.get(i).getEid()%>">Delete</a></td>
			<%
			}
			%>
		</tr>
	</table>
	<div class="d-grid gap-2">
		<a href="createCandidate" class="btn btn-primary">Add candidate</a>
	</div>
	
	</div>
	
</body>
</html>