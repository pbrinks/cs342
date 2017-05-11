import java.util.Arrays;
import java.util.Map;

import oracle.kv.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * This program used JDBC to query all the movies from the IMDB Movies table.
 * Include ojdbc6.jar (from the J2EE library) in the system path to support the JDBC functions.
 *
 * @author kvlinden
 * @version Spring, 2015
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

//            String nameResult = new String(store.get(nameKey).getValue().getValue());
//            String yearResult = new String(store.get(yearKey).getValue().getValue());
//            String rankResult = new String(store.get(rankKey).getValue().getValue());
//
//            System.out.println(nameKey.toString() + " : " + nameResult);
//            System.out.println(yearKey.toString() + " : " + yearResult);
//            System.out.println(rankKey.toString() + " : " + rankResult);

        }

        // read in Actor
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

//            String firstnameResult = new String(store.get(firstnameKey).getValue().getValue());
//            String lastnameResult = new String(store.get(lastnameKey).getValue().getValue());
//            String genderResult = new String(store.get(genderKey).getValue().getValue());
//
//            System.out.println(firstnameKey.toString() + " : " + firstnameResult);
//            System.out.println(lastnameKey.toString() + " : " + lastnameResult);
//            System.out.println(genderKey.toString() + " : " + genderResult);

        }

        // read in Role
        ResultSet roleResultSet = jdbcStatement.executeQuery("SELECT actorID, movieID, role FROM Role");
        while (roleResultSet.next()) {
            // role/actorID/movieID/-/role
            Key roleKey = Key.createKey(Arrays.asList("role", roleResultSet.getString(1), roleResultSet.getString(2)), Arrays.asList("role"));
            Value roleValue = Value.createValue(roleResultSet.getString(3).getBytes());
            store.put(roleKey, roleValue);

//            String roleResult = new String(store.get(roleKey).getValue().getValue());
//            System.out.println(roleKey.toString() + " : " + roleResult);

        }

        movieResultSet.close();
        jdbcStatement.close();
        jdbcConnection.close();
        store.close();
    }



}
