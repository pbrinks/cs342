import oracle.kv.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by plb7 on 5/10/2017.
 */
public class GetTableValues {

    public static void main(String[] args) throws SQLException {
        GetTableValues gt = new GetTableValues();
        gt.run();
    }

    public void run() {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        // return all details about Movie 92616
        Key majorKeyPathOnly = Key.createKey(Arrays.asList("movie", "92616"));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String fieldValue = new String(field.getValue().getValue().getValue());
            System.out.println(fieldValue);
        }

        store.close();
    }
}
