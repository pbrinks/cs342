package models;

import javax.persistence.*;

/**
 * Created by plb7 on 5/12/2017.
 */
@Entity
@IdClass(ReviewPK.class)
public class Review {
    private long participantid;
    private long programid;
    private String text;
    private Long rating;

    @Id
    @Column(name = "PARTICIPANTID")
    public long getParticipantid() {
        return participantid;
    }

    public void setParticipantid(long participantid) {
        this.participantid = participantid;
    }

    @Id
    @Column(name = "PROGRAMID")
    public long getProgramid() {
        return programid;
    }

    public void setProgramid(long programid) {
        this.programid = programid;
    }

    @Basic
    @Column(name = "TEXT")
    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Basic
    @Column(name = "RATING")
    public Long getRating() {
        return rating;
    }

    public void setRating(Long rating) {
        this.rating = rating;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Review review = (Review) o;

        if (participantid != review.participantid) return false;
        if (programid != review.programid) return false;
        if (text != null ? !text.equals(review.text) : review.text != null) return false;
        if (rating != null ? !rating.equals(review.rating) : review.rating != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (participantid ^ (participantid >>> 32));
        result = 31 * result + (int) (programid ^ (programid >>> 32));
        result = 31 * result + (text != null ? text.hashCode() : 0);
        result = 31 * result + (rating != null ? rating.hashCode() : 0);
        return result;
    }
}
