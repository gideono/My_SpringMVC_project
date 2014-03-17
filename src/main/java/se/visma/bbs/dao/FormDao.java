package se.visma.bbs.dao;

import se.visma.bbs.model.Form;

import java.util.List;

/**
 * Created by gideon on 2014-02-03.
 */
public interface FormDao {
    public void saveForm(Form from);
    public List<String> getFormList();
    public Form getForm(long id);
    public void updateForm(Form form, long id);

}
