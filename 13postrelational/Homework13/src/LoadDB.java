import java.util.Arrays;
import java.util.Map;

import oracle.kv.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * This program converts the imdb relational database records into a KVLite store
 *
 * @author Paige Brinks, plb7
 * @version 5/12/2017
 */
public class LoadDB {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        Connection jdbcConnection = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "imdb", "bjarne");
        Statement jdbcStatement = jdbcConnection.createStatement();

        // read in Movie
        ResultSet movieResultSet = jdbcStatement.executeQuery("SELECT id, name, year, rank FROM Movie");
        while (movieResultSet.next()) {
            // the order of which I stored Movie values is useful for when I iterate through the major keys beginning with
            //  movie in GetSortedMovies
            // movie/id/-/name
            Key nameKey = Key.createKey(Arrays.asList("movie", movieResultSet.getString(1)), Arrays.asList("name"));
            Value nameValue = Value.createValue(movieResultSet.getString(2).getBytes());
            store.put(nameKey, nameValue);

            // movie/id/-/year
            Key yearKey = Key.createKey(Arrays.asList("movie", movieResultSet.getString(1)), Arrays.asList("year"));
            Value yearValue = Value.createValue(movieResultSet.getString(3).getBytes());
            store.put(yearKey, yearValue);

            // movie/id/-/rank
            Key rankKey = Key.createKey(Arrays.asList("movie", movieResultSet.getString(1)), Arrays.asList("rank"));
            if(movieResultSet.getString(4) != null) {
                Value rankValue = Value.createValue(movieResultSet.getString(4).getBytes());
                store.put(rankKey, rankValue);
            } else {
                Value rankValue = Value.createValue("null".getBytes());
                store.put(rankKey, rankValue);
            }

        }

        // read in Actor
        // I use actor/id/-/firstname and actor/id/-/lastname in GetMovieActors
        ResultSet actorResultSet = jdbcStatement.executeQuery("SELECT id, firstname, lastname, gender FROM Actor");
        while (actorResultSet.next()) {
            // actor/id/-/firstname
            Key firstnameKey = Key.createKey(Arrays.asList("actor", actorResultSet.getString(1)), Arrays.asList("firstname"));
            Value firstnameValue = Value.createValue(actorResultSet.getString(2).getBytes());
            store.put(firstnameKey, firstnameValue);

            // actor/id/-/lastname
            Key lastnameKey = Key.createKey(Arrays.asList("actor", actorResultSet.getString(1)), Arrays.asList("lastname"));
            Value lastnameValue= Value.createValue(actorResultSet.getString(3).getBytes());
            store.put(lastnameKey, lastnameValue);

            // actor/id/-/gender
            Key genderKey = Key.createKey(Arrays.asList("actor", actorResultSet.getString(1)), Arrays.asList("gender"));
            Value genderValue= Value.createValue(actorResultSet.getString(4).getBytes());
            store.put(genderKey, genderValue);

        }

        // read in Role
        String roleNum = "";
        ResultSet roleResultSet = jdbcStatement.executeQuery("SELECT actorID, movieID, role FROM Role");
        while (roleResultSet.next()) {
            // role/actorID/movieID/-/roleName
            // this supports GetMovieActorRoles, by storing the roleName as a minor key I am able to query for actors who
            // played more than one role in the same movie
            Key roleKey = Key.createKey(Arrays.asList("role", roleResultSet.getString(2), roleResultSet.getString(1)),
                                                        Arrays.asList(roleResultSet.getString(3)));
            Value roleValue = Value.createValue(roleResultSet.getString(3).getBytes());
            store.put(roleKey, roleValue);
        }

        movieResultSet.close();
        jdbcStatement.close();
        jdbcConnection.close();
        store.close();
    }

}
