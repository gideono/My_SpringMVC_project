package se.visma.bbs.components;

import javax.xml.bind.annotation.XmlRootElement;
import java.util.Collection;

/**
 * Created by gideon on 2014-02-18.
 */
@XmlRootElement(name = "element")
public class UICollection {
    public Collection<UITemplate> uiTemplates ;

    public Collection<UITemplate> getUiTemplates(){
        return this.uiTemplates;
    }

    @Override
    public String toString() {
        return "UICollection{" +
                "uitemplates=" + uiTemplates +
                '}';
    }
}
