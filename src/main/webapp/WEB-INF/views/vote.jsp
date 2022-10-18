<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Voter Details</title>
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
	%>
	<jsp:include page="navbarnew.jsp"></jsp:include>
	<div class="container mt-5 p-5 my-container">
		<div class="row">
			<div class="col-lg-6 col-md-12 col-sm-12">
			
			</div>
			<div class="col-lg-6 col-md-12 col-sm-12">
				<h3 class="text-center">Voter details</h3>
				<font color="red">${msg}</font>
				<form:form action="validateVoter" modelAttribute="voterDetails">
				
				<form:label path="adharno" cssClass="form-label">Adhar No. : </form:label>
				
				<div class="mb-3 input-group">
					<form:input path="adharno" cssClass="form-control"/>
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
							
			
			<form:label path="dob" class="form-label">Date Of Birth : </form:label>
					<div class="mb-3 input-group" id="dob">

						<form:input type="date" path="dob" cssClass="form-control"
							id="birthdate" />
						<br> <span class="input-group-text"> <i
							class="fa-solid fa-calendar-days"></i>
						</span> <b><span class="formerror" style="color: red"> </span></b>
					</div>
							
			
			
					<div class="d-grid gap-2">
						<form:button class="btn btn-primary my-btn">Submit</form:button>
					</div>
					
					<br />
					
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>