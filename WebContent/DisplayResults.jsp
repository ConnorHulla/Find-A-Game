<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Game List</title>
<style>

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 50%;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}
</style>
</head>

<body> 
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<h3>Games Found: </h3>
	<ul>  <!-- Prints a list of all the games that were returned from the IGDB API. -->
	<c:forEach begin="0" end ="${gameList.length() - 1}" var="index">
		<div class="card">
		    <a href="${gameList.getJSONObject(index).getString("url")}">
			<img src="https://images.igdb.com/igdb/image/upload/t_cover_big/${gameList.getJSONObject(index).getJSONArray("screenshots").getJSONObject(0).getString("image_id")}.jpeg"
			alt="GamePic" style = "width:100%">
			</a>
			<div class="container">
				<b>${gameList.getJSONObject(index).getString("name")}</b><br>
				${gameList.getJSONObject(index).getString("summary")}<br>
			</div>
		</div>

	</c:forEach>
	</ul>
</body>
</html>