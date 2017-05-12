package models;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.sql.Time;

/**
 * Created by plb7 on 5/12/2017.
 */
public class TripattractionPK implements Serializable {
    private long tripid;
    private long attractionid;
    private Time visitDate;

    @Column(name = "TRIPID")
    @Id
    public long getTripid() {
        return tripid;
    }

    public void setTripid(long tripid) {
        this.tripid = tripid;
    }

    @Column(name = "ATTRACTIONID")
    @Id
    public long getAttractionid() {
        return attractionid;
    }

    public void setAttractionid(long attractionid) {
        this.attractionid = attractionid;
    }

    @Column(name = "VISIT_DATE")
    @Id
    public Time getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(Time visitDate) {
        this.visitDate = visitDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TripattractionPK that = (TripattractionPK) o;

        if (tripid != that.tripid) return false;
        if (attractionid != that.attractionid) return false;
        if (visitDate != null ? !visitDate.equals(that.visitDate) : that.visitDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (tripid ^ (tripid >>> 32));
        result = 31 * result + (int) (attractionid ^ (attractionid >>> 32));
        result = 31 * result + (visitDate != null ? visitDate.hashCode() : 0);
        return result;
    }
}
