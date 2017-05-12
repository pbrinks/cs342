import oracle.kv.*;

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

        ArrayList<Participants> parts = new ArrayList<Participants>();
        Key key = Key.createKey(Arrays.asList("participant"));

        // iterate through all participants and store them in an ArrayList of Participants, so that I can sort them
        Iterator<KeyValueVersion> iterator = store.storeIterator(Direction.UNORDERED, 0, key, null, null);
        while (iterator.hasNext()) {
            Key tempKey1 = iterator.next().getKey();
            String id = new String(tempKey1.getMajorPath().get(1));
            String fname = new String(store.get(tempKey1).getValue().getValue());
            Key tempKey2 = iterator.next().getKey();
            String grade = new String(store.get(tempKey2).getValue().getValue());
            Key tempKey3 = iterator.next().getKey();
            String lname = new String(store.get(tempKey3).getValue().getValue());

            // add current participant to parts
            Participants p = new Participants();
            p.setID(id);
            p.setFirstName(fname);
            p.setLastName(lname);
            p.setGrade(grade);
            parts.add(p);

            System.out.println(p.getID() + " " + p.getFirstName() + " " + p.getLastName() + " " + p.getGrade());
        }

        // sort Participants alphabetically, by last name
        Collections.sort(parts, new Comparator<Participants>() {
            @Override
            public int compare(Participants p1, Participants p2) {
                return p1.getLastName().compareTo(p2.getLastName());
            }
        });

        // return results
        for (int i = 0; i < parts.size(); i++) {
            System.out.println(parts.get(i).getFirstName() + " " + parts.get(i).getLastName());
        }

        store.close();
    }
}
