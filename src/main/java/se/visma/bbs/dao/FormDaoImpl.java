package se.visma.bbs.dao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import se.visma.bbs.components.Link;
import se.visma.bbs.components.Text;
import se.visma.bbs.components.UITemplate;
import se.visma.bbs.model.Form;

import javax.sql.DataSource;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import java.io.StringReader;
import java.util.List;
import java.util.Map;


/**
 * Created by gideon on 2014-02-03.
 */
public class FormDaoImpl implements FormDao {

    @Autowired
    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate;

    @Override
    public void saveForm(Form form) {
        System.out.println(form.getDate()+" "+form.toXml());
        String sql = "INSERT INTO forms "
                + "( name, date, xmlbody) VALUES ( ?, ?,?)";
        jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(sql, new Object[] { "test", form.getDate(), form.toXml() });
        System.out.println("Insert complete");
    }

    @Override
    public List<String> getFormList() {
        List formList;
        String sql = "select form_id, name, date from forms";
        jdbcTemplate = new JdbcTemplate(dataSource);
        formList = jdbcTemplate.queryForList(sql);
        return formList;
    }

    @Override
    public Form getForm(long id) {
        String sql = "select xmlbody from forms where form_id=" + id;
        jdbcTemplate = new JdbcTemplate(dataSource);
        Map xmlBody = jdbcTemplate.queryForMap(sql);
        return toPojo(xmlBody.get("xmlbody").toString());
    }

    @Override
    public void updateForm(Form form, long id) {
        System.out.println("in dao" + id +" "+ form.toXml());
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update("update forms set xmlbody = ? where form_id = ?", form.toXml(), id);
    }

    private Form toPojo(String xmlString){
        Form form = null;
        try {
            JAXBContext jc = JAXBContext.newInstance(Form.class);
            StringReader sr = new StringReader(xmlString);
            Unmarshaller unmarshaller = jc.createUnmarshaller();
            form = (Form) unmarshaller.unmarshal(sr);
        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return form;
    }

}
