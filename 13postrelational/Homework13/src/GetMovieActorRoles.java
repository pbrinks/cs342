import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by plb7 on 5/10/2017.
 */
public class GetMovieActorRoles {

    public static void main(String[] args) throws SQLException {
        GetMovieActorRoles mar = new GetMovieActorRoles();
        mar.run();
    }

    public void run() {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        String actorID = "429719";
        String movieID = "92616";

        Key roleMajorKeyPathOnly = Key.createKey(Arrays.asList("role", actorID, movieID));
//        Key actorMajorKeyPathOnly = Key.createKey(Arrays.asList("actor", actorID));
//        Key movieMajorKeyPathOnly = Key.createKey(Arrays.asList("movie", movieID));


        Map<Key, ValueVersion> fields = store.multiGet(roleMajorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String fieldValue = new String(field.getValue().getValue().getValue());
            System.out.println(fieldValue);


        }


        store.close();
    }

}
