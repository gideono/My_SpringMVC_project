package se.visma.bbs.components;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by gideon on 2014-02-17.
 */

@XmlRootElement(name = "text")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Text extends UITemplate {

    private long uniqueId = 0;
    private String label = null;
    private int labelWidth = 0;
    private String textStyle = null;
    private String type = null;
    private int textSize = 0;
    private String viewToCall = null;
    private List<Languages> labelLanguage = new ArrayList<Languages>();

    public Text (){
        this.type = this.getClass().getSimpleName().toLowerCase();
    }


    public long getUniqueId() {
        return uniqueId;
    }

    @XmlElement
    public void setUniqueId(long uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getLabel() {
        return label;
    }

    @XmlElement
    public void setLabel(String label) {
        this.label = label;
    }

    public int getLabelWidth() {
        return labelWidth;
    }

    @XmlElement
    public void setLabelWidth(int labelWidth) {
        this.labelWidth = labelWidth;
    }

    public String getTextStyle() {
        return textStyle;
    }

    @XmlElement
    public void setTextStyle(String textStyle) {
        this.textStyle = textStyle;
    }

    public String getType() {
        return type;
    }

    @XmlElement
    public void setType(String type) {
        this.type = type;
    }

    public int getTextSize() {
        return textSize;
    }

    @XmlElement
    public void setTextSize(int textSize) {
        this.textSize = textSize;
    }

    public String getViewToCall() {
        return viewToCall;
    }

    @XmlElement
    public void setViewToCall(String viewToCall) {
        this.viewToCall = viewToCall;
    }

    public List<Languages> getLabelLanguage() {
        return labelLanguage;
    }

    @XmlElement
    public void setLabelLanguage(List<Languages> labelLanguage) {
        this.labelLanguage = labelLanguage;
    }

    @Override
    public String toString() {
        return "Text{" +
                "uniqueId=" + uniqueId +
                ", label='" + label + '\'' +
                ", labelWidth=" + labelWidth +
                ", textStyle='" + textStyle + '\'' +
                ", type='" + type + '\'' +
                ", textSize=" + textSize +
                ", viewToCall='" + viewToCall + '\'' +
                ", labelLanguage=" + labelLanguage +
                '}';
    }
}
