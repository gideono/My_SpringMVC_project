package se.visma.bbs.components;


import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Otto
 * Date: 2014-03-11
 * Time: 10:25
 * To change this template use File | Settings | File Templates.
 */
@XmlRootElement(name = "linkbutton")
@JsonIgnoreProperties(ignoreUnknown = true)
public class LinkButton extends UITemplate {
    private long uniqueId = 0;
    private String label = null;
    private List<Languages> labelLanguage = new ArrayList<Languages>();
    private String toolTips = null;
    private String type = null;
    private String url = null;
    private String viewToCall = null;


    public LinkButton() {
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

    public List<Languages> getLabelLanguage() {
        return labelLanguage;
    }

    @XmlElement
    public void setLabelLanguage(List<Languages> labelLanguage) {
        this.labelLanguage = labelLanguage;
    }

    public String getToolTips() {
        return toolTips;
    }

    @XmlElement
    public void setToolTips(String toolTips) {
        this.toolTips = toolTips;
    }

    public String getType() {
        return type;
    }

    @XmlElement
    public void setType(String type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    @XmlElement
    public void setUrl(String url) {
        this.url = url;
    }

    public String getViewToCall() {
        return viewToCall;
    }

    @XmlElement
    public void setViewToCall(String viewToCall) {
        this.viewToCall = viewToCall;
    }

    @Override
    public String toString() {
        return "LinkButton{" +
                "uniqueId=" + uniqueId +
                ", label='" + label + '\'' +
                ", labelLanguage=" + labelLanguage +
                ", toolTips='" + toolTips + '\'' +
                ", type='" + type + '\'' +
                ", url='" + url + '\'' +
                ", viewToCall='" + viewToCall + '\'' +
                '}';
    }
}
