package com.findagame;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.NoSuchElementException;
import java.util.Scanner;


/**
 * Servlet implementation class ProcessRequest
 */
@WebServlet("/ProcessRequest")
public class ProcessRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public ProcessRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	//this function will process the data that the user sent us.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//get the list of consoles & genres, store them in our IGDBReqest class
		String [] consoleIDs = request.getParameterValues("Console");
		String [] genreIDs = request.getParameterValues("Genre");
		String [] gameModeIDs = request.getParameterValues("GameMode");
		int limit = Integer.parseInt(request.getParameter("limit")); //get the limit, convert it to an integer
		List<String> consoleList = Arrays.asList(consoleIDs);
		List<String> genreList = Arrays.asList(genreIDs);
		List<String> gameModeList = Arrays.asList(gameModeIDs);
		
		String url = "/DisplayResults.jsp";  //URL we will go to after we process the data
        /*instantiate an IGDBReq file, the API request is made inside this object, pass they key through the
		constructor*/
		IGDBRequest IGDBReq = new IGDBRequest("37ad0f511514726398ebb90ee401646e"); 
		
		//put the data from request into the IGDBRequest object
		IGDBReq.setPlatformList(consoleList); 
		IGDBReq.setGenreList(genreList);
		IGDBReq.setLimit(limit);
		IGDBReq.setGameModeList(gameModeList);
		
		//make post request to IGDB to get a list of games

        HttpResponse<JsonNode> jsonResponse = null;
        
        try {
             jsonResponse = Unirest.post("https://api-v3.igdb.com/games")
                    .header("user-key",  IGDBReq.getKey())
                    .body(IGDBReq.getRequest())
                    .asJson();
        } catch(UnirestException e) {
            e.printStackTrace();
        }

        /*our jsonResponse returned a list of games in JSON format, so we will iterate through them
        in the display results page. */
        JSONArray gameList = jsonResponse.getBody().getArray();
		String summary = "summary";
		String screenshots = "screenshots";
		/*This directs us to the DisplayResults page, and on that page we can display data from
		  our IGDBReq instance*/
		request.setAttribute("gameList", gameList);
		request.setAttribute("summary", summary);
		request.setAttribute("screenshots", screenshots);
		getServletContext()
		.getRequestDispatcher(url)    
		.forward(request, response);
	}
	


}
