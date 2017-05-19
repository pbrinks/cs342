import oracle.kv.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/**
 * Created by plb7 on 5/12/2017.
 *
 * GetProgramParticipants queries for and returns all participants enrolled in Program 1
 *  (this could work for any Program, as long as the correct programID is given)
 *  this query is useful because it works as the class list for a Program - the registrar or professor can see
 *  who is enrolled in what program
 *
 *  noSQL is appropriate for this query because the Iterator makes it very easy to iterate through each record with a major
 *  key beginning with review/programID and find the Participants of that program
 *
 * @author Paige Brinks, plb7
 * @version May 2017
 */
public class GetProgramParticipants {
    public static void main(String[] args) throws SQLException {
        GetProgramParticipants pp = new GetProgramParticipants();
        pp.run();
    }

    public void run() {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        // get participants from programId 1
        String programID = "1";
        // create key to iterate through
        Key key = Key.createKey(Arrays.asList("review", programID));
        // store participant Ids
        ArrayList<String> partIDs = new ArrayList<String>();
        Iterator<KeyValueVersion> iterator = store.storeIterator(Direction.UNORDERED, 0, key, null, null);
        while (iterator.hasNext()) {
            Key tempKey = iterator.next().getKey();
            String pid = tempKey.getMajorPath().get(2);
            partIDs.add(pid);
        }

        // print out participant names
        System.out.println("Participants in program " + programID);
        for (int i = 0; i < partIDs.size(); i++) {
            Key firstnameKey = Key.createKey(Arrays.asList("participant", partIDs.get(i)), Arrays.asList("firstname"));
            Key lastnameKey = Key.createKey(Arrays.asList("participant", partIDs.get(i)), Arrays.asList("lastname"));
            String firstnameResult = new String(store.get(firstnameKey).getValue().getValue());
            String lastnameResult = new String(store.get(lastnameKey).getValue().getValue());

            System.out.println(partIDs.get(i) + '\t' + firstnameResult + " " + lastnameResult);
        }

        store.close();
    }
}