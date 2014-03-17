package se.visma.bbs.services;

import se.visma.bbs.model.Form;

import java.util.List;

/**
 * Created by gideon on 2014-02-03.
 */
public interface FormService {
    public void saveForm(Form form);
    public List<String> getList();
    public Form getForm(long id);
    public void updateForm(Form form, long id);
}
