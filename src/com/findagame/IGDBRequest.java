package com.findagame;


public class IGDBRequest 
{
	String [] Genres, Platforms, GameModes, Themes;
    private int start_date, end_date; 
    private String key;
    private int limit;

    public IGDBRequest(String k)
    {
        this();
        key = k;
    }

    public IGDBRequest()
    {
    	
    }


    //setters for our lists
    public void setPlatformList(String [] platList) { Platforms = platList; }
    public void setGenreList(String [] genreList)   { Genres = genreList;   }
    public void setGameModeList(String [] gameModeList) { GameModes = gameModeList; }
    public void setThemeList(String [] themeList) { Themes = themeList; }
    //getters for our lists
    public String [] getGenreList() { return Genres; }
    public String getKey() { return key; }
    public void setLimit(int l) { limit = l; }
    public int getLimit() { return limit; }

    public String getRequest()
    {
        boolean hasElement = false, hasLimits = false;
        //fields we filter by in our query
        String fields = "fields name,url,platforms,genres,screenshots.image_id,themes,summary;";        
        String where = "where", addLimit = "";

        //adds genres to our query if we have Genres in our list
        if(Genres != null)
        {
            where += " genres = [";
            //adds every genre in our genre list to the string
            for(int i = 0; i < Genres.length -1; i++)
            {
                where += Genres[i] + ",";
            }
            //we didn't concatenate the last because the last element doesnt have a comma at the end
            //so concatenate the last element
            where += Genres[(Genres.length - 1)] + "]";
            hasElement = true;
        }

        //build the 'where' string that has our filters

        if(Platforms != null)
        {

            //if we have genres, add the & symbol to our string. Otherwise, we dont need it
            if(hasElement)
                where += " &";

            where += " platforms = (";
            //the platform IDs go between the () 
            for(int i = 0; i < Platforms.length -1; i++)
            {
                where += Platforms[i] + ",";
            }
            //the last item in our list is a special case
            //so instead of adding the , we add a )
            where += Platforms[(Platforms.length - 1)] + ")";
            hasElement = true;
        }

        if(GameModes != null)
        {
            //if we have already put a filter on, add the & sign to the string
            if(hasElement)
                where += " &";

            where += " game_modes = (";
            //the GameMode IDS will go inbetween () parenthesise
            for(int i = 0; i < GameModes.length -1; i++)
            {
                where += GameModes[i] + ",";
            }
            //the last item in our list is a special case
            //so instead of adding the , we add a )
            where += GameModes[GameModes.length - 1] + ")";
            hasElement = true;
        }

        //build the limit string, tells us how many results to display
        if(limit > 0)
        {
            addLimit += "limit " + limit + ";";
            hasLimits = true;
        }

        String fullRequest = fields;
        if(where.length() > 5)
            fullRequest += " " + (where + ";");
        if(hasLimits)
            fullRequest += " " + addLimit;

        return fullRequest;
    }
    
}
