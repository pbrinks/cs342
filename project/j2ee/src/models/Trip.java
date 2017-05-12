package models;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by plb7 on 5/12/2017.
 */
@Entity
public class Trip {
    private long id;
    private String location;
    private String timelength;
    private Double totalcost;
    private String description;

    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "LOCATION")
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "TIMELENGTH")
    public String getTimelength() {
        return timelength;
    }

    public void setTimelength(String timelength) {
        this.timelength = timelength;
    }

    @Basic
    @Column(name = "TOTALCOST")
    public Double getTotalcost() {
        return totalcost;
    }

    public void setTotalcost(Double totalcost) {
        this.totalcost = totalcost;
    }

    @Basic
    @Column(name = "DESCRIPTION")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Trip trip = (Trip) o;

        if (id != trip.id) return false;
        if (location != null ? !location.equals(trip.location) : trip.location != null) return false;
        if (timelength != null ? !timelength.equals(trip.timelength) : trip.timelength != null) return false;
        if (totalcost != null ? !totalcost.equals(trip.totalcost) : trip.totalcost != null) return false;
        if (description != null ? !description.equals(trip.description) : trip.description != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + (timelength != null ? timelength.hashCode() : 0);
        result = 31 * result + (totalcost != null ? totalcost.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        return result;
    }
}
