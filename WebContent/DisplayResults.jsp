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
	
	<h3>Games Found: </h3>
	<ul>  <!-- Prints a list of all the games that were returned from the IGDB API. -->
	<c:forEach begin="0" end ="${gameList.length() - 1}" var="index">
		<li>
		${gameList.getJSONObject(index).getString("name")}<br>
		${gameList.getJSONObject(index).getString("summary")}<br>
		</li>
	</c:forEach>
	</ul>
</body>
</html>