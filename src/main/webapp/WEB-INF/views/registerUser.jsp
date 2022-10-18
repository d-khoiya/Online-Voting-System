<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
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
	<%-- <font color="red">${msg}</font>
	<form:form action="addUser" modelAttribute="userDetails">
		Username : <form:input path="username" />
		<br />
		<br />
		Password : <form:password path="password" />
		<br />
		<br />
		Confirm Password : <form:password path="" />
		<br />
		<br />
		Name : <form:input path="name" />
		<br />
		<br />
		Email : <form:input type="email" path="email" />
		<br />
		<br />		
		Phone No : <form:input path="phoneno" />
		<br />
		<br />
		<form:button>Register</form:button>
		<br />
		<br />
	</form:form>
	<br />
	<br />
	<a href="userlogin">Already User??</a> --%>
	
	
	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container my-container p-5 mt-5 mb-5"
		style="background-color: #004056;">
		<div class="row">
			<div class="col-lg-6 col-md-12 p-5">
				<img src="images/userlg.png" alt="userreg" class="iamge-fluid" />
			</div>
			<div class="col-lg-6 col-md-12 p-4">
				<h3 class="mb-3 my-heading">
					User Registration <i class="fa-solid fa-user-plus"></i>
				</h3>
				<form:form action="addUser" modelAttribute="userDetails"
					name="myForm" onsubmit="return validateForm()">


					<form:label path="username" cssClass="form-label">Username: </form:label>
					<br />
					<div class="input-group mb-1" id="username">
						<form:input path="username" cssClass="form-control" id="fusername"
							placeholder="Username" />
						<span class="input-group-text"> <i class="fa-solid fa-user"></i>
						</span> <b><span class="formerror"> </span></b> <br />
					</div>

					<form:label path="password" cssClass="form-label mt-2 ">Password: </form:label>
					<div class="input-group mb-1" id="pass">
						<form:password path="password" cssClass="form-control" id="fpass"
							placeholder="Password" />
						<span class="input-group-text pass-eye" onclick="visibility()"> 
						<i class="fa-solid fa-eye" id="hideeyeone"></i> 
						<i class="fa-solid fa-eye-slash" id="hideeyetwo"></i>
						</span> 
						<b><span class="formerror"> </span></b> <br />
					</div>
					
					<div class="mt-2">
					<a href="javascript:;" onclick="document.getElementById('rollout').style.display='block';" class="nav-link p-0 text-decoration-underline">Password Instructions: <i class="fa-solid fa-circle-info"></i></a>
					</div>
					<div class="container p-2" id="rollout">
					<h6 class="text-info">
						Password must contain: 
					</h6>
					<ul class="p-0">
						<li class="text-black"> At least one letter</li>
						<li class="text-black"> At least one capital letter</li>
						<li class="text-black"> At least one number</li>
						<li class="text-black"> At least one special character</li>
					</ul>
					<a href="javascript:;" onclick ="document.getElementById('rollout').style.display='none';" class="nav-link p-0 text-decoration-underline">Click to close instructions<i class="fa-sharp fa-solid fa-circle-xmark"></i></a>
					</div>

					<form:label path="" cssClass="form-label mt-2">Confirm Password: </form:label>
					<div class="input-group mb-1" id="cpass">
						<form:password path="" cssClass="form-control" id="fcpass"
							placeholder="Confirm Password" />
						<span class="input-group-text pass-eye" onclick="visibilitycp()"> 
						<i class="fa-solid fa-eye" id="hideeyeonecp"></i> 
						<i class="fa-solid fa-eye-slash" id="hideeyetwocp"></i>
						</span> 
						 <b><span class="formerror"> </span></b> <br />
					</div>

					<form:label path="name" cssClass="form-label mt-2">Name: </form:label>
					<div class="input-group mb-1" id="name">

						<form:input path="name" cssClass="form-control" id="fname"
							placeholder="Name" />
						<span class="input-group-text"> <i class="fa-solid fa-user"></i>
						</span> <b><span class="formerror"> </span></b> <br />
					</div>

					<form:label path="email" cssClass="form-label mt-2">Email: </form:label>
					<div class="input-group mb-1" id="email">

						<form:input type="email" path="email" cssClass="form-control"
							id="femail" placeholder="Email ID" />
						<span class="input-group-text"> <i class="fa-regular fa-at"></i>
						</span> <b><span class="formerror"> </span></b> <br />
					</div>

					<form:label path="phoneno" cssClass="form-label mt-2">Phone No: </form:label>
					<div class="input-group mb-1" id="phone">
						<form:input path="phoneno" cssClass="form-control" id="fphone"
							placeholder="Phone No." />
						<span class="input-group-text"><i class="fa-solid fa-phone"></i>
						</span> <b><span class="formerror"> </span></b> <br />
					</div>

					<div class="d-grid gap-2">
						<form:button class="btn btn-primary my-btn mb-3 mt-3">Register</form:button>
					</div>
					<font color="red">${msg}</font>

				</form:form>
				
				
				<a href="userlogin" class="nav-link"
					style="padding-left: 0px; padding-right: 0px;">Already User??</a>
			</div>
		</div>
	</div>
	
<script src="js/validateuserform.js"></script>
</body>
</html>