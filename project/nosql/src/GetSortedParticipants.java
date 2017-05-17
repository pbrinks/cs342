import oracle.kv.*;
import oracle.kv.impl.fault.SystemFaultException;

import java.sql.SQLException;
import java.util.*;

/**
 * Created by plb7 on 5/12/2017.
 *
 * This is useful because off-campus programs can have a list of all students taking place in
 * a semester abroad (this would be useful for contacting students with any info they need before they go abroad,
 *  or when they are abroad, etc.)
 *
 * noSQL is not great for sorting, I had to specifically design my key structure so that my results would be sorted.
 * my key is participant/-/$lastname/$firstname/$id. Normally I would have made two seperate keys to retrieve the
 * first and last name (participant/$id/-/firstname : $firstname and participant/$id/-/lastname : $lastname).
 * which I did to use for GetProramParticipants. but in order to sort the participants by their names I
 * needed to have $lastname and $firstname in the minor key
 *
 * @author Paige Brinks, plb7
 * @version May 2017
 */
public class GetSortedParticipants {
    public static void main(String[] args) throws SQLException {
        GetSortedParticipants sp = new GetSortedParticipants();
        sp.run();
    }

    public void run() {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        // get all keys with major path "participant"
        Key key = Key.createKey("participant");
        KeyRange subRange = null;
        // iterate through all Participants and print them in order of last name
        Iterator<Key> iterator = store.multiGetKeysIterator(Direction.FORWARD, 0, key, subRange, null);
        while (iterator.hasNext()) {
            Key temp = iterator.next();
            String fname = temp.getMinorPath().get(1);
            String lname = temp.getMinorPath().get(0);
            System.out.println(fname + " " + lname);
        }

        store.close();
    }
}
