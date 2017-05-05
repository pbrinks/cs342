import java.util.Arrays;
import java.util.Map;

import oracle.kv.*;

public class HelloRecords {

    public static void main(String[] args) {

        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        // create
        String movieString = "Dr. Strangelove";
        Key nameKey = Key.createKey(Arrays.asList("movie", "92616"), Arrays.asList("name"));
        Value nameValue = Value.createValue(movieString.getBytes());
        store.put(nameKey, nameValue);

        String yearString = "1964";
        Key yearKey = Key.createKey(Arrays.asList("movie", "92616"), Arrays.asList("year"));
        Value yearValue = Value.createValue(yearString.getBytes());
        store.put(yearKey, yearValue);

        String ratingString = "8.7";
        Key ratingKey = Key.createKey(Arrays.asList("movie", "92616"), Arrays.asList("rating"));
        Value ratingValue = Value.createValue(ratingString.getBytes());
        store.put(ratingKey, ratingValue);


//        String nameResult = new String(store.get(nameKey).getValue().getValue());
//        String yearResult = new String(store.get(yearKey).getValue().getValue());
//        String ratingResult = new String(store.get(ratingKey).getValue().getValue());
//        System.out.println(nameKey.toString() + " : " + nameResult);
//        System.out.println(yearKey.toString() + " : " + yearResult);
//        System.out.println(ratingKey.toString() + " : " + ratingResult);


        Key majorKeyPathOnly = Key.createKey(Arrays.asList("movie", "92616"));
        Map<Key, ValueVersion> fields = store.multiGet(majorKeyPathOnly, null, null);
        for (Map.Entry<Key, ValueVersion> field : fields.entrySet()) {
            String fieldName = field.getKey().getMinorPath().get(0);
            String fieldValue = new String(field.getValue().getValue().getValue());
            System.out.println(majorKeyPathOnly.toString() + "/-/" + fieldName + "\t: " + fieldValue);
        }

        store.close();
    }

}
