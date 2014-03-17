package se.visma.bbs.model;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by gideon on 2014-02-03.
 */
@XmlRootElement(name = "element")
public class UiElement {

    private int uniqueId = 0;
    private String type = null;
    private String label = null;

    public int getUniqueId() {
        return uniqueId;
    }

    @XmlElement
    public void setUniqueId(int uniqueId) {
        this.uniqueId = uniqueId;
    }


    public String getType() {
        return type;
    }

    @XmlElement
    public void setType(String type) {
        this.type = type;
    }

    public String getLabel() {
        return label;
    }

    @XmlElement
    public void setLabel(String label) {
        this.label = label;
    }

    @Override
    public String toString() {
        return "UiElement{" +
                "uniqueId=" + uniqueId +
                ", type='" + type + '\'' +
                ", label='" + label + '\'' +
                '}';
    }
}
