package models;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by plb7 on 5/12/2017.
 */
public class ReviewPK implements Serializable {
    private long participantid;
    private long programid;

    @Column(name = "PARTICIPANTID")
    @Id
    public long getParticipantid() {
        return participantid;
    }

    public void setParticipantid(long participantid) {
        this.participantid = participantid;
    }

    @Column(name = "PROGRAMID")
    @Id
    public long getProgramid() {
        return programid;
    }

    public void setProgramid(long programid) {
        this.programid = programid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ReviewPK reviewPK = (ReviewPK) o;

        if (participantid != reviewPK.participantid) return false;
        if (programid != reviewPK.programid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (participantid ^ (participantid >>> 32));
        result = 31 * result + (int) (programid ^ (programid >>> 32));
        return result;
    }
}
