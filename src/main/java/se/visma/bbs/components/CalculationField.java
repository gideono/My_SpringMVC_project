package se.visma.bbs.components;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by gideonoduro on 2014-03-13.
 */
@XmlRootElement(name = "calculationfield")
@JsonIgnoreProperties(ignoreUnknown = true)
public class CalculationField extends UITemplate{

    private int uniqueId = 0;
    private String label = null;
    private List<Languages> labelLanguage = new ArrayList<Languages>();
    private String mappingOperation = null;
    private String toMappingField = null;
    private String printOrder = null;
    private boolean printOnApprovalMail = false;
    private boolean printOnOrderMail = false;
    private String viewToCall = null;
    private String type = null;


    public CalculationField(){
        this.type = this.getClass().getSimpleName().toLowerCase();
    }

    public int getUniqueId() {
        return uniqueId;
    }

    @XmlElement
    public void setUniqueId(int uniqueId) {
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

    public String getMappingOperation() {
        return mappingOperation;
    }

    @XmlElement
    public void setMappingOperation(String mappingOperation) {
        this.mappingOperation = mappingOperation;
    }

    public String getToMappingField() {
        return toMappingField;
    }

    @XmlElement
    public void setToMappingField(String toMappingField) {
        this.toMappingField = toMappingField;
    }

    public String getPrintOrder() {
        return printOrder;
    }

    @XmlElement
    public void setPrintOrder(String printOrder) {
        this.printOrder = printOrder;
    }

    public boolean isPrintOnApprovalMail() {
        return printOnApprovalMail;
    }

    @XmlElement
    public void setPrintOnApprovalMail(boolean printOnApprovalMail) {
        this.printOnApprovalMail = printOnApprovalMail;
    }

    public boolean isPrintOnOrderMail() {
        return printOnOrderMail;
    }

    @XmlElement
    public void setPrintOnOrderMail(boolean printOnOrderMail) {
        this.printOnOrderMail = printOnOrderMail;
    }

    public String getViewToCall() {
        return viewToCall;
    }

    @XmlElement
    public void setViewToCall(String viewToCall) {
        this.viewToCall = viewToCall;
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
        return "CalculationField{" +
                "uniqueId=" + uniqueId +
                ", label='" + label + '\'' +
                ", labelLanguage=" + labelLanguage +
                ", mappingOperation='" + mappingOperation + '\'' +
                ", toMappingField='" + toMappingField + '\'' +
                ", printOrder='" + printOrder + '\'' +
                ", printOnApprovalMail=" + printOnApprovalMail +
                ", printOnOrderMail=" + printOnOrderMail +
                ", viewToCall='" + viewToCall + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
