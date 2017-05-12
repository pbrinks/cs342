package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by plb7 on 5/12/2017.
 */
@Entity
public class Semestercode {
    private String semester;

    @Id
    @Column(name = "SEMESTER")
    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Semestercode that = (Semestercode) o;

        if (semester != null ? !semester.equals(that.semester) : that.semester != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return semester != null ? semester.hashCode() : 0;
    }
}
