<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Admin</title>
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
<% 
if (request.getSession(false) == null)
	response.sendRedirect("/index");
else if (request.getSession(false).getAttribute("isAdmin").equals("no"))
	response.sendRedirect("/userlogin");
%>
<jsp:include page="navbarone.jsp"></jsp:include>
<h1 class="text-center p-3">Welcome Admin</h1>


<div class="container my-container">
	<div class="row p-5">
		<div class="col-lg-6 col-md-12 col-sm-12 P-3">
			<img src="/images/adminpanel.png" alt="userreg" class="image-fluid"/>
		</div>
		<div class="col-lg-6 col-md-12 col-sm-12 p-3">
		<h4 class="mb-3">ADMIN TASKS: </h4>
		<div class="d-grid gap-2">
				<a href="admin/listVoter" class="btn btn-primary my-btn">Voter List</a>
				<a href="admin/listElection" class="btn btn-primary my-btn mt-3 mb-3">Election list</a>
				<a href="admin/listCandidate" class="btn btn-primary my-btn">Candidates list</a>
		</div>	
			
		</div>
	</div>
	
</div>



</body>
</html>