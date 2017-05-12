/**
 * Created by plb7 on 5/12/2017.
 *
 * Class defines a Participant
 *      is used to sort Participants
 */
public class Participants {
    private String myID;
    private String myFirstName;
    private String myLastName;
    private String myGrade;

    // accessors
    public String getID() { return myID; }
    public void setID(String id) { myID = id; }

    public String getFirstName() { return myFirstName; }
    public void setFirstName(String fname) { myFirstName = fname; }

    public String getLastName() { return myLastName; }
    public void setLastName(String lname) { myLastName = lname; }

    public String getGrade() { return myGrade; }
    public void setGrade(String grade) { myGrade = grade; }
}
