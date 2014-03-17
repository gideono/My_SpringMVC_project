package se.visma.bbs.components;

import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;


/**
 * Created by gideon on 2014-02-18.
 */
public class JsonToPojo {

    public UICollection convert(String json){
        /*String jsonStr = "{\"uiTemplates\":[{\"uniqueId\":230,\"label\":\"name\",\"labelWidth\":100,\"textStyle\":\"bold\",\"type\":\"text\",\"textSize\":12,\"viewToCall\":\"text-configuration-menu\"}," +
                "{\"uniqueId\":428,\"label\":\"name\",\"labelWidth\":100,\"textStyle\":\"bold\",\"textSize\":12,\"type\":\"link\",\"url\":\"http://\",\"viewToCall\":\"link-configuration-menu\"}]}";*/

        String jsonStr = "{\"uiTemplates\": " + json +"}";
        ObjectMapper mapper = new ObjectMapper();
        UICollection uiTemplate = null;
        try {
            uiTemplate = mapper.readValue(jsonStr, UICollection.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return uiTemplate;
    }

}
