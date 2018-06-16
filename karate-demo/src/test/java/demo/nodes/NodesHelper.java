package demo.nodes;

import demo.nodes.models.Pokemon;
import io.aexp.nodes.graphql.*;


public class NodesHelper {

    public static String build(String pokemon) throws Exception {
        GraphQLRequestEntity gqlRequest = GraphQLRequestEntity.Builder()
                .request(Pokemon.class)
                .url("http://graphql.example.com/graphql")
                .arguments(new Arguments("pokemon",
                        new Argument<>("name", pokemon)))
                .build();

        return gqlRequest.getRequest();
    }

}
