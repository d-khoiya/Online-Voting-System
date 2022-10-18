<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OTP</title>
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


	<div class="container mt-5 p-5" style="color: #FFFFCB;">
		<div class="row p-5">
			<div class="col-lg-4"></div>
			<div class="col-lg-4 p-5" style="border-radius: 20px; background-color: #004056;">
				<h5>The OTP(One time password) has been sent to your mail</h5>
				<form action="otpVerification" method="get">
					OTP : <input type="text" name="otp" class="form-control"/>
					<div class="d-grid gap-2">
						<button class="btn btn-primary my-btn mt-2">Verify</button>
					</div>
					
				</form>
				<h4>The OTP page will <b class="text-danger">expire</b> in 120 seconds</h4>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>

	<script>
		setTimeout(function() {
			window.location.href = '/index';
		}, 120000);
	</script>

</body>
</html>