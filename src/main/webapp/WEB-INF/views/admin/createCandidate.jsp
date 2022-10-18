<%@page import="com.cdac.VotingApp.models.Election"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Candidate</title>
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

</head>
<body>

<jsp:include page="navbartwo.jsp"></jsp:include>
	<%
	if (request.getSession(false) == null)
		response.sendRedirect("/index");
	else if (request.getSession(false).getAttribute("isAdmin").equals("no"))
		response.sendRedirect("/userlogin");
	List<Election> list = (List<Election>) request.getAttribute("list");
	%>
	
	<div class="container my-container p-4 mt-5">
		<div class="row p-5">
			<div class="col-lg-6 col-md-12 col-sm-12 p-3 ">
				<img src="/images/admin.png" class="image-fluid" alt="candiate"/>
			</div>
			<div class="col-lg-6 col-md-12 col-sm-12 p-3">
				<h3>Create Candidate</h3>
	
	<font color="red">${msg}</font>
	<form:form action="addCandidate" modelAttribute="candidateDetails" name="myForm" onsubmit="return validateForm()" >
		<form:label path="name" cssClass="form-label">Name: </form:label>
		<div class="input-group mb-1" id="name">
			<form:input path="name" cssClass="form-control" id="fname" placeholder="Name" />
			<span class="input-group-text"> 
			<i class="fa-solid fa-user"></i>
			</span> 
			<b><span class="formerror"> </span></b> <br/>
		</div>


		<form:label path="party" cssClass="form-label">Party: </form:label>
		<div class="input-group mb-1" id="party">
			<form:input path="party" cssClass="form-control" id="fparty" placeholder="Party" />
			<span class="input-group-text"> 
			<i class="fa-solid fa-user"></i>
			</span> 
			<b><span class="formerror"> </span></b> <br/>
		</div>
		
		
		<form:label path="party" cssClass="form-label">Date of Birth: </form:label>
		<div class="input-group mb-1" id="date">
			<form:input type="date" path="dob" cssClass="form-control" id="fdate" placeholder="DATE"/>
			<span class="input-group-text"> 
			<i class="fa-solid fa-user"></i>
			</span> 
			<b><span class="formerror"> </span></b> <br/>
		</div>
		
		<br />
	
		Election : <form:select path="eid" class="form-select">
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
			<form:option value="<%=list.get(i).getEid() %>"><%=list.get(i).getName()%></form:option>
			<%
			}
			%>
		</form:select>
		<br />
		<div class="d-grid gap-2">
			<form:button class="btn btn-primary my-btn" style="color: black;">Add</form:button>
		</div>
	</form:form>

	
			</div>
		</div>
	</div>
	<script src="/js/createCandidate.js"></script>
</body>
</html>