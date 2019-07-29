<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
</head>
<body>

	<h1>Add new word:</h1>
	<c:url value="/addWord" var="addWord"/>
	<form:form action="${addWord}" method="POST"
		modelAttribute="word">
    	Word: <form:input path="word" /> <br/> <br/>
    	Type: <form:input path="wordtype"/><br/> <br/>
    	Meaning: <form:input path="meaning" /> <br/> <br/>
		<button type="submit">Submit</button>
	</form:form>

</body>
</html>