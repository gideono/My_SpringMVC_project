package se.visma.bbs.components;

import org.codehaus.jackson.annotate.JsonSubTypes;
import org.codehaus.jackson.annotate.JsonSubTypes.Type;
import org.codehaus.jackson.annotate.JsonTypeInfo;

/**
 * Created by gideon on 2014-02-18.
 */

@JsonTypeInfo(
        use = JsonTypeInfo.Id.NAME,
        include = JsonTypeInfo.As.PROPERTY,
        property = "type")
@JsonSubTypes({
        @Type(value = Text.class, name = "text"),
        @Type(value = Link.class, name = "link"),
        @Type(value = Input.class, name = "input"),
        @Type(value = ComboBox.class, name = "combobox"),
        @Type(value = Radio.class, name = "radio"),
        @Type(value = LinkButton.class, name = "linkbutton"),
        @Type(value = Image.class, name = "image"),
        @Type(value = CalculationField.class, name = "calculationfield"),
        @Type(value = Suppcelector.class, name = "suppcelector"),
        @Type(value = Checkbox.class, name = "checkbox"),
        @Type(value = Textarea.class, name = "textarea"),
        @Type(value = DateComp.class, name = "datecomp")})
public abstract class UITemplate {
    private long uniqueId;
    private String fromMappingField = null;
    private String toMappingField = null;
    private String value = null;

    public long getUniqueId() {
        return uniqueId;
    }

    public void setUniqueId(long uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getFromMappingField() {
        return fromMappingField;
    }

    public void setFromMappingField(String fromMappingField) {
        this.fromMappingField = fromMappingField;
    }

    public String getToMappingField() {
        return toMappingField;
    }

    public void setToMappingField(String toMappingField) {
        this.toMappingField = toMappingField;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
