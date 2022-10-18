<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
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
	if(request.getSession(false)!=null)
		response.sendRedirect("index");
%>

<jsp:include page="navbarnew.jsp"></jsp:include>

<br/>

<div class="container text-center my-container p-5 mt-5">
<h1 class="text-success">${msg}</h1>
<p>Redirecting to <b class="text-danger">HOME</b> page in 5 seconds.</p>
</div>


<script>
         setTimeout(function(){
            window.location.href = '/index';
         }, 5000);
</script>
      

</body>
</html>