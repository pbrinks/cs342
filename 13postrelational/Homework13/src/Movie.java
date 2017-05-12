/**
 * Created by plb7 on 5/11/2017.
 *
 * Movie class is used to sort all of the movies by year (see GetSortedMovies class) by storing them in an ArrayList
 *  and using Collections.sort()
 */
public class Movie {
    // instance variables
    private String myID;
    private String myName;
    private String myYear;
    private String myRank;

    // accessors
    public String getID() { return myID; }
    public void setID(String id) { myID = id; }

    public String getName() { return myName; }
    public void setName(String name) { myName = name; }

    public String getYear() { return myYear; }
    public void setYear(String year) { myYear = year; }

    public String getRank() { return myRank; }
    public void setRank(String rank) { myRank = rank; }
}
