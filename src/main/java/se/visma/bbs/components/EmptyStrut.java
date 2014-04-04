package se.visma.bbs.components;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by Otto on 2014-04-04.
 */
@XmlRootElement(name = "emptystrut")
@JsonIgnoreProperties(ignoreUnknown = true)
public class EmptyStrut extends UITemplate {

    private long uniqueId = 0;
    private String type = null;

    public EmptyStrut() {
        this.type = this.getClass().getSimpleName().toLowerCase();
    }

    public long getUniqueId() {
        return uniqueId;
    }

    @XmlElement
    public void setUniqueId(long uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getType() {
        return type;
    }

    @XmlElement
    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "EmptyStrut{" +
                "uniqueId=" + uniqueId +
                ", type='" + type + '\'' +
                '}';
    }
}
