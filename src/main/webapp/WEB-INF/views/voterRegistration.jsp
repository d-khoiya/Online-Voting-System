<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Voter Registration</title>
</head>
<body>
	<%
if (request.getSession(false) == null)
	response.sendRedirect("/index");
else if (request.getSession(false).getAttribute("isAdmin").equals("yes"))
	response.sendRedirect("/userlogin");
%>


	
	<jsp:include page="navbarnew.jsp"></jsp:include>


	<font color="red">${msg}</font>
	<div class="container my-container p-5 mt-5 mb-5 "
		style="background-color: #004056;">
		<div class="row">
			<div class="col-lg-6 p-5">
				<img src="images/voter.png" alt="user" class="img-fluid">
			</div>

			<div class="col-lg-6 p-4">

				<h3 class="">Voter Registration</h3>
				<form:form action="verifyVoter" modelAttribute="voterDetails"
					name="myForm" onsubmit="return validateForm()">

					<form:label path="adharno" cssClass="form-label">Aadhar No. : </form:label>
					<div class="mb-3 input-group" id="adno">

						<form:input type="text" path="adharno" cssClass="form-control"
							id="adharno" />
						<br> <span class="input-group-text"> <i
							class="fa-solid fa-user-secret"></i>
						</span> <b><span class="formerror" style="color: red"> </span></b>
					</div>

					<form:label path="name" class="form-label">Name : </form:label>
					<div class="input-group mb-3" id="fName">

						<form:input path="name" cssClass="form-control" id="name"
							placeholder="Name" />
						<br> <span class="input-group-text"> <i
							class="fa-solid fa-user"></i>
						</span> <b><span class="formerror" style="color: red"> </span></b>
					</div>

					<form:label path="email" class="form-label">Email : </form:label>
					<div class="mb-3 input-group" id="mail">

						<form:input type="email" path="email" cssClass="form-control"
							id="email" placeholder="Email ID" />
						<br> <span class="input-group-text"> <i
							class="fa-regular fa-at"></i>
						</span> <b><span class="formerror" style="color: red"> </span></b>
					</div>

					<form:label path="dob" class="form-label">Date Of Birth : </form:label>
					<div class="mb-3 input-group" id="dob">

						<form:input type="date" path="dob" cssClass="form-control"
							id="birthdate" />
						<br> <span class="input-group-text"> <i
							class="fa-solid fa-calendar-days"></i>
						</span> <b><span class="formerror" style="color: red"> </span></b>
					</div>


					<form:label path="phoneno" class="form-label">Phone No : </form:label>
					<div class="input-group mb-3" id="mobno">
						<form:input type="text" path="phoneno" cssClass="form-control"
							id="phoneno" />
						<br> <span class="input-group-text"><i
							class="fa-solid fa-phone"></i> </span> <b><span class="formerror">
						</span></b> <br /> <b><span class="formerror" style="color: red">
						</span></b>
					</div>

					<div class="mb-3" id="gen">
						<form:label path="gender">
							<b>Gender : </b>
						</form:label>
						<br>
						<form:radiobutton path="gender" id="mgender" name="gender"
							value="male" />
						Male<br>
						<form:radiobutton path="gender" id="fgender" name="gender"
							value="female" />
						Female<br>
						<form:radiobutton path="gender" id="ogender" name="gender"
							value="other" />
						Other<br> <b><span class="formerror" style="color: red">
						</span></b>
					</div>

					<div class="d-grid gap-2">
						<form:button class="btn btn-success my-btn">Register</form:button>
					</div>

				</form:form>
				
			</div>
		</div>
	</div>

	<script src="js/votervalidateform.js"></script>
</body>
</html>