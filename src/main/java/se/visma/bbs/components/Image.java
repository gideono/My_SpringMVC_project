package se.visma.bbs.components;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Otto
 * Date: 2014-03-12
 * Time: 11:48
 * To change this template use File | Settings | File Templates.
 */
@XmlRootElement(name = "image")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Image extends UITemplate{
    private long uniqueId = 0;
    private String label = null;
    private List<Languages> labelLanguage = new ArrayList<Languages>();
    private String toolTips = null;
    private String type = null;
    private String url = null;
    private int componentHeight = 0;
    private int componentWidth = 0;
    private String imageResize = null;
    private String viewToCall = null;

    public Image(){
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

    public int getComponentHeight() {
        return componentHeight;
    }

    @XmlElement
    public void setComponentHeight(int componentHeight) {
        this.componentHeight = componentHeight;
    }

    public int getComponentWidth() {
        return componentWidth;
    }

    @XmlElement
    public void setComponentWidth(int componentWidth) {
        this.componentWidth = componentWidth;
    }

    public String getImageResize() {
        return imageResize;
    }

    @XmlElement
    public void setImageResize(String imageResize) {
        this.imageResize = imageResize;
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
        return "Image{" +
                "uniqueId=" + uniqueId +
                ", label='" + label + '\'' +
                ", labelLanguage=" + labelLanguage +
                ", toolTips='" + toolTips + '\'' +
                ", type='" + type + '\'' +
                ", url='" + url + '\'' +
                ", componentHeight=" + componentHeight +
                ", componentWidth=" + componentWidth +
                ", imageResize='" + imageResize + '\'' +
                ", viewToCall='" + viewToCall + '\'' +
                '}';
    }
}

