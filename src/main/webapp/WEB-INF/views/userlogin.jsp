<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
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

	<div class="container my-container p-5 mt-5 mb-5"
		style="background-color: #004056;">
		<div class="row">
			<div class="col-lg-6">
				<img alt="login" src="images/signin.png" class="image-fluid" />
			</div>
			<div class="col-lg-6 p-5">
				<h3>
					User Login <i class="fa-solid fa-users ms-2"></i>
				</h3>
				<form:form action="authenticate" modelAttribute="loginDetails"
					onsubmit="return validateForm()" name="myForm">


					<form:label path="username" cssClass="form-label">Username: </form:label>
					<div class="input-group mb-1" id="username">
						<form:input path="username" id="fusername" class="form-control" />
						<span class="input-group-text"> <i class="fa-solid fa-user"></i>
						</span> <b><span class="formerror"> </span></b> <br />
					</div>

					<form:label path="password" cssClass="form-label mt-2">Password: </form:label>
					<div class="input-group mb-1" id="pass">
						<form:password path="password" id="fpass" class="form-control" />
						<span class="input-group-text pass-eye" onclick="visibilitycp()"> 
						<i class="fa-solid fa-eye" id="hideeyeonecp"></i> 
						<i class="fa-solid fa-eye-slash" id="hideeyetwocp"></i>
						</span> 
						 <b><span class="formerror"> </span></b> <br /> <b><span
							class="formerror"> </span></b> <br />
					</div>
					<font color="red">${msg}</font>
					<div class="d-grid gap-2">
						<form:button class="btn btn-primary my-btn mb-3 mt-4">Login</form:button>
					</div>

				</form:form>
				<a href="/VotingApp/registerUser" class="nav-link"
					style="padding-left: 0px; padding-right: 0px;">New User??</a>
			</div>
		</div>
	</div>



	<script src="js/validatelogin.js"></script>

</body>
</html>