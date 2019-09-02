<%@ page import="java.util.List, com.mashape.unirest.http.JsonNode" %>
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
			     <!-- if there is a picture, display it. otherwise,
			      display an image not found image" -->
			     <a href="${gameList.getJSONObject(index).getString("url")}">
			     <c:choose>
			     	<c:when test="${gameList.getJSONObject(index).has(screenshots)}">
					<img src="https://images.igdb.com/igdb/image/upload/t_screenshot_med/${gameList.getJSONObject(index).getJSONArray("screenshots").getJSONObject(0).getString("image_id")}.jpeg"
					alt="GamePic" style = "width:100%">
			 		</c:when>
			 		
			 		<c:otherwise>
					<img src="https://cdn.discordapp.com/attachments
					/353294523134377986/615258936555208763/no_game.png"
					alt="NoPic" style = "width:100%">
			 		</c:otherwise>			   		
			 	</c:choose>			
			</a>
			<div class="container">
				
			<b>${gameList.getJSONObject(index).getString("name")}</b><br>
			
			<!--  if there is a summary in this game, print it. Otherwise, 
			display the no summary avaiable text -->
			<c:choose>
				<c:when test="${gameList.getJSONObject(index).has(summary)}">
				${gameList.getJSONObject(index).getString("summary")}
				<br />
				</c:when>
				<c:otherwise>
				There is no summary available for this game.
				</c:otherwise>
		    </c:choose>

			</div>
		</div>

	</c:forEach>
	</ul>
</body>
</html>