<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find-A-Game</title>
</head>
<body>
<!-- This is the page the user starts on. The user will answer the questions and the information is sent
to the ProcessRequest.java servlet. -->
<h1>Answer the questions below and we'll find you some games to play</h1>


<!--  the action tells us which servlet to go to, and the method tells us to use post --> 
<form action="ProcessRequest" method="post"> 
  <fieldset>
	  <legend>What consoles do you play on?</legend> 
	  <input type="checkbox" name="Console" value=6> PC<br>
	  <input type="checkbox" name="Console" value=3> Linux<br>
	  <input type="checkbox" name="Console" value=14> Mac<br>
	  <input type="checkbox" name="Console" value=39> iOS <br>
	  <input type="checkbox" name="Console" value=34> Android <br>
	  
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
	  
	  <input type="checkbox" name="Console" value=23> Dreamcast <br>
	  <input type="checkbox" name="Console" value=32> Sega Saturn <br>
	  <input type="checkbox" name="Console" value=30> Sega 32X <br>
	  <input type="checkbox" name="Console" value=78> Sega CD <br>
	  <input type="checkbox" name="Console" value=29> Sega Mega Drive/Genesis <br>
	  <input type="checkbox" name="Console" value=64> Sega Master System<br>
	  
	  	  
  </fieldset>
  
  
  <fieldset>
	<legend>What genre are you looking for?</legend>
	<input type="checkbox" name="Genre" value="2"> Point-and-click<br>
	<input type="checkbox" name="Genre" value="4"> Fighting<br>
	<input type="checkbox" name="Genre" value="5"> Shooter<br>
	<input type="checkbox" name="Genre" value="7"> Music<br>
	<input type="checkbox" name="Genre" value="8"> Platform<br>
	<input type="checkbox" name="Genre" value="9"> Puzzle<br>
	<input type="checkbox" name="Genre" value="10"> Racing<br>
	<input type="checkbox" name="Genre" value="11"> Real Time Strategy (RTS)<br>
	<input type="checkbox" name="Genre" value="12"> Role-playing (RPG)<br>
	<input type="checkbox" name="Genre" value="13"> Simulator<br>
	<input type="checkbox" name="Genre" value="14"> Sport<br>
	<input type="checkbox" name="Genre" value="15"> Strategy<br>
	<input type="checkbox" name="Genre" value="16"> Turn-based Strategy<br>
	<input type="checkbox" name="Genre" value="24"> Tactical<br>
	<input type="checkbox" name="Genre" value="25"> Hack and slash/Beat 'em up<br>
	<input type="checkbox" name="Genre" value="26"> Quiz/Trivia<br>
	<input type="checkbox" name="Genre" value="30"> Pinball<br>
	<input type="checkbox" name="Genre" value="31"> Adventure<br>
	<input type="checkbox" name="Genre" value="32"> Indie<br>
	<input type="checkbox" name="Genre" value="33"> Arcade<br>
  </fieldset>
  
  <fieldset>
  	<legend>Select a theme: </legend>
  	<input type="checkbox" name="Theme" value="38"> Open World <br>
  	<input type="checkbox" name="Theme" value="19"> Horror <br>
  	<input type="checkbox" name="Theme" value="32"> Non-Fiction<br>
  	<input type="checkbox" name="Theme" value="1">  Action<br>
  	<input type="checkbox" name="Theme" value="18"> Science Fiction<br>
  	<input type="checkbox" name="Theme" value="23"> Stealth<br>
  	<input type="checkbox" name="Theme" value="41"> 4X (Explore, Expand, Exploit, and Exterminate)<br>
  	<input type="checkbox" name="Theme" value="31"> Drama<br>
  	<input type="checkbox" name="Theme" value="22"> Historical<br>
  </fieldset>
  
  <fieldset>
  	<legend>What game-modes are you looking for?</legend>
	<input type="checkbox" name="GameMode" value="1"> Single Player<br>
	<input type="checkbox" name="GameMode" value="2"> Multiplayer<br>
	<input type="checkbox" name="GameMode" value="3"> Co-operative<br>
	<input type="checkbox" name="GameMode" value="4"> Split-Screen<br>  
	<input type="checkbox" name="GameMode" value="5"> Massively Multiplayer Online (MMO)<br> 
  </fieldset>
  
  
  <fieldset>
	 <legend>How many games do you want?</legend>
	 <input type="text" name="limit"><br>
  </fieldset>
	 
  <input type="submit" value="Send">
  <input type="reset" value="Reset" />
  
</form>
</body>
</html>