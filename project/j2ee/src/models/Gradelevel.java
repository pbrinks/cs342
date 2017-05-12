package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by plb7 on 5/12/2017.
 */
@Entity
public class Gradelevel {
    private String grade;

    @Id
    @Column(name = "GRADE")
    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Gradelevel that = (Gradelevel) o;

        if (grade != null ? !grade.equals(that.grade) : that.grade != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return grade != null ? grade.hashCode() : 0;
    }
}
