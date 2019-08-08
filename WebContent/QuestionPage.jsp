<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find-A-Game</title>
</head>
<body>
<h1>Answer the questions below and we'll find you some games to play</h1>


<p>What consoles do you play on?</p>
<form action="ProcessRequest" method="post">
  <input type="checkbox" name="Console" value=6> PC<br>
  <input type="checkbox" name="Console" value=3> Linux<br>
  <input type="checkbox" name="Console" value=14> Mac<br>
  
  <input type="checkbox" name="Console" value=130> Nintendo Switch<br>
  <input type="checkbox" name="Console" value=41> Wii U<br>
  <input type="checkbox" name="Console" value=5> Wii<br>
  <input type="checkbox" name="Console" value=21> Gamecube<br>
  <input type="checkbox" name="Console" value=4> Nintendo 64 <br>
  <input type="checkbox" name="Console" value=19> Super Nintendo<br>
  <input type="checkbox" name="Console" value=18> NES (Nintendo Entertainment System)<br>
  
  <input type="checkbox" name="Console" value=48> Playstation 4<br>
  <input type="checkbox" name="Console" value=9> Playstation 3<br>
  <input type="checkbox" name="Console" value=8> Playstation 2<br>
  <input type="checkbox" name="Console" value=7> Playstation 1<br>
  
  <input type="checkbox" name="Console" value=49> Xbox One<br>
  <input type="checkbox" name="Console" value=12> Xbox 360<br>
  <input type="checkbox" name="Console" value=11> Xbox <br>
  
  
  <p>How many games do you want?</p>
  
  <input type="text" name="limit"><br>
  <input type="submit" value="Send">
 
</form>
</body>
</html>