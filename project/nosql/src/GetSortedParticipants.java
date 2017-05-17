import oracle.kv.*;
import oracle.kv.impl.fault.SystemFaultException;

import java.sql.SQLException;
import java.util.*;

/**
 * Created by plb7 on 5/12/2017.
 *
 * GetSortedParticpants gets all Participants and sorts them in alphabetical order
 * This is useful because off-campus programs can have a list of all students taking place in
 * a semester abroad (this would be useful for contacting students with any info they need before they go abroad,
 *  or when they are abroad, etc.)
 *
 *  noSQL is not very appropriate for sorting, and therefore I needed to make a Participant class in order
 *  to achieve it. Teh way key-value pairs are set up, it does not make it as easy to associate different attributes of the
 *  Participant with eachother, as a SQL database would
 */
public class GetSortedParticipants {
    public static void main(String[] args) throws SQLException {
        GetSortedParticipants sp = new GetSortedParticipants();
        sp.run();
    }

    public void run() {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        Key key = Key.createKey("participant");
        KeyRange subRange = null;
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
