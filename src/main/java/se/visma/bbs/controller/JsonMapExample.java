package se.visma.bbs.controller;

/**
 * Created by gideonoduro on 2014-03-24.
 */
import java.util.HashMap;
import java.util.Map;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

public class JsonMapExample {
    public static void main(String[] args) {

        String json = "{\"name\":\"mkyong\", \"age\":\"29\"}";
        String json2 = "{\"197\":\"false\", \"829\":\"false\", \"971\":\"false\"}";

        Map<String,String> map = new HashMap<String,String>();
        ObjectMapper mapper = new ObjectMapper();

        try {

            //convert JSON string to Map
            map = mapper.readValue(json2,
                    new TypeReference<HashMap<String,String>>(){});

            System.out.println(map.get("197"));

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}