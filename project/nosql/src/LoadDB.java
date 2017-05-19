
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
 * Usefulness of queries and appropriateness of noSQL is described in their respective classes
 *
 * A key-value noSQL system is not the best for joins. It worked alright for my getProgramParticipants, because I set up my
 *  keys so that I could iterate through all review/movieIDs with the correct id and get all participants in that program
 *  however, if I wanted to get the program a participant was in, I would not be able to; there is only a one way relationship.
 *  Also, there is not really a way to sort using that key/value structure, so I had to make a new key/value structure to sort, even though it
 *  essentially the same information.
 *
 * Keys/Value structures:
 *      program/$id/-/dept : $dept
 *      program/$id/-/coursenum : $coursenum
 *      program/$id/-/country : $country
 *
 *      participant/$id/-/firstname : $firstname    - used for GetProgramParticipants
 *      participant/$id/-/lastname : $lastname      - used for GetProgramParticipants
 *
 *      participant/-/$lastname/$firstname/$id : NO_VALUE    - used to sort all participants by lastName, firstName (in GetSortedParticipants)
 *
 *      review/$programID/$participantID/-/rating : $rating  - used to get all participants in a certain Program (in GetProgramParticipants)
 *
 *
 * @author Paige Brinks, plb7
 * @version May 2017
 */
public class LoadDB {

    public static void main(String[] args) throws SQLException {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));
        Connection jdbcConnection = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "sadb", "bjarne");
        Statement jdbcStatement = jdbcConnection.createStatement();

        // read in Programs
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

        // read in Participants
        ResultSet participantResultSet = jdbcStatement.executeQuery("SELECT id, firstname, lastname FROM Participant");
        while (participantResultSet.next()) {
            // participant/$id/-/firstname : $firstname     - used for GetProgramPartcipants
            Key fnameKey = Key.createKey(Arrays.asList("participant", participantResultSet.getString(1)), Arrays.asList("firstname"));
            Value fnameValue = Value.createValue(participantResultSet.getString(2).getBytes());
            store.put(fnameKey, fnameValue);
            // participant/$id/-/lastname : $lastname   - used for GetProgramPartcipants
            Key lnameKey = Key.createKey(Arrays.asList("participant", participantResultSet.getString(1)), Arrays.asList("lastname"));
            Value lnameValue = Value.createValue(participantResultSet.getString(3).getBytes());
            store.put(lnameKey, lnameValue);

            // participant/-/$lastname/$firstname/$id : NO_VALUE  - used for sorting
            Key partKey = Key.createKey(Arrays.asList("participant"),
                    Arrays.asList(participantResultSet.getString(3), participantResultSet.getString(2), participantResultSet.getString(1)));
            Value partValue = Value.createValue(new byte[0]);
            store.put(partKey, partValue);
        }

        // read in Reviews
        ResultSet reviewResultSet = jdbcStatement.executeQuery("SELECT programID, participantID, rating FROM Review");
        while (reviewResultSet.next()) {
            // review/programID/participantID/-/rating
            Key ratingKey = Key.createKey(Arrays.asList("review", reviewResultSet.getString(1), reviewResultSet.getString(2)),
                                            Arrays.asList("rating"));
            if (reviewResultSet.getString(3) != null) {
                Value ratingValue = Value.createValue(reviewResultSet.getString(3).getBytes());
                store.put(ratingKey, ratingValue);
            } else {
                Value ratingValue = Value.createValue(new byte[0]);
                store.put(ratingKey, ratingValue);
            }

            String result = new String(store.get(ratingKey).getValue().getValue());
            System.out.println(ratingKey.toString() + " : " + result);
        }

        reviewResultSet.close();
        participantResultSet.close();
        programResultSet.close();
        jdbcStatement.close();
        jdbcConnection.close();
        store.close();
    }
}
