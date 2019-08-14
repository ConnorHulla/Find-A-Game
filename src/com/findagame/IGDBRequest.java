package com.findagame;

import java.util.LinkedList;
import java.util.List;

public class IGDBRequest 
{
	private List<String> Genres, Platforms, Publishers,Characters, GameModes, Themes;
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
        Genres = new LinkedList<String>();
        Platforms = new LinkedList<String>();
        Publishers = new LinkedList<String>();
        Characters = new LinkedList<String>();
        GameModes = new LinkedList<String>();
        Themes = new LinkedList<String>();
    }


    //setters for our lists
    public void setPlatformList(List<String> platList) { Platforms = platList; }
    public void setGenreList(List<String> genreList)   { Genres = genreList;   }
    //getters for our lists
    public List<String> getGenreList() { return Genres; }
    public String getKey() { return key; }
    public void setLimit(int l) { limit = l; }
    public int getLimit() { return limit; }

    public String getRequest()
    {
        boolean hasGenres = false, hasPlatforms = false, hasLimits = false;
        //fields we filter by in our query
        String fields = "fields name,platforms,genres,genres.name,url,themes.name,platforms.name,summary;";
        String where = "where", addLimit = "";

        //adds genres to our query if we have Genres in our list
        if(Genres.size() > 0)
        {
            where += " genres = [";
            //adds every genre in our genre list to the string
            for(int i = 0; i < Genres.size() -1; i++)
            {
                where += Genres.get(i) + ",";
            }
            //we didn't concatenate the last because the last element doesnt have a comma at the end
            //so concatenate the last element
            where += Genres.get(Genres.size() - 1) + "]";
            hasGenres = true;
        }

        //build the 'where' string that has our filters

        if(Platforms.size() > 0)
        {

            //if we have genres, add the & symbol to our string. Otherwise, we dont need it
            if(hasGenres)
                where += " &";

            where += " platforms = (";
            //the platform IDs will go inbetween [] brackets
            for(int i = 0; i < Platforms.size() -1; i++)
            {
                where += Platforms.get(i) + ",";
            }
            //the last item in our list is a special case
            //so instead of adding the , we add a )
            where += Platforms.get(Platforms.size() - 1) + ")";
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
    
    
    //add/remove elements from each list
    public void addGenre(String add)          { Genres.add(add);        }
    public void removeGenre(String rem)       { Genres.remove(rem);     }
    public void addPlatform(String add)       { Platforms.add(add);     }
    public void removePlatform(String rem)    { Platforms.remove(rem);  }
    public void addPublisher(String add)      { Publishers.add(add);    }
    public void removePublisher(String rem)   { Publishers.remove(rem); }
    public void addCharacters(String add)     { Characters.add(add);    }
    public void removeCharacters(String rem)  { Characters.remove(rem); }
    public void addGameMode(String add)       { GameModes.add(add);     }
    public void removeGameMode(String rem)    { GameModes.remove(rem);  }
    public void addTheme(String add)          { Themes.add(add);        }
    public void removeTheme(String rem)       { Themes.remove(rem);     }
}
