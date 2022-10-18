<%@page import="com.cdac.VotingApp.models.Candidate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>

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

<meta charset="ISO-8859-1">
<title>Results</title>


</head>
<body>
<%
	if (request.getSession(false) == null)
		response.sendRedirect("/index");
	else if(request.getSession(false).getAttribute("isAdmin").equals("no"))
		response.sendRedirect("/userlogin");
	
	List<Candidate> candList = (List<Candidate>) request.getAttribute("list");
	%>
	
	<jsp:include page="navbarone.jsp"></jsp:include>
	
	<div class="container mt-5">
		
		<table border="1" class="table table-striped">
			<tr>
			<th>CID</th>
			<th>EID</th>
			<th>Name</th>
			<th>Party</th>
			<th>Votes</th>
		</tr>
		<%
		for (int i = 0; i < candList.size(); i++) {
		%>
		<tr>
			<td><%=candList.get(i).getCid()%></td>
			<td><%=candList.get(i).getEid()%></td>
			<td><%=candList.get(i).getName()%></td>
			<td><%=candList.get(i).getParty()%></td>
			<td><%=candList.get(i).getVotes()%></td>
			<%
			}
			%>
		</tr>
		</table>
		
	</div>
	<%-- <table border="1">
		<tr>
			<th>CID</th>
			<th>EID</th>
			<th>Name</th>
			<th>Party</th>
			<th>Votes</th>
		</tr>
		<%
		for (int i = 0; i < candList.size(); i++) {
		%>
		<tr>
			<td><%=candList.get(i).getCid()%></td>
			<td><%=candList.get(i).getEid()%></td>
			<td><%=candList.get(i).getName()%></td>
			<td><%=candList.get(i).getParty()%></td>
			<td><%=candList.get(i).getVotes()%></td>
			<%
			}
			%>
		</tr>
	</table> --%>
	<br/>
	<h3>${resultMsg}</h3>
</body>
</html>