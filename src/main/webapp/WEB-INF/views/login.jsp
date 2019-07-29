<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container py-5">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-6 mx-auto">

						<!-- form card login -->
						<div class="card rounded-0">
							<div class="card-header">
								<h3 class="mb-0">Login</h3>
							</div>
							<div class="card-body">
								<form:form class="form" action="login" modelAttribute="user"
									novalidate="" method="POST">
									<div class="form-group">
										<label>Username</label>
										<form:input type="text" path="username" id="username"
											class="form-control form-control-lg rounded-0"
											name="username" required="" />
										<div class="invalid-feedback">Oops, you missed this one.</div>
									</div>
									<div class="form-group">
										<label>Password</label>
										<form:input type="password" path="password"
											class="form-control form-control-lg rounded-0"
											name="password" id="password" required=""
											autocomplete="new-password" />
										<div class="invalid-feedback">Enter your password too!</div>
									</div>
									<button type="submit"
										class="btn btn-success btn-lg float-right" id="btnLogin">Login</button>
										<span class="error" id="message-error" style="color:red"></span >
								</form:form>
							</div>
							<!--/card-block-->
						</div>
						<!-- /form card login -->

					</div>


				</div>
				<!--/row-->

			</div>
			<!--/col-->
		</div>
		<!--/row-->
	</div>
	<!--/container-->

</body>
<script>
function hideError() {
	$("#username").keyup(function(){
		$("#message-error").hide();
	});
	$("#username").keydown(function(){
		$("#message-error").hide();
	});
	$("#password").keyup(function(){
		$("#message-error").hide();
	});
	$("#password").keydown(function(){
		$("#message-error").hide();
	});
}
$(document).ready(function(){
	var error = '${message}';
	if(error != '') {
		$("#message-error").text(error);
		$("#message-error").show();
	}
	//hideError();
});
</script>
</html>
