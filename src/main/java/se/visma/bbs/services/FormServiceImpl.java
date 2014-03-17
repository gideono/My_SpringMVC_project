package se.visma.bbs.services;

import org.springframework.beans.factory.annotation.Autowired;
import se.visma.bbs.dao.FormDao;
import se.visma.bbs.model.Form;

import java.util.List;

/**
 * Created by gideon on 2014-02-04.
 */
public class FormServiceImpl implements FormService {

    @Autowired
    private FormDao formDao;

    @Override
    public void saveForm(Form form) {
        formDao.saveForm(form);
    }

    @Override
    public List<String> getList() {
        return formDao.getFormList();
    }

    @Override
    public Form getForm(long id) {
        return formDao.getForm(id);
    }

    @Override
    public void updateForm(Form form, long id) {
        formDao.updateForm(form, id);
    }

}
