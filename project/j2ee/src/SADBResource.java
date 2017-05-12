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
 * This stateless session bean serves as a RESTful resource handler for the CPDB.
 * It uses a container-managed entity manager.
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
     * GET an individual person record.
     *
     * @param id the ID of the person to retrieve
     * @return a person record
     */
    @GET
    @Path("/program/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Program getPerson(@PathParam("id") Long id) {
        return em.find(Program.class, id);
    }


    /**
     * GET all people using the criteria query API.
     * This could be refactored to use a JPQL query, but this entitymanager-based approach
     * is consistent with the other handlers.
     *
     * @return a list of all person records
     */
    @GET
    @Path("/programs")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Program> getPeople() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Program.class)).getResultList();
    }

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