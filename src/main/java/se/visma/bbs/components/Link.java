package se.visma.bbs.components;


import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by gideon on 2014-02-18.
 */
@XmlRootElement(name = "link")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Link extends UITemplate {


    private long uniqueId;
    private String label = null;
    private String tooltip = null;
    private int labelWidth;
    private String labelPosition = null;
    private String textStyle = null;
    private int textSize;
    private String textFormat = null;
    private int componentWidth;
    private String type = null;
    private String url = null;
    private String viewToCall = null;
    private List<Languages> labelLanguage = new ArrayList<Languages>();

    public Link (){
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

    public String getTooltip() {
        return tooltip;
    }

    @XmlElement
    public void setTooltip(String tooltip) {
        this.tooltip = tooltip;
    }

    public int getLabelWidth() {
        return labelWidth;
    }

    @XmlElement
    public void setLabelWidth(int labelWidth) {
        this.labelWidth = labelWidth;
    }

    public String getLabelPosition() {
        return labelPosition;
    }

    @XmlElement
    public void setLabelPosition(String labelPosition) {
        this.labelPosition = labelPosition;
    }

    public String getTextStyle() {
        return textStyle;
    }

    @XmlElement
    public void setTextStyle(String textStyle) {
        this.textStyle = textStyle;
    }

    public int getTextSize() {
        return textSize;
    }

    @XmlElement
    public void setTextSize(int textSize) {
        this.textSize = textSize;
    }

    public String getTextFormat() {
        return textFormat;
    }

    @XmlElement
    public void setTextFormat(String textFormat) {
        this.textFormat = textFormat;
    }

    public int getComponentWidth() {
        return componentWidth;
    }

    @XmlElement
    public void setComponentWidth(int componentWidth) {
        this.componentWidth = componentWidth;
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

    public List<Languages> getLabelLanguage() {
        return labelLanguage;
    }

    @XmlElement
    public void setLabelLanguage(List<Languages> labelLanguage) {
        this.labelLanguage = labelLanguage;
    }

    @Override
    public String toString() {
        return "Link{" +
                "uniqueId=" + uniqueId +
                ", label='" + label + '\'' +
                ", tooltip='" + tooltip + '\'' +
                ", labelWidth=" + labelWidth +
                ", labelPosition='" + labelPosition + '\'' +
                ", textStyle='" + textStyle + '\'' +
                ", textSize=" + textSize +
                ", textFormat='" + textFormat + '\'' +
                ", componentWidth=" + componentWidth +
                ", type='" + type + '\'' +
                ", url='" + url + '\'' +
                ", viewToCall='" + viewToCall + '\'' +
                ", labelLanguage=" + labelLanguage +
                '}';
    }
}

