<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.cdac.VotingApp.models.Election"%>
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
<title>Election</title>


</head>
<body>
	<%
	if (request.getSession(false) == null)
		response.sendRedirect("/index");
	else if (request.getSession(false).getAttribute("isAdmin").equals("no"))
		response.sendRedirect("/userlogin");
	List<Election> elecList = (List<Election>) request.getAttribute("list");
	%>
	
	<jsp:include page="navbartwo.jsp"></jsp:include>
	
	<div class="container mt-5">
		<table border="1" class="table table-striped">
  			<tr>
			<th>EID</th>
			<th>Name</th>
			<th>Date</th>
			<th>Status</th>
			<th></th>
			<th></th>
			<th></th>
		</tr>
		<%
		for (int i = 0; i < elecList.size(); i++) {
		%>
		<tr>
			<td><%=elecList.get(i).getEid()%></td>
			<td><%=elecList.get(i).getName()%></td>
			<td><%=elecList.get(i).getDate()%></td>
			<td><%=elecList.get(i).getStatus()%></td>
			<td><a href="deleteElection?eid=<%=elecList.get(i).getEid()%>">delete</a></td>
			<td><a href="results?eid=<%=elecList.get(i).getEid()%>">Result</a></td>
			<td>
			<%
			if (elecList.get(i).getStatus().equals("inactive")){
				%><a href="activateElection?eid=<%=elecList.get(i).getEid()%>" style="
				<%
					SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
					if(elecList.get(i).getDate().compareTo(formater.parse(formater.format(new Date())))==0){
						%>color:green ;<%
					}else{
				%>
				color:grey ;
				pointer-events: none ;
				<%}%>
				">Start</a>
			<%
			}else{
				%><a href="deactivateElection?eid=<%=elecList.get(i).getEid()%>" style="color:red ;">End</a>
				<%
			}
			%>
			</td>
		</tr>
		<%
			}
			%>
		</table>
		
		<!-- <div class="mt-4 d-grid gap-2" >
			<a href="createElection"><button class="btn my-btn" style="color: black;" >Create Election</button></a> background-color: blue;
		</div> -->
		
		<div class="mt-4">
			<a class="btn btn-primary" href="createElection" role="button">Create Election</a>
		</div>
	</div>
	
	
	
</body>
</html>