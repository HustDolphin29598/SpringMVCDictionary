<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<c:url value="/editWord" var="editWord" />
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="card" style="padding: 7px auto 7px auto !important">
					<div class="card-header">
						<h4>Edit word</h4>
					</div>
					<div class="card-body">
						<form:form action="${editWord}" method="POST" modelAttribute="word">
						<form:input path="id" readonly="true" hidden="true"/> 
							<div class=""
								style="display: inline-block; margin: 5px 15px 5px auto;">
								Word: 
								<form:input readonly="true" type="text" style="display: inline-block; border:none; height:38px; width:320px"
									path="word" />
							</div>
							<div style="display: inline-block; margin: 5px auto 5px auto;">
									Type: 
								<form:input readonly="true" type="text" style="display: inline-block; border:none; height:38px; width:100px"
									path="wordtype" />
							</div>
							<div style="margin: 5px auto 15px auto;">Meaning</div>
							<form:textarea  style="border-radius:5px" rows="5" cols="74" path="meaning"/>
							<button type="submit" class="btn btn-primary" style="float:right; margin-top:15px">Add</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>