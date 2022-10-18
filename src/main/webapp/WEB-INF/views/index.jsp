<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Voting App Home Page</title>
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
	<jsp:include page="navbar.jsp"></jsp:include>

<h1 class="text-center p-5">Welcome to Online Voting App</h1>
<br/>
<div class="container my-container p-5">
	<div class="row">
		<div class="col-lg-6 col-sm-12 col-md-12 p-4"> 
		<h4 class="">Instructions: </h4>
		
			<ol>
				<li>To create a login username and password, you need to register first.</li>
			</ol>
	<div class="d-grid gap-2">
	<a href="userlogin" class="btn btn-primary  my-btn">Login</a>
	</div>
			
		</div>
		<div class="col-lg-6 col-sm-12 col-md-12 p-4">
		<h4 class="">Instructions: </h4>
		<ol>
				<li>Read the instructions for creating password carefully, while registering.</li>
			</ol>
			<div class="d-grid gap-2">
			<a href="registerUser" class="btn btn-primary  my-btn">SignUp</a>
			</div>
			
		</div>
	</div>
</div>
<font color="green">${msg}</font>
<br/>

<br/>
<br/>

</body>
</html>