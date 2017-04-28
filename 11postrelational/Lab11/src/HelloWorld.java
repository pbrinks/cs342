/**
 * Created by plb7 on 4/21/2017.
 */
import javax.ws.rs.*;
import javax.ws.rs.core.Response;

import static java.lang.System.exit;


// The Java class will be hosted at the URI path "/helloworld"
@Path("/hello")
public class HelloWorld {
    // The Java method will process HTTP GET requests
    @GET
    // The Java method will produce content identified by the MIME Media type "text/plain"
    @Produces("text/plain")
    public String getClichedMessage() {
        // Return some cliched textual content
        return "Hello World";
    }

    @Path("/api")
    @GET
    @Produces("text/plain")
    public String getMessage() {
        return "Getting...";
    }

    @Path("/api/{number}")
    @PUT
    @Produces("text/plain")
    @Consumes("text/plain")
    public String putInteger(@PathParam("number") Integer number ) {
        return "Putting: " + number;
    }


    @Path("/api/{message}")
    @POST
    @Produces("text/plain")
    public String postMessage(@PathParam("message") String message ) {
        return "Posting: " + message;
    }


    @Path("/api/{number}")
    @DELETE
    @Consumes("text/plain")
    public String deleteInteger(@PathParam("number") Integer number ) {
        if (number < 0 || number > 9) {
            return "Integer is not between 0 and 9!";
        }
        return "Deleting: " + number;
    }

}