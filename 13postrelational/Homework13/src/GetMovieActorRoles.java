import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Iterator;
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

        Key roleMajorKeyPathOnly = Key.createKey(Arrays.asList("role", movieID, actorID));

        // return all roles played by actor 429719 in movie 92616
        Map<Key, ValueVersion> fields = store.multiGet(roleMajorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String fieldValue = new String(field.getValue().getValue().getValue());
            System.out.println(fieldValue);
        }

        store.close();
    }

}
