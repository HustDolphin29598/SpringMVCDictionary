<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<div class="container" style="margin-top: 50px">
		<c:url value="/addWord" var="addWord" />
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="card" style="padding: 7px auto 7px auto !important">
					<div class="card-header">
						<h4>Add a word</h4>
					</div>
					<div class="card-body">
						<form:form action="${addWord}" method="POST" modelAttribute="word">
							<div class=""
								style="display: inline-block; margin: 5px 15px 5px auto;">
								Word:
								<form:input type="text"
									style="display: inline-block; border-radius:5px; height:38px; width:320px"
									path="word" />
							</div>
							<div style="display: inline-block; margin: 5px auto 5px auto;">

								<form:select class="form-control" path="wordtype" id="type">
									<form:option value="Eng - Viet" selected="selected">Eng - Viet</form:option>
									<form:option value="Viet - Eng">Viet - Eng</form:option>
								</form:select>
							</div>
							<div style="margin: 5px auto 15px auto;">Meaning</div>
							<form:textarea style="border-radius:5px" rows="5" cols="74"
								path="meaning" />
							<span class="error" id="message-error" style="color: red"></span>
							<button type="submit" class="btn btn-primary"
								style="float: right; margin-top: 15px">Add</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function hideError() {
		$("#username").keyup(function() {
			$("#message-error").hide();
		});
		$("#username").keydown(function() {
			$("#message-error").hide();
		});
		$("#password").keyup(function() {
			$("#message-error").hide();
		});
		$("#password").keydown(function() {
			$("#message-error").hide();
		});
	}
	$(document).ready(function() {
		console.log('aaaaaaaa');
		var error = '${message}';
		console.log(error);
		if (error != '') {
			$("#message-error").text(error);
			$("#message-error").show();
		}
		//hideError();
	});
</script>
</html>