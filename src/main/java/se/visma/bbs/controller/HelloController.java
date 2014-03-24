package se.visma.bbs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import se.visma.bbs.components.JsonToPojo;
import se.visma.bbs.components.UICollection;
import se.visma.bbs.model.*;

import se.visma.bbs.services.FormService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/")
public class HelloController {

    @Autowired
    private FormService formService;

    @RequestMapping(method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        User user = new User();
        model.addAttribute("message", "Hello world!");
        model.addAttribute("USER", user);
        return "hello";
    }

    @RequestMapping(value="/getList", method = RequestMethod.GET)
    public @ResponseBody List<String> getList(){
        return formService.getList();
    }


    @RequestMapping(value="/getForm/{id}", method = RequestMethod.GET)
    public @ResponseBody Form getFormById(@PathVariable long id){
        System.out.println(formService.getForm(id));
        return formService.getForm(id);
    }


    @RequestMapping(value="/saveForm", method = RequestMethod.POST)
    public @ResponseBody void saveForm( @RequestParam(value ="data") String jsonStr){
        System.out.println(jsonStr);

        formService.saveForm(convertToPojo(jsonStr));
    }


    @RequestMapping(value="/updateForm/{id}", method = RequestMethod.POST)
    public @ResponseBody void updateForm(@PathVariable(value="id") long id, @RequestParam(value = "data") String jsonStr ){
        System.out.println(id +" "+ convertToPojo(jsonStr));
        formService.updateForm(convertToPojo(jsonStr), id);

    }

    @RequestMapping("/draganddrop")
    public String dragAndDrop() {
        return "draganddrop";
    }

    private Form convertToPojo(String json){
        JsonToPojo jsonToPojo = new JsonToPojo();
        UICollection uiCollection = jsonToPojo.convert(json);
        ArrayList components = new ArrayList(uiCollection.getUiTemplates());
        Form form = new Form(components);
        return form;
    }

    @RequestMapping(value = "/previewPost", method = RequestMethod.POST)
    public @ResponseBody Map<String, List> previewForm(){
      return null;
    }

/*

    @RequestMapping(method = RequestMethod.POST)
    public String StringproccessForm(@ModelAttribute(value = "USER") User user, BindingResult result,ModelMap model) {
        if(result.hasErrors()){
            return "hello";
        }else{
            System.out.println("User Value is: " + user);
            model.addAttribute("USER", user);
            return "success";
        }
    }

    @RequestMapping("/overview")
    public String spaOverview() {
        return "overview";
    }

    @RequestMapping("/helloworldspa")
    public String helloWorldspa() {
        return "helloworldspa";
    }
*/
}