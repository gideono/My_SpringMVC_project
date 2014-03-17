package se.visma.bbs.model;

import se.visma.bbs.components.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSeeAlso;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by gideon on 2014-02-03.
 */

@XmlRootElement(name="form")
@XmlSeeAlso({UITemplate.class, Link.class, Text.class, Input.class, ComboBox.class,
        Radio.class, LinkButton.class, Image.class, CalculationField.class,
        Suppcelector.class, Checkbox.class, Textarea.class, DateComp.class})
public class Form extends ArrayList<UITemplate>{

    private Date date = null;

    public Form() {
    }

    public Form(ArrayList<UITemplate> elements) {
        this.addAll(elements);
        date = new Date();
    }


    @XmlElement(name = "element")
    private List<UITemplate> getUiElements() {
        return this;
    }

    public Date getDate(){
        return date;
    }

    public String toXml(){
        java.io.StringWriter sw = new StringWriter();
        try {
            JAXBContext context = JAXBContext.newInstance(Form.class);
            Marshaller m = context.createMarshaller();
            m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
            m.marshal(this.getUiElements(), sw);
        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return sw.toString();
    }

    public Form getForm(){
        return this;
    }
}
