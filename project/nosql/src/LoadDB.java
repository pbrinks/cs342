
import oracle.kv.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

/**
 * LoadDB loads data from the sadb SQL relational database and converts it into the KVLite store
 *
 * Usefulness of queries and how appropriateness of noSQL is described in their respective classes
 *
 * A key-value noSQL system is not the best for joins. It worked alright for my getProgramParticipants, because I set up my
 *  keys so that I could iterate through all review/movieIDs with the correct id and get all participants in that program
 *  however, if I wanted to get the program a participant was in, I would not be able to; there is only a one way relationship.
 *  Also, there is not a great way to sort using KVLite's key-value system, and therefore I had to make another Participant class
 *  in order to store all participants in an ArrayList and then sort the ArrayList.
 *
 * @author Paige Brinks, plb7
 * @version 5/12/2017
 */
public class LoadDB {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        Connection jdbcConnection = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "sadb", "bjarne");
        Statement jdbcStatement = jdbcConnection.createStatement();

        // read in program
        ResultSet programResultSet = jdbcStatement.executeQuery("SELECT id, dept, courseNumber, country FROM Program");
        while (programResultSet.next()) {
            // program/id/-/dept
            Key deptKey = Key.createKey(Arrays.asList("program", programResultSet.getString(1)), Arrays.asList("dept"));
            Value deptValue = Value.createValue(programResultSet.getString(2).getBytes());
            store.put(deptKey, deptValue);
            // program/id/-/coursenum
            Key courseNumKey = Key.createKey(Arrays.asList("program", programResultSet.getString(1)), Arrays.asList("coursenum"));
            Value courseNumValue = Value.createValue(programResultSet.getString(3).getBytes());
            store.put(courseNumKey, courseNumValue);
            // program/id/-/country
            Key countryKey = Key.createKey(Arrays.asList("program", programResultSet.getString(1)), Arrays.asList("country"));
            Value countryValue = Value.createValue(programResultSet.getString(4).getBytes());
            store.put(countryKey, countryValue);
        }

        ResultSet participantResultSet = jdbcStatement.executeQuery("SELECT id, firstname, lastname, grade FROM Participant");
        while (participantResultSet.next()) {
            // participant/id/-/firstname
            Key fnameKey = Key.createKey(Arrays.asList("participant", participantResultSet.getString(1)), Arrays.asList("firstname"));
            Value fnameValue = Value.createValue(participantResultSet.getString(2).getBytes());
            store.put(fnameKey, fnameValue);
            // participant/id/-/lastname
            Key lnameKey = Key.createKey(Arrays.asList("participant", participantResultSet.getString(1)), Arrays.asList("lastname"));
            Value lnameValue = Value.createValue(participantResultSet.getString(3).getBytes());
            store.put(lnameKey, lnameValue);
            // participant/id/-/grade
            Key gradeKey = Key.createKey(Arrays.asList("participant", participantResultSet.getString(1)), Arrays.asList("grade"));
            Value gradeValue = Value.createValue(participantResultSet.getString(4).getBytes());
            store.put(gradeKey, gradeValue);
        }

        ResultSet reviewResultSet = jdbcStatement.executeQuery("SELECT programID, participantID, rating FROM Review");
        while (reviewResultSet.next()) {
            // review/programID/participantID/-/rating
            Key ratingKey = Key.createKey(Arrays.asList("review", reviewResultSet.getString(1), reviewResultSet.getString(2)),
                                            Arrays.asList("rating"));
            if (reviewResultSet.getString(3) != null) {
                Value ratingValue = Value.createValue(reviewResultSet.getString(3).getBytes());
                store.put(ratingKey, ratingValue);
            } else {
                Value ratingValue = Value.createValue("null".getBytes());
                store.put(ratingKey, ratingValue);
            }
        }

        reviewResultSet.close();
        participantResultSet.close();
        programResultSet.close();
        jdbcStatement.close();
        jdbcConnection.close();
        store.close();
    }
}
