<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Game List</title>
</head>
<body> 
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<h3>Inputs:</h3>
	
	<label>Limit: </label>
	${IGDBReq.limit}<br>
	<label>Genres: </label>
	
	<c:forEach items="${genreList}" var="item">
	    ${item}<br>
	</c:forEach>
</body>
</html>