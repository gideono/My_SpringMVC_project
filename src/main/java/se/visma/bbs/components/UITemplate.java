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

}
