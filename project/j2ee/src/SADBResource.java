import models.Professor;
import models.Program;
import models.Review;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.print.attribute.standard.Media;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

/**
 * This stateless session bean serves as a RESTful resource handler for the SADB.
 * It uses a container-managed entity manager.
 *
 * SADBResource allows you to create a new program, get/read a program, update an existing program, and delete a program
 * this would be useful for the registrar when keeping track on off-campus programs and if there have been any changes to
 * the programs offered (PUT and DELETE), if there has been a new program created (POST), or if they need to get information
 * about a certain program (GET).
 *
 * @author kvlinden
 * @version Spring, 2017
 */
@Stateless
@Path("/sadb")
public class SADBResource {

    /**
     * JPA creates and maintains a managed entity manager with an integrated JTA that we can inject here.
     *     E.g., http://wiki.eclipse.org/EclipseLink/Examples/REST/GettingStarted
     */
    @PersistenceContext
    private EntityManager em;

    /**
     * GET a default message.
     *
     * @return a static hello-world message
     */
    @GET
    @Path("/hello")
    @Produces("text/plain")
    public String getClichedMessage() {
        return "Hello, JPA!";
    }

    /**
     * GET an individual Program record.
     * useful for registrar/off-campus programs to look up info on a specific program
     *
     * @param id the ID of the Program to retrieve
     * @return an individual Program record
     */
    @GET
    @Path("/program/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Program getPerson(@PathParam("id") Long id) {
        return em.find(Program.class, id);
    }


    /**
     * GET all Progrmas using the criteria query API.
     * This would be useful to off-campus programs to be able to look up all current abroad programs
     * @return a list of all Program records
     */
    @GET
    @Path("/programs")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Program> getPeople() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Program.class)).getResultList();
    }

    /**
    * PUT updates a specific Program record
    * this is useful for the registrar/off-campus programs/the programs professor, in case
    * there has been a change to a specific program, they can update it
    */
    @PUT
    @Path("/program/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response putProgram(Program uProgram, @PathParam("id") Long id) {
        Program p = em.find(Program.class, id);
        if (p == null || id != uProgram.getId()) {
            return Response.serverError().entity("Invalid id!").build();
        }
        uProgram.setProfessor(em.find(Professor.class, uProgram.getProfessor().getId()));
        p = em.merge(uProgram);

        return Response.ok(em.find(Program.class, id), MediaType.APPLICATION_JSON).build();
    }

    /**
    * POST creates a new Program record
    * this is useful for the registrar to add a new program, if a professor decides to lead a new one
    */
    @POST
    @Path("/programs")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Program postProgram(Program newProgram) {
        Program p = new Program();
        newProgram.setId(p.getId());
        newProgram.setProfessor(em.find(Professor.class, newProgram.getProfessor().getId()));
        em.persist(newProgram);
        return newProgram;
    }

    /**
    * DELETE deletes a specific Program record
    * this is useful for the registrar/off-campus programs to remove a program, in the case it is no longer offered
    * (for example, if not enough students registered and the program is cancelled)
    */
    @DELETE
    @Path("/program/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public String deleteProgram(@PathParam("id") Long id) {
        Program p = em.find(Program.class, id);
        if(p == null) {
            return "Program does not exist!";
        }
        em.remove(p);
        return "Removed Program with id " + id;
    }


}
