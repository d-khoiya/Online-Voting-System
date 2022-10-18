<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
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

<link rel="stylesheet" href="css/forms-custom.css">
</head>
<body>
	<%
	if (request.getSession(false) == null)
		response.sendRedirect("/index");
	else if (request.getSession(false).getAttribute("isAdmin").equals("yes"))
		response.sendRedirect("/userlogin");
	%>
	
	<jsp:include page="navbarnew.jsp"></jsp:include>
	<h1 class="text-center p-5">Welcome User${msg}</h1>

	
	<div class="container my-container p-5">
	<div class="row">
		<div class="col-lg-6 col-sm-12 col-md-12 p-4"> 
		<h4 class="">Instructions: </h4>
			<ol>
				<li>To vote for your desired candidate, choose an election first.</li>
			</ol>
	<div class="d-grid gap-2">
	<a href="elections" class="btn btn-primary  my-btn">Elections</a>
	</div>
			
		</div>
		<div class="col-lg-6 col-sm-12 col-md-12 p-4">
		<h4 class="">Instructions: </h4>
		<ol>
				<li>For voter registration, carefully feed the aadhar information</li>
			</ol>
			<div class="d-grid gap-2">
			<a href="voterRegistration" class="btn btn-primary  my-btn">Voter Registration</a>
			</div>
			
		</div>
	</div>
</div>
</body>
</html>