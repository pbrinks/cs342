import oracle.kv.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by plb7 on 5/11/2017.
 */
public class GetMovieActors {
    public static void main(String[] args) throws SQLException {
        GetMovieActors ma = new GetMovieActors();
        ma.run();
    }

    public void run() {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        String movieID = "92616";
        // create Key to iterate through
        ArrayList<String> majorcompenents = new ArrayList<String>();
        majorcompenents.add("role");
        majorcompenents.add(movieID);
        Key key = Key.createKey(majorcompenents);
        // store actor names and roles to print out
        ArrayList<String> actorIDs = new ArrayList<String>();
        ArrayList<String> roles = new ArrayList<String>();
        Iterator<KeyValueVersion> iterator = store.storeIterator(Direction.UNORDERED, 0, key, null, null);
        while (iterator.hasNext()) {
            Key tempKey = iterator.next().getKey();
            String aID = tempKey.getMajorPath().get(2);
            actorIDs.add(aID);
            String r = tempKey.getMinorPath().get(0);
            roles.add(r);
        }

        // print out results
        for (int i = 0; i < actorIDs.size(); i++) {
            Key firstnameKey = Key.createKey(Arrays.asList("actor", actorIDs.get(i)), Arrays.asList("firstname"));
            Key lastnameKey = Key.createKey(Arrays.asList("actor", actorIDs.get(i)), Arrays.asList("lastname"));
            String firstnameResult = new String(store.get(firstnameKey).getValue().getValue());
            String lastnameResult = new String(store.get(lastnameKey).getValue().getValue());

            System.out.println(actorIDs.get(i) + '\t' + firstnameResult + " " + lastnameResult + '\t' + roles.get(i));
        }
    }
}
