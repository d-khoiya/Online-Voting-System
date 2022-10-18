<%@page import="com.cdac.VotingApp.models.Candidate"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidates</title>
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

	List<Candidate> list = (List<Candidate>) request.getAttribute("list");
	%>
	<jsp:include page="navbarnew.jsp"></jsp:include>
	<div class="container my-container p-5 mt-5 text-center">
		
				<h3 class="text-center">Vote for a Candidate</h3>
				<form action="vote" method="post">
					<div>
						<%
						for (int i = 0; i < list.size(); i++) {
						%>
						<label for="<%=list.get(i).getName()%>">
						<%=list.get(i).getName()%>  <!-- name of the candidate -->
						(<%=list.get(i).getParty()%>) <!-- name of the party -->
						</label>
						<input type="radio" id="<%=list.get(i).getName()%>" name="cid"
							value="<%=list.get(i).getCid()%>"><br />
						<%
						}
						%>
					</div>
					<div class="mt-4"><button class="btn btn-primary my-btn">Vote</button></div>
				</form>
				
			
	</div>


</body>
</html>