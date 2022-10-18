<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	%>
	
	<jsp:include page="navbartwo.jsp"></jsp:include>
	
	<font color="red">${msg}</font>
	<div class="container my-container p-5 mt-5 mb-5 "
		style="background-color: #004056;">
		<div class="row">
			<div class="col-lg-6 p-5"> <!-- images/adminelection.png  -->
				<img src="/images/adminelection.png" alt="userrr" class="img-fluid">
			</div>

			<div class="col-lg-6 p-4">
	
	<h3 class="">Create election</h3>
	<br />
	<font color="red">${msg}</font>
	<form:form action="addElection" modelAttribute="electionDetails" name="myForm" onsubmit="return validateForm()" >
	
		<form:label path="name" cssClass="form-label">Name : </form:label>
		<div class="input-group mb-3" id="fName">
			<form:input type="text" path="name" cssClass="form-control" id="name" /><br>
			<span class="input-group-text"> 
			<i class="fa-solid fa-user-secret"></i><br>
			</span> <b><span class="formerror" style="color: red"> </span></b>
		</div>
		 	
		 <form:label path="date" cssClass="form-label">Date : </form:label>
		 <div class="input-group mb-3" id="electdate">
		 	<form:input type="date" path="date" cssClass="form-control" id="date" />
		 	<span class="input-group-text"> 
			<i class="fa-solid fa-calendar-days"></i><br>
			</span> <b><span class="formerror" style="color: red"> </span></b>
		 </div>	
		 
		<form:hidden path="status" value="inactive"/>
		<div class="d-grid gap-2">
			<form:button class="btn my-btn">Add</form:button>
		</div>
		
	</form:form>
	</div>
		</div>
	</div>

	<script src="/js/createElectionform.js"></script>
	
</body>
</html>