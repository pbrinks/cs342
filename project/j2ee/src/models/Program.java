package models;

import javax.persistence.*;
import java.util.List;

/**
 * Created by plb7 on 5/12/2017.
 */
@Entity
public class Program {
    private long id;
    private Long coursenumber;
    private String semester;
    private String country;
    private String city;
    private Double cost;
    private String description;
    private Long capacity;
    private Professor professor;
    private Department dept;
    private List<Participant> reviews;   // reviews include program participants

    @GeneratedValue(generator = "sadbSequence")
    @SequenceGenerator(name = "sadbSequence", sequenceName = "programSequence", allocationSize = 1)
    @Id
    @Column(name = "ID")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "COURSENUMBER")
    public Long getCoursenumber() {
        return coursenumber;
    }

    public void setCoursenumber(Long coursenumber) {
        this.coursenumber = coursenumber;
    }

    @Basic
    @Column(name = "SEMESTER")
    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    @Basic
    @Column(name = "COUNTRY")
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Basic
    @Column(name = "CITY")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "COST")
    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    @Basic
    @Column(name = "DESCRIPTION")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "CAPACITY")
    public Long getCapacity() {
        return capacity;
    }

    public void setCapacity(Long capacity) {
        this.capacity = capacity;
    }

    @ManyToOne
    @JoinColumn(name = "PROFESSORID", referencedColumnName = "ID")
    public Professor getProfessor() { return professor; }
    public void setProfessor(Professor pID) { this.professor = pID; }

    @ManyToOne
    @JoinColumn(name = "DEPT", referencedColumnName = "CODE")
    public Department getDept() { return dept; }
    public void setDept(Department d) { dept = d; }

    @ManyToMany
    @JoinTable(name = "REVIEW", schema = "SADB",
                joinColumns = @JoinColumn(name = "PROGRAMID", referencedColumnName = "ID", nullable = false),
                inverseJoinColumns = @JoinColumn(name = "PARTICIPANTID", referencedColumnName = "ID", nullable = false))
    public List<Participant> getReviews() { return reviews; }
    public void setReviews(List<Participant> r) { this.reviews = r; }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Program program = (Program) o;

        if (id != program.id) return false;
        if (coursenumber != null ? !coursenumber.equals(program.coursenumber) : program.coursenumber != null)
            return false;
        if (semester != null ? !semester.equals(program.semester) : program.semester != null) return false;
        if (country != null ? !country.equals(program.country) : program.country != null) return false;
        if (city != null ? !city.equals(program.city) : program.city != null) return false;
        if (cost != null ? !cost.equals(program.cost) : program.cost != null) return false;
        if (description != null ? !description.equals(program.description) : program.description != null) return false;
        if (capacity != null ? !capacity.equals(program.capacity) : program.capacity != null) return false;
        if (professor != null ? !professor.equals(program.professor) : program.professor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (coursenumber != null ? coursenumber.hashCode() : 0);
        result = 31 * result + (semester != null ? semester.hashCode() : 0);
        result = 31 * result + (country != null ? country.hashCode() : 0);
        result = 31 * result + (city != null ? city.hashCode() : 0);
        result = 31 * result + (cost != null ? cost.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (capacity != null ? capacity.hashCode() : 0);
        result = 31 * result + (professor != null ? professor.hashCode() : 0);
        return result;
    }
}
