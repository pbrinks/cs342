import oracle.kv.*;

import java.sql.SQLException;
import java.util.*;

/**
 * Created by plb7 on 5/11/2017.
 */
public class GetSortedMovies {
    public static void main(String[] args) throws SQLException {
        GetSortedMovies gsm = new GetSortedMovies();
        gsm.run();
    }

    public void run() {
        KVStore store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost:5000"));

        ArrayList<Movie> movies = new ArrayList<Movie>();
        Key key = Key.createKey(Arrays.asList("movie"));

        // iterate through all movies and store them in ArrayList movies, so that I can sort them later
        Iterator<KeyValueVersion> iterator = store.storeIterator(Direction.UNORDERED, 0, key, null, null);
        while (iterator.hasNext()) {
            Key tempKey1 = iterator.next().getKey();
            String id = new String(tempKey1.getMajorPath().get(1));
            String name = new String(store.get(tempKey1).getValue().getValue());
            Key tempKey2 = iterator.next().getKey();
            String rank = new String(store.get(tempKey2).getValue().getValue());
            Key tempKey3 = iterator.next().getKey();
            String year = new String(store.get(tempKey3).getValue().getValue());

            Movie m = new Movie();
            m.setID(id);
            m.setName(name);
            m.setRank(rank);
            m.setYear(year);
            movies.add(m);
        }

        // sort Movies by comparing the years
        Collections.sort(movies, new Comparator<Movie>() {
            @Override
            public int compare(Movie m1, Movie m2) {
                return m1.getYear().compareTo(m2.getYear());
            }
        });

        // return results
        for(int i = 0; i < movies.size(); i++) {
            System.out.println(movies.get(i).getYear() + '\t' + movies.get(i).getID() + '\t' + movies.get(i).getName());
        }

        store.close();
    }
}
