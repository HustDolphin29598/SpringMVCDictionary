<%@ page import="java.lang.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<title>Search Words</title>
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
	<c:url value="/add-word" var="urlSave" />
	<c:url value="/search/" var="urlSearch" />
	<c:url value="/logout/" var="urlLogout" />
	<c:url value="/edit/" var="urlEdit" />
	<c:url value="/delete/" var="urlDelete" />

	<form action="search" method="post">
		<div class="container">
			<input class="form-control" type="text" id="searchText" name="word"
				placeholder="Search" aria-label="Search"
				style="display: inline-block; width: 40%; margin: 50px 50px 50px 0px">

			<button type="submit" class="btn btn-primary"
				style="display: inline-block;" onclick="Search()">Search</button>

			<a href="${urlLogout}" style="margin-left: 460px; border: 1px">Logout</a>
			<select class="form-control" id="select-type" name="type"
				style="width: 15%">
				<option value="Eng - Viet">Eng - Viet</option>
				<option value="Viet - Eng">Viet - Eng</option>
			</select>


		</div>
	</form>


	<%-- 	<div class="container" style="margin-top: 50px">
	<a href="${urlLogout}">Logout</a>
	</div> --%>
	<div class="container" style="margin-top: 50px"></div>
	<c:if test="${isAdmin==true}">
		<div class="container" style="margin-top: 50px">
			<a href="${urlSave}" id="add">Add a new word</a>
		</div>
	</c:if>
	<div class="container" style="margin-top: 50px"></div>
	<!-- data -->
	<c:if test="${not empty listWord}">
		<%
		    int i = 0;
		%>
		<c:forEach var="word" items="${listWord}">
			<%
			    i++;
								System.out.println(i);
			%>

			<div class="container" style="margin: 5px auto 5px auto">
				<div id="accordion">
					<div class="card">
						<div class="card-header" style="vertical-align: middle">
							<a class="card-link" data-toggle="collapse"
								href="#word<%=i%>">${word.word}</a>
								<div style="display:inline-block;color:brown"> [${word.wordtype}]</div>
							<c:if test="${isAdmin==true}">
								<button type="button" class="btn btn-warning" id="delete"
									style="float: right; margin: auto 5px auto 5px"
									data-toggle="modal" data-target="#modal<%=i%>">Delete</button>


								<!-- Modal -->
								<div class="modal fade" id="modal<%=i%>" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Delete
													Confirmation</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">Do you really want to delete
												this word ?</div>
											<div class="modal-footer">
												<a type="button" class="btn btn-primary" style="color: white" href="${urlDelete}${word.id}">Yes,
													I do</a>
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${isAdmin==true}">
								<button type="button" class="btn btn-success"
									style="float: right; margin: auto 5px auto 5px" id="edit"
									onclick="editWord(${word.id})">Edit</button>
							</c:if>

						</div>
						<div id="word<%=i%>" class="accordion-body collapse"
							data-parent="#accordion">
							<div class="card-body">${word.meaning}</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<script>
		function editWord(id) {
			location.href = "${urlEdit}".concat(id);
		}
		function Search() {
			var word = document.getElementById("searchText").value;
			location.href = "${urlSearch}".concat(word);
		}
		function Logout(){
			location.href = "${urlLogout}";
		}
		
	</script>
</body>

</html>