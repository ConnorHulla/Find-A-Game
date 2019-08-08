package com.findagame;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProcessRequest
 */
@WebServlet("/ProcessRequest")
public class ProcessRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
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
		//get the list of consoles, then the search limit
		String [] consoleIDs = request.getParameterValues("Console");
		int limit = Integer.parseInt(request.getParameter("limit")); //get the limit, convert it to an integer
		List consoleList = Arrays.asList(consoleIDs);
		
		String url = "/DisplayResults.jsp";  //URL we will go to after we process the data
		IGDBRequest IGDBReq = new IGDBRequest();
		
		//put the data from request into our IGDBRequest object
		IGDBReq.setPlatformList(consoleList); 
		IGDBReq.setLimit(limit);
		
		/*This directs us to the DisplayResults page, and on that page we can display data from
		  our IGDBReq instance*/
		request.setAttribute("IGDBReq", IGDBReq);
		getServletContext()
		.getRequestDispatcher(url)    
		.forward(request, response);
	}

}
