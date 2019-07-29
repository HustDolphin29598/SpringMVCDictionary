<%@ page import="java.lang.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
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
	<c:url value="/customer-update/" var="urlEdit" />
	<c:url value="/customerDelete/" var="urlDelete" />
	<div class="container">
		<input class="form-control" type="text" id="searchText"
			placeholder="Search" aria-label="Search"
			style="display: inline-block; width: 40%; margin: 50px 50px 50px 0px">

		<button type="submit" class="btn btn-primary"
			style="display: inline-block;" onclick="Search()">Search</button>

		<form action="/action_page.php">
			<div class="form-check-inline">
				<label class="form-check-label" for="radio1"> <input
					type="radio" class="form-check-input" id="radio1" name="optradio"
					value="option1" checked>Eng - Viet
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label" for="radio2"> <input
					type="radio" class="form-check-input" id="radio2" name="optradio"
					value="option2">Viet - Eng
				</label>
			</div>
		</form>
	</div>

	<div class="container" style="margin-top: 50px"></div>
	<c:if test="${role.equals('admin')}">
		<a href="${urlSave}" id="add">Add a new word</a>
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
							<a class="card-link" data-toggle="collapse" href="#word<%=i%>">${word.word}</a>
							<c:if test="${role.equals('admin')}">
								<button type="button" class="btn btn-warning" id="delete"
									style="float: right; margin: auto 5px auto 5px">Delete</button>
							</c:if>
							<c:if test="${role.equals('admin')}">
								<button type="button" class="btn btn-success"
									style="float: right; margin: auto 5px auto 5px" id="edit"
									onclick="editWord(${word.id})">Edit</button>
							</c:if>

						</div>
						<div id="word<%=i%>" class="collapse show"
							data-parent="#accordion">
							<div class="card-body">${word.meaning}</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<script>
function editWord(id)
{
     location.href = "${urlEdit}".concat(id);
}
function Search()
{
	var word = document.getElementById("searchText").value;
    location.href = "${urlSearch}".concat(word);
}
/* $(document).ready(function(){
	var role = '${role}';
	if(role != 'admin') {
		document.getElementById("add").style.display = "none";
		document.getElementById("edit").style.display = "none";
		document.getElementById("delete").style.display = "none";
	}
	//hideError();
}); */
</script>
</body>

</html>