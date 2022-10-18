<%@page import="com.cdac.VotingApp.models.Voter"%>
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
<title>Voter</title>


</head>
<body>
	<%
	if (request.getSession(false) == null)
		response.sendRedirect("/index");
	else if (request.getSession(false).getAttribute("isAdmin").equals("no"))
		response.sendRedirect("/userlogin");
	List<Voter> list = (List<Voter>) request.getAttribute("list");
	%>
	
	<jsp:include page="navbartwo.jsp"></jsp:include>
	
	<div class="container mt-5">
		<table border="1" class="table table-striped" >
		<tr>
			<th>Adhar No</th>
			<th>Name</th>
			<th>Date Of Birth</th>
			<th>Gender</th>
			<th>Phone no</th>
			<th>Email</th>
			<th></th>
		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
		%>
		<tr>
			<td><%=list.get(i).getAdharno()%></td>
			<td><%=list.get(i).getName()%></td>
			<td><%=list.get(i).getDob()%></td>
			<td><%=list.get(i).getGender()%></td>
			<td><%=list.get(i).getPhoneno()%></td>
			<td><%=list.get(i).getEmail()%></td>
			<td><a href="deleteVoter?adharno=<%=list.get(i).getAdharno()%>">delete</a></td>
			<%
			}
			%>
		</tr>
	</table>
	</div>
	
	
</body>
</html>