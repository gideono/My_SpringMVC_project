<%--
  Created by IntelliJ IDEA.
  User: gideon
  Date: 2014-01-24
  Time: 09:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/kendo.web.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery-ui-1.10.4.custom.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.contextMenu.js"></script>


    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/jquery-ui-1.10.4.custom.min.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/jquery.appendGrid-1.3.1.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/jquery.contextMenu.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/kendo.common.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/kendo.default.min.css" />

    <title>Drag & Drop</title>
</head>

<style>

    #sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
    #sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em;}
    #sortable li span { position: absolute; margin-left: -1.3em; }

</style>

<div class="container">
    <h1>jQuery Drag & Drop</h1>
    <hr>



    <div class="row">
        <div class="col-md-4">

            <div id="textarea" class="draggable ui-widget-content" style="width: 170px; height: 60px; padding: 0.5em; resize: none;">
                <textarea></textarea>
            </div>

            <div id="checkbox" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                option: <input type="checkbox" name="option" value="option">
            </div>

            <div id="text" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                <p style="pointer-events: none">Text</p>
            </div>

            <div id="link" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                <a href="javascript:void(0)">Link text</a>
            </div>

            <div id="input" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                <input type="text">
            </div>

            <div id="datecomp" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                <input type="date">
            </div>

        </div>
        <div class="col-md-4">
            <div id="combobox" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                <select>
                    <option value="option">options...</option>
                </select>
            </div>

            <div id="linkbutton" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                <button><a href="javascript:void(0)"></a>Link Button</button>
            </div>

            <div id="image" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                <p style="pointer-events: none;">Image</p>
            </div>

            <div id="radio" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                Radio Button: <input type="radio" name="group" value="option">
            </div>

            <div id="calculationfield" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                <p style="pointer-events: none;">Calculation field</p>
            </div>

            <div id="suppcelector" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;">
                <input type="text" style="pointer-events: none"><button>select</button> <button>clear</button>
            </div>

        </div>


        <div id="savedForms" class="col-md-4">
            <h4>Saved forms</h4>
            <div id="formList">
            </div>
            <button id="getBtn" class="btn default-btn">Get List</button>
        </div>
    </div>

    <hr>
    <%------------------%>
    <%--Droppable area--%>
    <%------------------%>
    <div id="droppable" class="ui-widget-header" style="width: 1150px; height: 300px; padding: 0.5em; margin: 10px;">
        <ul id="sortable">
        </ul>
    </div>

    <button id="saveBtn" class="btn default-btn">Save</button>
    <button id="updateBtn" class="btn default-btn">Update</button>


    <div id="window" style="display: none"> </div>
    <div id="labelGrid" style="display: none"> </div>
    <div id="optionGrid" style="display: none"> </div>

</div>

<script type="text/javascript">
$(document).ready(function(){

    /****************************************************/
    /**************Modul Specific variables**************/
    /****************************************************/

    var form = [];
    var id = null;
    var objectId = null;
    var optionGridCreated = false;
    var languageGridCreated = false;
    var i;
    var from_to_mappingFieldSrc = [
        { name: "Delivary Day" },
        { name: "Price" },
        { name: "Quantity" },
        { name: "Item Description" },
        { name: "Unity type" },
        { name: "VAT" },
        { name: "Currency" },
        { name: "Item number" },
        { name: "Supplier name" },
        { name: "UNSPSC" },
        { name: "MTP-ID" },
        { name: "Order address" },
        { name: "SFB_SELECT" }
    ];

    var textFormatSrc = [
        { name: "Chars" },
        { name: "Numbers" },
        { name: "Time format" },
        { name: "Date format" },
        { name: "Email format" }
    ];

    var textSizeSrc = [
        { name: 8 },
        { name: 10 },
        { name: 11 },
        { name: 12 },
        { name: 14 },
        { name: 18 },
        { name: 24 }
    ];

    var textStyleSrc = [
        { name: "Normal" },
        { name: "Bold" },
        { name: "Italic" }
    ];

    var labelPositionSrc = [
        { name: "Vertical" },
        { name: "Horizontal" }
    ];

    var imageResizeSrc = [
        {name: "Crop"},
        {name: "Stretch"}
    ];

    var docLines = [
        {"language":"Svenska","phrase":"Hej"},
        {"language":"Engelska","phrase":"hey"}
    ];

    var optionTemplate = {text: "", value: "", returnValue: "", numValue: 0, txtValue: "", english: "", finnish: "", norwegian: "", german:"", danish:"", polish:"", _default: false, invalid: false};
    var labelLanguagetemplate = {language:"",phrase:""};


    /****************************************************/
    /*************Right click functionality**************/
    /****************************************************/

    $(function(){
        $.contextMenu({
            selector: '.ui-state-default',
            callback: function(key, options) {
                var m = "clicked: " + key;
                window.console && console.log(m) || alert(m);
            },
            items: {
                "edit": {name: "Edit", icon: "edit"},
                "copy": {name: "Copy", icon: "copy"},
                "cut": {name: "Cut", icon: "cut"},
                "delete": {name: "Delete", icon: "delete"}
            }
        });
    });

    /****************************************************/
    /*******************Drag & drop**********************/
    /****************************************************/

    $(".draggable").draggable({
        revert: "invalid",
        scroll: false,
        helper: "clone"
    });

    $("#droppable").droppable({
        drop: onDrop
    });

    function onDrop(e, droppedComponent){
        var componentData = returnObservableType(droppedComponent.draggable.attr("id"));

        if(droppedComponent.draggable.hasClass("draggable")){
            $("#droppable ul").append( "<li id="+ objectId +" class='ui-state-default'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span>" + droppedComponent.draggable.html() + "</li>");
            form.push(componentData);
            console.log("Array lenght: " + form.length +" "+ JSON.stringify(form));
        }
    };

    function returnObservableType(type){
        objectId = new Date().getUTCMilliseconds();
        console.log(type);
        switch (type){
            case "text":
                return createTextObservableObject(objectId, type);
                break;

            case "link":
                return createLinkObservableObject(objectId, type);
                break;

            case "input":
                return createInputObservableObject(objectId, type);
                break;

            case "combobox":
                return createComboboxObservableObject(objectId, type);
                break;

            case "radio":
                return createRadioObservableObject(objectId, type);
                break;

            case "linkbutton":
                return createLinkButtonObservableObject(objectId, type);
                break;

            case "image":
                return createImageObservableObject(objectId, type);
                break;

            case "calculationfield":
                return createCalculationfieldObservableObject(objectId, type);
                break;

            case "suppcelector":
                return createSuppcelectorObservableObject(objectId, type);
                break;

            case "checkbox":
                return createCheckboxObservableObject(objectId, type);
                break;

            case "textarea":
                return createTextareaObservableObject(objectId, type);
                break;

            case "datecomp":
                return createDatecompObservableObject(objectId, type);
                break;
        }
    };

    function createTextObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            newLanguage:labelLanguagetemplate,
            labelLanguage:[],
            labelWidth: 100,
            textStyle: "Normal",
            textStyleSrc: textStyleSrc,
            type: type,
            textSize: 12,
            textSizeSrc: textSizeSrc,
            viewToCall: "text-configuration-menu"
        });
    }

    function createLinkObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            newLanguage:labelLanguagetemplate,
            labelLanguage:[],
            toolTips: "A simple tooltip",
            labelWidth: 100,
            labelPosition: "Vertical",
            labelPositionSrc: labelPositionSrc,
            textStyle: "Normal",
            textStyleSrc: textStyleSrc,
            textSize: 12,
            textSizeSrc: textSizeSrc,
            textFormat: "Chars",
            textFormatSrc: textFormatSrc,
            componentWidth: 150,
            type: type,
            url: "http://",
            viewToCall: "link-configuration-menu"
        });
    }

    function createInputObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            newLanguage:labelLanguagetemplate,
            labelLanguage:[],
            toolTips: "tip",
            labelWidth: 100,
            labelPosition: "vertical",
            labelPositionSrc: labelPositionSrc,
            textStyle: "Normal",
            textStyleSrc: textStyleSrc,
            type: type,
            textSize: 12,
            textSizeSrc: textSizeSrc,
            textFormat: "Chars",
            textFormatSrc: textFormatSrc,
            mandatoryInfo: false,
            personNumber: false,
            componentHeight: 18,
            componentWidth: 150,
            in_mappingDefValue: "",
            from_mappingField: "choose..",
            from_mappingFielSrc: from_to_mappingFieldSrc,
            to_mappingField: "choose..",
            to_mappingFieldSrc: from_to_mappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            keepAfterAdding: false,
            viewToCall: "input-configuration-menu"
        });
    }

    function createComboboxObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            newLanguage:labelLanguagetemplate,
            labelLanguage:[],
            toolTips: "tip",
            labelWidth: 100,
            labelPosition: "vertical",
            labelPositionSrc: labelPositionSrc,
            textStyle: "Normal",
            textStyleSrc: textStyleSrc,
            type: type,
            textSize: 12,
            textSizeSrc: textSizeSrc,
            textFormat: "Chars",
            textFormatSrc: textFormatSrc,
            mandatoryInfo: false,
            personNumber: false,
            componentHeight: 18,
            componentWidth: 150,
            in_mappingDefValue: "",
            from_mappingField: "choose..",
            from_mappingFielSrc: from_to_mappingFieldSrc,
            to_mappingField: "choose..",
            to_mappingFieldSrc: from_to_mappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            keepAfterAdding: false,
            addedOptions: [],
            newOption: optionTemplate,
            viewToCall: "combobox-configuration-menu"
        });
    }

    function createRadioObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            newLanguage:labelLanguagetemplate,
            labelLanguage:[],
            toolTips: "tip",
            labelWidth: 100,
            labelPosition: "vertical",
            labelPositionSrc: labelPositionSrc,
            textStyle: "Normal",
            textStyleSrc: textStyleSrc,
            type: type,
            textSize: 12,
            textSizeSrc: textSizeSrc,
            textFormat: "Chars",
            textFormatSrc: textFormatSrc,
            mandatoryInfo: false,
            personNumber: false,
            componentHeight: 18,
            componentWidth: 150,
            in_mappingDefValue: "",
            from_mappingField: "choose..",
            from_mappingFielSrc: from_to_mappingFieldSrc,
            to_mappingField: "choose..",
            to_mappingFieldSrc: from_to_mappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            group: "",
            keepAfterAdding: false,
            addedOptions: [],
            newOption: optionTemplate,
            viewToCall: "radio-configuration-menu"
        });
    }

    function createLinkButtonObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            newLanguage:labelLanguagetemplate,
            labelLanguage: [],
            toolTips: "A Simple Tooltip",
            url: "http://",
            type: type,
            viewToCall: "linkbutton-configuration-menu"
        });
    }

    function createImageObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            newLanguage:labelLanguagetemplate,
            labelLanguage: [],
            toolTips: "A Simple Tooltip",
            type: type,
            url: "http://",
            componentHeight: 18,
            componentWidth: 150,
            imageResize: "Crop",
            imageResizeSrc: imageResizeSrc,
            viewToCall: "image-configuration-menu"
        });
    }

    function createCalculationfieldObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            newLanguage:labelLanguagetemplate,
            labelLanguage:[],
            type: type,
            mappingOperation: "",
            to_mappingField: "choose..",
            to_mappingFieldSrc: from_to_mappingFieldSrc,
            printOrder: "Otto",
            printOnApprovalMail: false,
            printOnOrderMail: false,
            viewToCall: "calc-configuration-menu"
        });
    }

    function createSuppcelectorObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            newLanguage:labelLanguagetemplate,
            labelLanguage:[],
            toolTips: "tip",
            labelWidth: 100,
            labelPosition: "vertical",
            labelPositionSrc: labelPositionSrc,
            textStyle: "Normal",
            textStyleSrc: textStyleSrc,
            type: type,
            textSize: 12,
            textSizeSrc: textSizeSrc,
            textFormat: "Chars",
            textFormatSrc: textFormatSrc,
            mandatoryInfo: false,
            personNumber: false,
            componentHeight: 18,
            componentWidth: 150,
            in_mappingDefValue: "",
            from_mappingField: "choose..",
            from_mappingFielSrc: from_to_mappingFieldSrc,
            to_mappingField: "choose..",
            to_mappingFieldSrc: from_to_mappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            keepAfterAdding: false,
            viewToCall: "supp-configuration-menu"
        });
    }

    function createCheckboxObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            newLanguage:labelLanguagetemplate,
            labelLanguage:[],
            toolTips: "tip",
            labelWidth: 100,
            labelPosition: "vertical",
            labelPositionSrc: labelPositionSrc,
            textStyle: "Normal",
            textStyleSrc: textStyleSrc,
            type: type,
            textSize: 12,
            textSizeSrc: textSizeSrc,
            textFormat: "Chars",
            textFormatSrc: textFormatSrc,
            mandatoryInfo: false,
            personNumber: false,
            componentHeight: 18,
            componentWidth: 150,
            in_mappingDefValue: "",
            from_mappingField: "choose..",
            from_mappingFielSrc: from_to_mappingFieldSrc,
            to_mappingField: "choose..",
            to_mappingFieldSrc: from_to_mappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            keepAfterAdding: false,
            addedOptions: [],
            newOption: optionTemplate,
            checked: false,
            viewToCall: "checkbox-configuration-menu"
        });
    }

    function createTextareaObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            labelLanguage:[],
            newLanguage:labelLanguagetemplate,
            toolTips: "tip",
            labelWidth: 100,
            labelPosition: "vertical",
            labelPositionSrc: labelPositionSrc,
            textStyle: "Normal",
            textStyleSrc: textStyleSrc,
            type: type,
            textSize: 12,
            textSizeSrc: textSizeSrc,
            mandatoryInfo: false,
            componentHeight: 18,
            componentWidth: 150,
            in_mappingDefValue: "",
            from_mappingField: "choose..",
            from_mappingFielSrc: from_to_mappingFieldSrc,
            to_mappingField: "choose..",
            to_mappingFieldSrc: from_to_mappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            keepAfterAdding: false,
            viewToCall: "textarea-configuration-menu"
        });
    }

    function createDatecompObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "name",
            labelLanguage:[],
            newLanguage:labelLanguagetemplate,
            toolTips: "tip",
            labelWidth: 100,
            labelPosition: "vertical",
            labelPositionSrc: labelPositionSrc,
            textStyle: "Normal",
            textStyleSrc: textStyleSrc,
            type: type,
            textSize: 12,
            textSizeSrc: textSizeSrc,
            textFormat: "Chars",
            textFormatSrc: textFormatSrc,
            mandatoryInfo: false,
            componentWidth: 150,
            in_mappingDefValue: "",
            from_mappingField: "choose..",
            from_mappingFielSrc: from_to_mappingFieldSrc,
            to_mappingField: "choose..",
            to_mappingFieldSrc: from_to_mappingFieldSrc,
            printOrder: "Otto",
            printOnApprovalMail: false,
            printOnOrderMail: false,
            keepAfterAdding: false,
            viewToCall: "datecomp-configuration-menu"
        });
    }



    $("#sortable").sortable({
        revert: true
    });

    /****************************************************/
    /*******************Ajax Calles**********************/
    /****************************************************/

    $("#saveBtn").click(function(){
        if(form.length > 0){
            $.ajax({
                type: 'POST',
                url: "/saveForm",
                dataType: "json",
                data: {data: JSON.stringify(form)},
                success: function(){
                    console.log("u are cool");
                }
            });
            $("#droppable ul li").remove();
            form = [];
        }else{
            alert("Form is empty, please add components");
        }
    });

    $("#getBtn").click(function(){
        $.ajax({
            type: 'GET',
            url: '/getList',
            dataType: "json",
            success: renderList
        });
    });

    function renderList(data){
        var list = data == null ? [] : (data instanceof Array ? data : [data]);
        $('#formList li').remove();
        $.each(list, function(index, form) {
            $('#formList').append('<li><a class="linkable" id='+ form.form_id +' href="javascript:void(0);">'+form.form_id+ " " +form.name+ " "+ form.date+'</a></li>');
        });
    };

    $("#formList").on("click", ".linkable", function(e){
        id = e.target.id;
        form = [];
        optionGridCreated = false;
        languageGridCreated = false;
        $.ajax({
            type: 'GET',
            url: 'getForm' + '/' + id,
            dataType: "json",
            success: renderForm
        });
        $('#saveBtn').attr("disabled", true);
    });

    function renderForm(data){
        $("#droppable ul li").remove();

        var list;

        if (data == null) {
            list = [];
        } else {
            if (data instanceof Array) {
                list = data;
            } else {
                list = [data];
            }
        }

        $.each(list, function(index, formComponentData) {
            create(formComponentData);
        });
        console.log("Element count: " + form.length);
    };

    function create(formComponentData){
        switch (formComponentData.type){
            case "text":
                console.log("text")
                $('#sortable').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> <div>"+ formComponentData.label +" </div></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    labelLanguage:formComponentData.labelLanguage,
                    newLanguage:labelLanguagetemplate,
                    labelWidth: formComponentData.labelWidth,
                    textStyle: formComponentData.textStyle,
                    textStyleSrc: textStyleSrc,
                    type: formComponentData.type,
                    textSize: formComponentData.textSize,
                    textSizeSrc: textSizeSrc,
                    viewToCall: formComponentData.viewToCall
                });
                form.push(componentData);
                console.log(JSON.stringify(form));
                break;

            case "link":
                console.log("Link")
                $('#sortable').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span><a href='"+ formComponentData.url +"'>"+ formComponentData.label +"</a></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    newLanguage:labelLanguagetemplate,
                    labelLanguage:formComponentData.labelLanguage,
                    tooltip: formComponentData.tooltip,
                    labelWidth: formComponentData.labelWidth,
                    labelPosition: formComponentData.labelPosition,
                    labelPositionSrc: labelPositionSrc,
                    textStyle: formComponentData.textStyle,
                    textStyleSrc: textStyleSrc,
                    type: formComponentData.type,
                    textSize: formComponentData.textSize,
                    textSizeSrc: textSizeSrc,
                    textFormat: formComponentData.textFormat,
                    textFormatSrc: textFormatSrc,
                    componentWidth: formComponentData.componentWidth,
                    url: formComponentData.url,
                    viewToCall: formComponentData.viewToCall
                });
                form.push(componentData);
                break;

            case "input":
                console.log("input")
                $('#sortable').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" :   <input id='"+ formComponentData.uniqueId +"' type='text'></input></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    newLanguage:labelLanguagetemplate,
                    labelLanguage:formComponentData.labelLanguage,
                    labelWidth: formComponentData.labelWidth,
                    labelPosition: formComponentData.labelPosition,
                    labelPositionSrc: labelPositionSrc,
                    textStyle: formComponentData.textStyle,
                    textStyleSrc: textStyleSrc,
                    type: formComponentData.type,
                    textSize: formComponentData.textSize,
                    textSizeSrc: textSizeSrc,
                    textFormat: formComponentData.textFormat,
                    textFormatSrc: textFormatSrc,
                    mandatoryInfo: formComponentData.mandatoryInfo,
                    personNumber: formComponentData.personNumber,
                    componentHeight: formComponentData.componentHeight,
                    componentWidth: formComponentData.componentWidth,
                    in_mappingDefValue: formComponentData.in_mappingDefValue,
                    from_mappingField: formComponentData.from_mappingField,
                    from_mappingFielSrc: from_to_mappingFieldSrc,
                    to_mappingField: formComponentData.to_mappingField,
                    to_mappingFieldSrc: from_to_mappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    viewToCall: formComponentData.viewToCall
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "combobox":
                $('#sortable').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" :   <select id='"+ formComponentData.uniqueId +"'>"+getSavedOptions(formComponentData.addedOptions)+"</select></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    labelLanguage:formComponentData.labelLanguage,
                    newLanguage:labelLanguagetemplate,
                    labelWidth: formComponentData.labelWidth,
                    labelPosition: formComponentData.labelPosition,
                    labelPositionSrc: labelPositionSrc,
                    textStyle: formComponentData.textStyle,
                    textStyleSrc: textStyleSrc,
                    type: formComponentData.type,
                    textSize: formComponentData.textSize,
                    textSizeSrc: textSizeSrc,
                    textFormat: formComponentData.textFormat,
                    textFormatSrc: textFormatSrc,
                    mandatoryInfo: formComponentData.mandatoryInfo,
                    personNumber: formComponentData.personNumber,
                    componentHeight: formComponentData.componentHeight,
                    componentWidth: formComponentData.componentWidth,
                    in_mappingDefValue: formComponentData.in_mappingDefValue,
                    from_mappingField: formComponentData.from_mappingField,
                    from_mappingFielSrc: from_to_mappingFieldSrc,
                    to_mappingField: formComponentData.to_mappingField,
                    to_mappingFieldSrc: from_to_mappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    addedOptions: formComponentData.addedOptions,
                    newOption: optionTemplate,
                    viewToCall: formComponentData.viewToCall
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "radio":
                $('#sortable').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" :   <input id='"+ formComponentData.uniqueId +"' name='"+ formComponentData.group +"' type='"+ formComponentData.type +"' > </input></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    labelLanguage:formComponentData.labelLanguage,
                    newLanguage:labelLanguagetemplate,
                    labelWidth: formComponentData.labelWidth,
                    labelPosition: formComponentData.labelPosition,
                    labelPositionSrc: labelPositionSrc,
                    textStyle: formComponentData.textStyle,
                    textStyleSrc: textStyleSrc,
                    type: formComponentData.type,
                    textSize: formComponentData.textSize,
                    textSizeSrc: textSizeSrc,
                    textFormat: formComponentData.textFormat,
                    textFormatSrc: textFormatSrc,
                    mandatoryInfo: formComponentData.mandatoryInfo,
                    personNumber: formComponentData.personNumber,
                    componentHeight: formComponentData.componentHeight,
                    componentWidth: formComponentData.componentWidth,
                    in_mappingDefValue: formComponentData.in_mappingDefValue,
                    from_mappingField: formComponentData.from_mappingField,
                    from_mappingFielSrc: from_to_mappingFieldSrc,
                    to_mappingField: formComponentData.to_mappingField,
                    to_mappingFieldSrc: from_to_mappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    group: formComponentData.group,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    addedOptions: formComponentData.addedOptions,
                    newOption: optionTemplate,
                    viewToCall: formComponentData.viewToCall
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "linkbutton":
                $('#sortable').append("<li id=" + formComponentData.uniqueId + " class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span><a href='"+ formComponentData.url+ "'><button>"+ formComponentData.label +"</button></a></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    type: formComponentData.type,
                    label: formComponentData.label,
                    labelLanguage: formComponentData.labelLanguage,
                    toolTips: formComponentData.toolTips,
                    url: formComponentData.url,
                    viewToCall: formComponentData.viewToCall
                });
                form.push(componentData);
                break;

            case "image":
                $('#sortable').append("<li id=" + formComponentData.uniqueId + " class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span><img src='"+ formComponentData.url+ "'></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    type: formComponentData.type,
                    label: formComponentData.label,
                    labelLanguage: formComponentData.labelLanguage,
                    toolTips: formComponentData.toolTips,
                    url: formComponentData.url,
                    componentHeight: formComponentData.componentHeight,
                    componentWidth: formComponentData.componentWidth,
                    imageResize: formComponentData.imageResize,
                    imageResizeSrc: imageResizeSrc,
                    viewToCall: formComponentData.viewToCall
                });
                form.push(componentData);
                break;

            case "calculationfield":
                console.log("calculationfield")
                $('#sortable').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> <div>"+ formComponentData.label +" </div></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    newLanguage:labelLanguagetemplate,
                    labelLanguage: formComponentData.labelLanguage,
                    type: formComponentData.type,
                    mappingOperation: formComponentData.mappingOperation,
                    to_mappingField: formComponentData.to_mappingField,
                    to_mappingFieldSrc: from_to_mappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    viewToCall: formComponentData.viewToCall
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "suppcelector":
                console.log("input")
                $('#sortable').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" :   <input id='"+ formComponentData.uniqueId +"' type='text'></input><button>select</button> <button>clear</button></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    newLanguage:labelLanguagetemplate,
                    labelLanguage:formComponentData.labelLanguage,
                    labelWidth: formComponentData.labelWidth,
                    labelPosition: formComponentData.labelPosition,
                    labelPositionSrc: labelPositionSrc,
                    textStyle: formComponentData.textStyle,
                    textStyleSrc: textStyleSrc,
                    type: formComponentData.type,
                    textSize: formComponentData.textSize,
                    textSizeSrc: textSizeSrc,
                    textFormat: formComponentData.textFormat,
                    textFormatSrc: textFormatSrc,
                    mandatoryInfo: formComponentData.mandatoryInfo,
                    personNumber: formComponentData.personNumber,
                    componentHeight: formComponentData.componentHeight,
                    componentWidth: formComponentData.componentWidth,
                    in_mappingDefValue: formComponentData.in_mappingDefValue,
                    from_mappingField: formComponentData.from_mappingField,
                    from_mappingFielSrc: from_to_mappingFieldSrc,
                    to_mappingField: formComponentData.to_mappingField,
                    to_mappingFieldSrc: from_to_mappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    viewToCall: formComponentData.viewToCall
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "checkbox":
                console.log("checkbox");
                $('#sortable').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" : <input id='"+ formComponentData.uniqueId +"' type='checkbox'></input></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    labelLanguage: formComponentData.labelLanguage,
                    newLanguage:labelLanguagetemplate,
                    toolTips: formComponentData.toolTips,
                    labelWidth: formComponentData.labelWidth,
                    labelPosition: formComponentData.labelPosition,
                    labelPositionSrc: labelPositionSrc,
                    textStyle: formComponentData.textStyle,
                    textStyleSrc: textStyleSrc,
                    type: formComponentData.type,
                    textSize: formComponentData.textSize,
                    textSizeSrc: textSizeSrc,
                    textFormat: formComponentData.textFormat,
                    textFormatSrc: textFormatSrc,
                    mandatoryInfo: formComponentData.mandatoryInfo,
                    personNumber: formComponentData.personNumber,
                    componentHeight: formComponentData.componentHeight,
                    componentWidth: formComponentData.componentWidth,
                    in_mappingDefValue: formComponentData.in_mappingDefValue,
                    from_mappingField: formComponentData.from_mappingField,
                    from_mappingFielSrc: from_to_mappingFieldSrc,
                    to_mappingField: formComponentData.to_mappingField,
                    to_mappingFieldSrc: from_to_mappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    addedOptions: formComponentData.addedOptions,
                    checked: formComponentData.checked,
                    viewToCall: formComponentData.viewToCall
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "textarea":
                console.log("textarea")
                $('#sortable').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" :   <textarea id='"+ formComponentData.uniqueId +"'></textarea></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    labelLanguage: formComponentData.labelLanguage,
                    newLanguage:labelLanguagetemplate,
                    labelWidth: formComponentData.labelWidth,
                    labelPosition: formComponentData.labelPosition,
                    labelPositionSrc: labelPositionSrc,
                    textStyle: formComponentData.textStyle,
                    textStyleSrc: textStyleSrc,
                    type: formComponentData.type,
                    textSize: formComponentData.textSize,
                    textSizeSrc: textSizeSrc,
                    mandatoryInfo: formComponentData.mandatoryInfo,
                    componentHeight: formComponentData.componentHeight,
                    componentWidth: formComponentData.componentWidth,
                    in_mappingDefValue: formComponentData.in_mappingDefValue,
                    from_mappingField: formComponentData.from_mappingField,
                    from_mappingFielSrc: from_to_mappingFieldSrc,
                    to_mappingField: formComponentData.to_mappingField,
                    to_mappingFieldSrc: from_to_mappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    viewToCall: formComponentData.viewToCall
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "datecomp":
                console.log("datecomp");
                $('#sortable').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" :   <input id='"+ formComponentData.uniqueId +"' type='date'></input></li>");

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    labelLanguage: formComponentData.labelLanguage,
                    newLanguage:labelLanguagetemplate,
                    labelWidth: formComponentData.labelWidth,
                    labelPosition: formComponentData.labelPosition,
                    labelPositionSrc: labelPositionSrc,
                    textStyle: formComponentData.textStyle,
                    textStyleSrc: textStyleSrc,
                    type: formComponentData.type,
                    textSize: formComponentData.textSize,
                    textSizeSrc: textSizeSrc,
                    textFormat: formComponentData.textFormat,
                    textFormatSrc: textFormatSrc,
                    mandatoryInfo: formComponentData.mandatoryInfo,
                    componentWidth: formComponentData.componentWidth,
                    in_mappingDefValue: formComponentData.in_mappingDefValue,
                    from_mappingField: formComponentData.from_mappingField,
                    from_mappingFielSrc: from_to_mappingFieldSrc,
                    to_mappingField: formComponentData.to_mappingField,
                    to_mappingFieldSrc: from_to_mappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    viewToCall: formComponentData.viewToCall
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

        }

    };

    $("#updateBtn").click(function(){
        $.ajax({
            type: 'POST',
            url: '/updateForm' + '/' + id,
            dataType: 'json',
            data: {data:JSON.stringify(form)},
            success: function(jqXHR, textStatus, errorThrown){
                console.log("U are cool");
            }
        });
        $("#droppable ul li").remove();
        form = [];
        $('#saveBtn').attr("disabled", false);

    });

    function getSavedOptions(arrayData){
        var htmlOption = null;
        for(var i = 0; i < arrayData.length ; i++){
            console.log("i is: " + i);
            htmlOption += "<option value='"+arrayData[i].text+"'>"+arrayData[i].text+"</option>";
            console.log(htmlOption);
        }
        return htmlOption;
    }

    /*****************************************************/
    /*****************View & Data Binding*****************/
    /*****************************************************/

    function getKendoObservable(e){

        for (var i = 0; i < form.length; i++) {
            if(form[i].uniqueId == e.target.id){
                return form[i];
            }
        }
    };

    $("#droppable").on("dblclick", ".ui-state-default", openConfigurationMenu);

    function openConfigurationMenu (e){
        var Observable = getKendoObservable(e);
        console.log("id of observable and target: " + Observable.uniqueId+" "+ e.target.id);
        var configurationView = new kendo.View(Observable.viewToCall);
        var configHtml = configurationView.render();
        kendo.bind(configHtml, Observable);
        $("#window").html(configHtml);
        $("#window").data("kendoWindow").center().open();
        activateWindowKeyFunction(e);
        activateLabelWindow(Observable);
        activateOptionWindow(Observable);
        checkBoxbuilder(Observable);
        checkBoxValidation(Observable);
    };

    function checkBoxbuilder(Observable){
        $("#mandatoryInfo").prop('checked', Observable.get("mandatoryInfo"));
        $("#personNumber").prop('checked', Observable.get("personNumber"));
        $("#printOnApprovalMail").prop('checked', Observable.get("printOnApprovalMail"));
        $("#printOnOrderMail").prop('checked', Observable.get("printOnOrderMail"));
        $("#readOnly").prop('checked', Observable.get("readOnly"));
        $("#doNotShow").prop('checked', Observable.get("doNotShow"));
        $("#keepAfterAdding").prop('checked', Observable.get("keepAfterAdding"));
    }

    function checkBoxValidation(Observable){
        $(".input_cbox").change(function(){
            var fieldName = $(this).attr("id");
            if($(this).is(':checked')){
                Observable.set(fieldName, true);
                console.log(fieldName +" is checked" );
            }else{
                Observable.set(fieldName, false);
                console.log(fieldName +" is unchecked" );
            }
        });
    }

    function activateWindowKeyFunction(e){
        if (e.altKey && e.keyCode === 87 /* w */) {
            $("#window").focus();
        }
        $("#btnOK").click(function(){
            $("#window").data("kendoWindow").close();
        });
    }

    $("#window").kendoWindow({
        title: "Window",
        width: "800px",
        height: "600px",
        modal: true,
        visible: false
    }).data("kendoWindow");


    /****************************************************/
    /*****************Configutation windows**************/
    /****************************************************/


    function activateLabelWindow(Observable){
        $("#swe-textBtn").click(function() {
            var labelGridView = new kendo.View("label-language-template");
            var labelGridHtml = labelGridView.render();
            kendo.bind(labelGridHtml, Observable);
            $("#labelGrid").html(labelGridHtml);
            $("#labelGrid").data("kendoWindow").center().open();
            $.each(Observable.labelLanguage, function(index, value) {
                $("#languageList ul").append("<li id='"+ index +"'>index:"+ index +" Language: "+ value.language +" "+" Phrase: "+ value.phrase +"" +
                        "<button class='deleteRow'>delete</button><button class='editRow'>edit</button></li>");
            });
            console.log(JSON.stringify(Observable))
            rowButtons(Observable);
            activateLabelButtons(Observable);

        });

        function activateLabelButtons(Observable){
            $("#addLabel").click(function(){
                Observable.get("labelLanguage").push(Observable.newLanguage);
                Observable.set("newLanguage", {language:"",phrase:""});
                languageTable(Observable);
            });

            $("#cancelLabel").click(function(){
                $("#labelGrid").data("kendoWindow").close();
            });
        }

        function languageTable(Observable){
            var arr = Observable.get("labelLanguage");
            var count = arr.length - 1;
            console.log(" language length: "+count+" and the content " + arr[count].language +" "+arr[count].phrase);
            $("#languageList ul").append("<li id='"+ count +"'>index:"+ count +" Language: "+ arr[count].language +" "+" Phrase: "+ arr[count].phrase +"" +
                    "<button class='deleteRow'>delete</button><button class='editRow'>edit</button></li>");
            rowButtons(Observable);
        }

        function rowButtons(Observable){
            var arr = Observable.get("labelLanguage");
            $(".deleteRow").click(function(){
                var row = $(this).closest("li").attr("id");
                $(this).closest('li').remove();
                arr.splice( $.inArray(row, arr), 1 );
                Observable.set("labelLanguage", arr);
            });

            $(".editRow").click(function(){
                console.log("clicked");
//                var row = $(this).closest("li").attr("id");
//                $(this).closest('li').remove();
//                arr.splice( $.inArray(row, arr), 1 );
//                Observable.set("labelLanguage", arr);
            });
        }
    };

    function activateOptionWindow(Observable){
        $("#optionBtn").click(function() {
            var optionView = new kendo.View("label-options-template");
            var optionConfigHtml = optionView.render();
            kendo.bind(optionConfigHtml, Observable);
            $("#optionGrid").html(optionConfigHtml);
            $("#optionGrid").data("kendoWindow").center().open();
            $.each(Observable.addedOptions, function(index, value) {
                $("#optionList ul").append("<li id='"+ index +"'>index:"+ index +" Text: "+ value.text +" "+" Value: "+ value.value +" " +
                        "Return: "+ value.returnValue +" Num value: "+ value.numValue +" Txt value: "+ value.txtValue +" English: "+ value.english +" Finnish: "+ value.finnish
                        +" Norwegian: "+ value.norwegian +" German: "+ value.german +" Danish: "+ value.danish +" polish: "+ value.polish +" " +
                        "Default: "+ value._default +" Invalid: "+ value.invalid +"<button class='deleteRow'>delete</button><button class='editRow'>edit</button></li>");
            });
            rowButtons(Observable);
            activateOptionButtons(Observable);
        });

        function activateOptionButtons(Observable){
            $("#addOption").click(function(){
                Observable.get("addedOptions").push(Observable.newOption);
                Observable.set("newOption", optionTemplate);
                optionTable(Observable);
            });

            $("#cancelOption").click(function(){
                $("#optionGrid").data("kendoWindow").close();
            });
        }

        function optionTable(Observable){
            var arr = Observable.get("addedOptions");
            console.log(JSON.stringify(arr));
            var count = arr.length - 1;
            console.log(" language length: "+count+" and the content " + arr[count].text +" "+arr[count].value);
            $("#optionList ul").append("<li id='"+ count +"'>index:"+ count +" Text: "+ arr[count].text +" "+" Value: "+ arr[count].value +" " +
                    "Return: "+ arr[count].returnValue +" Num value: "+ arr[count].numValue +" Txt value: "+ arr[count].txtValue +" English: "+ arr[count].english +" Finnish: "+ arr[count].finnish
                    +" Norwegian: "+ arr[count].norwegian +" German: "+ arr[count].german +" Danish: "+ arr[count].danish +" polish: "+ arr[count].polish +" " +
                    "Default: "+ arr[count]._default +" Invalid: "+ arr[count].invalid +"<button class='deleteRow'>delete</button><button class='editRow'>edit</button></li>");
            rowButtons(Observable);

        }

        function rowButtons(Observable){
            var arr = Observable.get("addedOptions");
            $(".deleteRow").click(function(){
                var row = $(this).closest("li").attr("id");
                $(this).closest('li').remove();
                arr.splice( $.inArray(row, arr), 1 );
                Observable.set("addedOptions", arr);
            });

            $(".editRow").click(function(){
                console.log("clicked");
//                var row = $(this).closest("li").attr("id");
//                $(this).closest('li').remove();
//                arr.splice( $.inArray(row, arr), 1 );
//                Observable.set("labelLanguage", arr);
            });
        }
    };




    $("#labelGrid").kendoWindow({
        width: "600px",
        height: "450px",
        modal: true,
        title: "Add phrase"
    }).data("kendoWindow");

    $("#optionGrid").kendoWindow({
        width: "600px",
        height: "450px",
        modal: true,
        title: "Add selectable options"
    }).data("kendoWindow");
});
</script>

<%------------------%>
<%-----Templates----%>
<%------------------%>

<script id="text-configuration-menu" type="text/x-kendoui-template">
    <div role="form" style="width: 750px">
        <h1>Text</h1>
        <div class="form-group">
            <label >ID (Unigue):</label>
            <input type="text" data-bind="value: uniqueId" class="form-control"  >

            <label for="swe-text">Text(Swedish):</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn">Language</button>
        </div>
        <div class="form-group">
            <label >Label width</label>
            <input type="text" data-bind="value: labelWidth" class="form-control" >

            <hr>
            <label >Text style:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textStyleSrc, value: textStyle"></select>

            <hr>
            <label >Text size:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textSizeSrc, value: textSize"></select>
        </div>
        <div class="form-group">
            <button class="btn btn-default" id="btnOK">OK</button>
            <button class="btn btn-default">Cancel</button>
        </div>
    </div>
</script>

<script id="link-configuration-menu" type="text/x-kendoui-template">
    <div role="form" style="width: 750px">
        <h1>Link</h1>
        <div class="form-group">
            <label>ID (Unigue):</label>
            <input type="text" data-bind="value: uniqueId" class="form-control"  >

            <label for="swe-text">Text(Swedish):</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn">Language</button>

            <hr>

            <label>Tooltip</label>
            <input type="text" data-bind="value: toolTips" class="form-control">
        </div>
        <div class="form-group">
            <label>Label width</label>
            <input type="text" data-bind="value: labelWidth" class="form-control" >

            <div class="form-group">
                <hr>
                <label>Label positioning</label>
                <select data-role="dropdownlist"
                        data-text-field="name"
                        data-value-field="value"
                        data-bind="source: labelPositionSrc, value: labelPosition"></select>
            </div>
            <hr>
            <label>Text style:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textStyleSrc, value: textStyle"></select>
            <hr>
            <label>Text size:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textSizeSrc, value: textSize"></select>
            <hr>
            <label>Text format</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textFormatSrc, value: textFormat"></select>
            <hr>
            <label>Component width</label>
            <input type="text" data-bind="value: componentWidth" class="form-control">

            <label>URL:</label>
            <input type="text" data-bind="value: url" class="form-control">
        </div>
        <div class="form-group">
            <button class="btn btn-default" id="btnOK" >OK</button>
            <button class="btn btn-default">Cancel</button>
        </div>
    </div>
</script>



<script id="input-configuration-menu" type="text/x-kendoui-template">
    <div style="width: 750px">
        <h1>Input</h1>
        <div class="form-group">
            <label for="uniqeu-id">ID (Unigue):</label>
            <input type="text" data-bind="value: uniqueId"  class="form-control">

            <label for="swe-text">Text(Swedish):</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn">Language</button>

            <hr>

            <label for="tooltip">Tooltip:</label>
            <input type="text" data-bind="value: toolTips" class="form-control">
            <button id="tooltipBtn" >Language</button>

        </div>
        <div class="form-group">
            <label for="uniqeu-id">Label width:</label>
            <input type="text" data-bind="value:  labelWidth" class="form-control">

            <hr>
            <label for="labelPositioning">Label Positioning:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: labelPositionSrc, value: labelPosition"></select>

            <label for="textStyle">Text style:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textStyleSrc, value: textStyle"></select>
            <hr>

            <label for="textSize">Text Size:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textSizeSrc, value: textSize"></select>

            <label for="textFormat">Text format:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textFormatSrc, value: textFormat"></select>
            <hr>
        </div>
        <div class="form-group">
            <label><input id="mandatoryInfo" class="input_cbox" type="checkbox" value="Apple"  />Mandatory Info</label>
            <label><input id="personNumber" class="input_cbox"  type="checkbox" value="Banana"  />Person Number</label>
        </div>
        <hr>
        <div class="form-group">
            <label for="componentHeight">Component Height:</label>
            <input type="text" data-bind="value: componentHeight" class="form-control">

            <label for="componentWidth">Component Width:</label>
            <input type="text" data-bind="value: componentWidth" class="form-control">

            <label for="in_mappingDefValue">In-mapping default value:</label>
            <input type="text" data-bind="value: in_mappingDefValue" class="form-control">

            <hr>

            <label for="from_mappingFiel">From-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: from_mappingFielSrc, value: from_mappingFiel"></select>

            <label for="to_mappingField">To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: to_mappingFieldSrc, value: to_mappingField"></select>

            <hr>

            <label for="printOrder">Print order:</label>
            <input type="text" data-bind="value: printOrder" class="form-control">

            <label for="inputLength">input Length:</label>
            <input type="text" data-bind="value: inputLength" class="form-control">
        </div>
        <div class="form-group">
            <hr>
            <label><input id="printOnApprovalMail" class="input_cbox" type="checkbox" />Print on approval mail</label>
            <label><input id="printOnOrderMail" class="input_cbox"  type="checkbox" />Print on order mail</label>

            <label><input id="readOnly" class="input_cbox" type="checkbox" />Read-only</label>
            <label><input id="doNotShow" class="input_cbox"  type="checkbox" />Do not show</label>

            <label><input id="keepAfterAdding" class="input_cbox" type="checkbox" />Keep after adding</label>
            <hr>
        </div>
        <div class="form-group">
            <button class="btn btn-default" id="btnOK" >OK</button>
            <button class="btn btn-default">Cancel</button>
        </div>
    </div>
</script>

<script id="combobox-configuration-menu" type="text/x-kendoui-template">
    <div style="width: 750px">
        <h1>Combobox</h1>

        <div class="form-group">
            <label for="uniqeu-id">ID (Unigue):</label>
            <input type="text" data-bind="value: uniqueId"  class="form-control">
            <label for="swe-text">Text(Swedish):</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn" >Language</button>
            <hr>
            <label for="tooltip">Tooltip:</label>
            <input type="text" data-bind="value: toolTips" class="form-control">
            <button id="tooltipBtn" >Language</button>
        </div>
        <div class="form-group">
            <label for="uniqeu-id">Label width:</label>
            <input type="text" data-bind="value:  labelWidth" class="form-control">
            <hr>
            <label for="labelPositioning">Label Positioning:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: labelPositionSrc, value: labelPosition"></select>
            <label for="textStyle">Text style:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textStyleSrc, value: textStyle"></select>
            <hr>
            <label for="textSize">Text Size:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textSizeSrc, value: textSize"></select>
            <label for="textFormat">Text format:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textFormatSrc, value: textFormat"></select>
            <hr>
        </div>
        <div class="form-group">
            <label><input id="mandatoryInfo" class="input_cbox" type="checkbox" value="Apple"  />Mandatory Info</label>
            <label><input id="personNumber" class="input_cbox"  type="checkbox" value="Banana"  />Person Number</label>
        </div>
        <hr>
        <div class="form-group">
            <label for="componentHeight">Component Height:</label>
            <input type="text" data-bind="value: componentHeight" class="form-control">
            <label for="componentWidth">Component Width:</label>
            <input type="text" data-bind="value: componentWidth" class="form-control">
            <label for="in_mappingDefValue">In-mapping default value:</label>
            <input type="text" data-bind="value: in_mappingDefValue" class="form-control">
            <hr>
            <label for="from_mappingFiel">From-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: from_mappingFielSrc, value: from_mappingFiel"></select>
            <label for="to_mappingField">To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: to_mappingFieldSrc, value: to_mappingField"></select>
            <hr>
            <label for="printOrder">Print order:</label>
            <input type="text" data-bind="value: printOrder" class="form-control">
            <label for="inputLength">input Length:</label>
            <input type="text" data-bind="value: inputLength" class="form-control">
        </div>
        <div class="form-group">
            <hr>
            <label><input id="printOnApprovalMail" class="input_cbox" type="checkbox" />Print on approval mail</label>
            <label><input id="printOnOrderMail" class="input_cbox"  type="checkbox" />Print on order mail</label>
            <label><input id="readOnly" class="input_cbox" type="checkbox" />Read-only</label>
            <label><input id="doNotShow" class="input_cbox"  type="checkbox" />Do not show</label>
            <label><input id="keepAfterAdding" class="input_cbox" type="checkbox" />Keep after adding</label>
            <hr>
            <button class="btn btn-primary" id="optionBtn" >Add Option</button>
        </div>
        <div class="form-group">
            <button class="btn btn-default" id="btnOK" >OK</button>
            <button class="btn btn-default">Cancel</button>
        </div>
    </div>
</script>

<script id="linkbutton-configuration-menu" type="text/x-kendoui-template">
    <h1>LinkButton</h1>
    <div class="row">
        <div class="col-md-4">
            <label>ID(Unique)</label>
            <input type="text" data-bind="value: uniqueId" class="form-control">

            <label>Text(Swedish)</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn">Language</button>

            <hr>

            <label>Tooltip</label>
            <input type="text" data-bind="value: toolTips" class="form-control">

            <label>URL</label>
            <input type="text" data-bind="value: url" class="form-control">

            <hr>

            <div class="form-group">
                <button class="btn btn-default" id="btnOK" >OK</button>
                <button class="btn btn-default">Cancel</button>
            </div>
        </div>
    </div>
</script>

<script id="image-configuration-menu" type="text/x-kendoui-template">
    <h1>Image</h1>
    <div class="row">
        <div class="col-md-4">
            <label>ID(Unique)</label>
            <input type="text" data-bind="value: uniqueId" class="form-control">

            <label>Text(Swedish)</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn">Language</button>

            <hr>

            <label>Tooltip</label>
            <input type="text" data-bind="value: toolTips" class="form-control">

            <label>URL</label>
            <input type="text" data-bind="value: url" class="form-control">

            <label>Component Height</label>
            <input type="text" data-bind="value: componentHeight" class="form-control">

            <label>Component Width</label>
            <input type="text" data-bind="value: componentWidth" class="form-control">

            <hr>

            <label>Image Resize options:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: imageResizeSrc, value: imageResize"></select>

            <hr>

            <div class="form-group">
                <button class="btn btn-default" id="btnOK" >OK</button>
                <button class="btn btn-default">Cancel</button>
            </div>
        </div>
    </div>
</script>

<script id="calc-configuration-menu" type="text/x-kendoui-template">
    <div role="form" style="width: 750px">
        <h1>Text</h1>
        <div class="form-group">
            <label >ID (Unigue):</label>
            <input type="text" data-bind="value: uniqueId" class="form-control"  >

            <label for="swe-text">Text(Swedish):</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn">Language</button>
        </div>
        <div class="form-group">
            <label> Mapping Operation</label>
            <textarea  type="text" data-bind="value: mappingOperation" class="form-control" ></textarea>

            <hr>
            <label for="to_mappingField">To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: to_mappingFieldSrc, value: to_mappingField"></select>
            <hr>
            <label for="printOrder">Print order:</label>
            <input type="text" data-bind="value: printOrder" class="form-control">
            <label><input id="printOnApprovalMail" class="input_cbox" type="checkbox" />Print on approval mail</label>
            <label><input id="printOnOrderMail" class="input_cbox"  type="checkbox" />Print on order mail</label>
        </div>
        <div class="form-group">
            <button class="btn btn-default" id="btnOK">OK</button>
            <button class="btn btn-default">Cancel</button>
        </div>
    </div>
</script>

<script id="supp-configuration-menu" type="text/x-kendoui-template">
    <div style="width: 750px">
        <h1>Input</h1>
        <div class="form-group">
            <label for="uniqeu-id">ID (Unigue):</label>
            <input type="text" data-bind="value: uniqueId"  class="form-control">

            <label for="swe-text">Text(Swedish):</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn">Language</button>

            <hr>

            <label for="tooltip">Tooltip:</label>
            <input type="text" data-bind="value: toolTips" class="form-control">
            <button id="tooltipBtn" >Language</button>

        </div>
        <div class="form-group">
            <label for="uniqeu-id">Label width:</label>
            <input type="text" data-bind="value:  labelWidth" class="form-control">

            <hr>
            <label for="labelPositioning">Label Positioning:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: labelPositionSrc, value: labelPosition"></select>

            <label for="textStyle">Text style:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textStyleSrc, value: textStyle"></select>
            <hr>

            <label for="textSize">Text Size:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textSizeSrc, value: textSize"></select>

            <label for="textFormat">Text format:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textFormatSrc, value: textFormat"></select>
            <hr>
        </div>
        <div class="form-group">
            <label><input id="mandatoryInfo" class="input_cbox" type="checkbox" value="Apple"  />Mandatory Info</label>
            <label><input id="personNumber" class="input_cbox"  type="checkbox" value="Banana"  />Person Number</label>
        </div>
        <hr>
        <div class="form-group">
            <label for="componentHeight">Component Height:</label>
            <input type="text" data-bind="value: componentHeight" class="form-control">

            <label for="componentWidth">Component Width:</label>
            <input type="text" data-bind="value: componentWidth" class="form-control">

            <label for="in_mappingDefValue">In-mapping default value:</label>
            <input type="text" data-bind="value: in_mappingDefValue" class="form-control">

            <hr>

            <label for="from_mappingFiel">From-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: from_mappingFielSrc, value: from_mappingFiel"></select>

            <label for="to_mappingField">To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: to_mappingFieldSrc, value: to_mappingField"></select>

            <hr>

            <label for="printOrder">Print order:</label>
            <input type="text" data-bind="value: printOrder" class="form-control">

            <label for="inputLength">input Length:</label>
            <input type="text" data-bind="value: inputLength" class="form-control">
        </div>
        <div class="form-group">
            <hr>
            <label><input id="printOnApprovalMail" class="input_cbox" type="checkbox" />Print on approval mail</label>
            <label><input id="printOnOrderMail" class="input_cbox"  type="checkbox" />Print on order mail</label>

            <label><input id="readOnly" class="input_cbox" type="checkbox" />Read-only</label>
            <label><input id="doNotShow" class="input_cbox"  type="checkbox" />Do not show</label>

            <label><input id="keepAfterAdding" class="input_cbox" type="checkbox" />Keep after adding</label>
            <hr>
        </div>
        <div class="form-group">
            <button class="btn btn-default" id="btnOK" >OK</button>
            <button class="btn btn-default">Cancel</button>
        </div>
    </div>
</script>

<script id="checkbox-configuration-menu" type="text/x-kendo-template">
    <div style="width: 750px">
        <h1>Input</h1>
        <div class="form-group">

            <label>ID (Unigue):</label>
            <input type="text" data-bind="value: uniqueId"  class="form-control">

            <label>Text(Swedish):</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn">Language</button>

            <hr>

            <label>Tooltip:</label>
            <input type="text" data-bind="value: toolTips" class="form-control">
            <button id="tooltipBtn" >Language</button>

        </div>
        <div class="form-group">
            <label>Label width:</label>
            <input type="text" data-bind="value:  labelWidth" class="form-control">

            <hr>
            <label>Label Positioning:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: labelPositionSrc, value: labelPosition"></select>

            <label>Text style:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textStyleSrc, value: textStyle"></select>
            <hr>

            <label>Text Size:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textSizeSrc, value: textSize"></select>

            <label>Text format:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textFormatSrc, value: textFormat"></select>

            <hr>
        </div>
        <div class="form-group">
            <label><input id="mandatoryInfo" class="input_cbox" type="checkbox" value="Apple"  />Mandatory Info</label>
            <label><input id="personNumber" class="input_cbox"  type="checkbox" value="Banana"  />Person Number</label>
        </div>
        <hr>
        <div class="form-group">
            <label>Component Height:</label>
            <input type="text" data-bind="value: componentHeight" class="form-control">

            <label>Component Width:</label>
            <input type="text" data-bind="value: componentWidth" class="form-control">

            <label>In-mapping default value:</label>
            <input type="text" data-bind="value: in_mappingDefValue" class="form-control">

            <hr>

            <label>From-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: from_mappingFielSrc, value: from_mappingFiel"></select>

            <label>To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: to_mappingFieldSrc, value: to_mappingField"></select>

            <hr>

            <label>Print order:</label>
            <input type="text" data-bind="value: printOrder" class="form-control">

            <label>input Length:</label>
            <input type="text" data-bind="value: inputLength" class="form-control">
        </div>
        <div class="form-group">
            <hr>
            <label><input id="printOnApprovalMail" class="input_cbox" type="checkbox" />Print on approval mail</label>
            <label><input id="printOnOrderMail" class="input_cbox"  type="checkbox" />Print on order mail</label>

            <label><input id="readOnly" class="input_cbox" type="checkbox" />Read-only</label>
            <label><input id="doNotShow" class="input_cbox"  type="checkbox" />Do not show</label>

            <label><input id="keepAfterAdding" class="input_cbox" type="checkbox" />Keep after adding</label>
            <hr>
            <button class="btn btn-primary" id="optionBtn" >Add Option</button>
            <hr>
            Checked: <input id="checked" class="input_cbox" type="checkbox" data-bind="checked: checked">
            <hr>

        </div>

        <div class="form-group">
            <button class="btn btn-default" id="btnOK" >OK</button>
            <button class="btn btn-default">Cancel</button>
        </div>
    </div>
</script>



<script id="radio-configuration-menu" type="text/x-kendoui-template">
    <div style="width: 750px">
        <h1>Radio</h1>

        <div class="form-group">
            <label for="uniqeu-id">ID (Unigue):</label>
            <input type="text" data-bind="value: uniqueId"  class="form-control">
            <label for="swe-text">Text(Swedish):</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn" >Language</button>
            <hr>
            <label for="group">Group:</label>
            <input type="text" data-bind="value: group" class="form-control">
            <label for="tooltip">Tooltip:</label>
            <input type="text" data-bind="value: toolTips" class="form-control">
            <button id="tooltipBtn" >Language</button>
        </div>
        <div class="form-group">
            <label for="uniqeu-id">Label width:</label>
            <input type="text" data-bind="value:  labelWidth" class="form-control">
            <hr>
            <label for="labelPositioning">Label Positioning:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: labelPositionSrc, value: labelPosition"></select>
            <label for="textStyle">Text style:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textStyleSrc, value: textStyle"></select>
            <hr>
            <label for="textSize">Text Size:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textSizeSrc, value: textSize"></select>
            <label for="textFormat">Text format:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textFormatSrc, value: textFormat"></select>
            <hr>
        </div>
        <div class="form-group">
            <label><input id="mandatoryInfo" class="input_cbox" type="checkbox" value="Apple"  />Mandatory Info</label>
            <label><input id="personNumber" class="input_cbox"  type="checkbox" value="Banana"  />Person Number</label>
        </div>
        <hr>
        <div class="form-group">
            <label for="componentHeight">Component Height:</label>
            <input type="text" data-bind="value: componentHeight" class="form-control">
            <label for="componentWidth">Component Width:</label>
            <input type="text" data-bind="value: componentWidth" class="form-control">
            <label for="in_mappingDefValue">In-mapping default value:</label>
            <input type="text" data-bind="value: in_mappingDefValue" class="form-control">
            <hr>
            <label for="from_mappingFiel">From-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: from_mappingFielSrc, value: from_mappingFiel"></select>
            <label for="to_mappingField">To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: to_mappingFieldSrc, value: to_mappingField"></select>
            <hr>
            <label for="printOrder">Print order:</label>
            <input type="text" data-bind="value: printOrder" class="form-control">
            <label for="inputLength">input Length:</label>
            <input type="text" data-bind="value: inputLength" class="form-control">
        </div>
        <div class="form-group">
            <hr>
            <label><input id="printOnApprovalMail" class="input_cbox" type="checkbox" />Print on approval mail</label>
            <label><input id="printOnOrderMail" class="input_cbox"  type="checkbox" />Print on order mail</label>
            <label><input id="readOnly" class="input_cbox" type="checkbox" />Read-only</label>
            <label><input id="doNotShow" class="input_cbox"  type="checkbox" />Do not show</label>
            <label><input id="keepAfterAdding" class="input_cbox" type="checkbox" />Keep after adding</label>
            <hr>
            <button class="btn btn-primary" id="optionBtn" >Add Option</button>
        </div>
        <div class="form-group">
            <button class="btn btn-default" id="btnOK" >OK</button>
            <button class="btn btn-default">Cancel</button>
        </div>
    </div>
</script>

<script id="textarea-configuration-menu" type="text/x-kendoui-template">
    <div style="width: 750px">
        <h1>Textarea</h1>
        <div class="form-group">
            <label>ID (Unigue):</label>
            <input type="text" data-bind="value: uniqeuId"  class="form-control">

            <label>Text(Swedish):</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn">Language</button>

            <hr>

            <label>Tooltip:</label>
            <input type="text" data-bind="value: toolTips" class="form-control">
            <button id="tooltipBtn" >Language</button>

        </div>
        <div class="form-group">
            <label>Label width:</label>
            <input type="text" data-bind="value:  labelWidth" class="form-control">

            <hr>
            <label>Label Positioning:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: labelPositionSrc, value: labelPosition"></select>

            <label>Text style:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textStyleSrc, value: textStyle"></select>
            <hr>

            <label>Text Size:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textSizeSrc, value: textSize"></select>

            <hr>
        </div>
        <div class="form-group">
            <label><input id="mandatoryInfo" class="input_cbox" type="checkbox" value="Apple"  />Mandatory Info</label>
        </div>
        <hr>
        <div class="form-group">
            <label>Component Height:</label>
            <input type="text" data-bind="value: componentHeight" class="form-control">

            <label>Component Width:</label>
            <input type="text" data-bind="value: componentWidth" class="form-control">

            <label>In-mapping default value:</label>
            <input type="text" data-bind="value: in_mappingDefValue" class="form-control">

            <hr>

            <label>From-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: from_mappingFielSrc, value: from_mappingFiel"></select>

            <label>To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: to_mappingFieldSrc, value: to_mappingField"></select>

            <hr>

            <label>Print order:</label>
            <input type="text" data-bind="value: printOrder" class="form-control">

            <label>input Length:</label>
            <input type="text" data-bind="value: inputLength" class="form-control">
        </div>
        <div class="form-group">
            <hr>
            <label><input id="printOnApprovalMail" class="input_cbox" type="checkbox" />Print on approval mail</label>
            <label><input id="printOnOrderMail" class="input_cbox"  type="checkbox" />Print on order mail</label>

            <label><input id="readOnly" class="input_cbox" type="checkbox" />Read-only</label>
            <label><input id="doNotShow" class="input_cbox"  type="checkbox" />Do not show</label>

            <label><input id="keepAfterAdding" class="input_cbox" type="checkbox" />Keep after adding</label>
            <hr>
        </div>
        <div class="form-group">
            <button class="btn btn-default" id="btnOK" >OK</button>
            <button class="btn btn-default">Cancel</button>
        </div>
    </div>
</script>

<script id="datecomp-configuration-menu" type="text/x-kendoui-template">
    <div style="width: 750px">
        <h1>DateComp</h1>
        <div class="form-group">
            <label>ID (Unigue):</label>
            <input type="text" data-bind="value: uniqeuId"  class="form-control">

            <label>Text(Swedish):</label>
            <input type="text" data-bind="value: label" class="form-control">
            <button id="swe-textBtn">Language</button>

            <hr>

            <label>Tooltip:</label>
            <input type="text" data-bind="value: toolTips" class="form-control">
            <button id="tooltipBtn" >Language</button>

        </div>
        <div class="form-group">
            <label>Label width:</label>
            <input type="text" data-bind="value:  labelWidth" class="form-control">

            <hr>
            <label>Label Positioning:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: labelPositionSrc, value: labelPosition"></select>

            <label>Text style:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textStyleSrc, value: textStyle"></select>
            <hr>

            <label>Text Size:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textSizeSrc, value: textSize"></select>

            <label>Text format:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: textFormatSrc, value: textFormat"></select>

            <hr>
        </div>
        <div class="form-group">
            <label><input id="mandatoryInfo" class="input_cbox" type="checkbox" value="Apple"  />Mandatory Info</label>
        </div>
        <hr>
        <div class="form-group">

            <label>Component Width:</label>
            <input type="text" data-bind="value: componentWidth" class="form-control">

            <label>In-mapping default value:</label>
            <input type="text" data-bind="value: in_mappingDefValue" class="form-control">

            <hr>

            <label>From-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: from_mappingFielSrc, value: from_mappingFiel"></select>

            <label>To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: to_mappingFieldSrc, value: to_mappingField"></select>

            <hr>

            <label>Print order:</label>
            <input type="text" data-bind="value: printOrder" class="form-control">
        </div>
        <div class="form-group">
            <hr>
            <label><input id="printOnApprovalMail" class="input_cbox" type="checkbox" />Print on approval mail</label>
            <label><input id="printOnOrderMail" class="input_cbox"  type="checkbox" />Print on order mail</label>

            <label><input id="keepAfterAdding" class="input_cbox" type="checkbox" />Keep after adding</label>
            <hr>
        </div>
        <div class="form-group">
            <button class="btn btn-default" id="btnOK" >OK</button>
            <button class="btn btn-default">Cancel</button>
        </div>
    </div>
</script>


<script id="label-language-template" type="text/x-kendoui-template">
    <div class="row">
        <div class="col-md-8">
            <h3>add language phrase</h3>
        </div>
        <div class="col-md-4">
            <label>Language:<input id="language"  data-bind="value:newLanguage.language" class="form-control"></label>
        </div>
        <div class="col-md-4">
            <label>Phrase:<input id="phrase" data-bind="value:newLanguage.phrase" class="form-control"></label>
        </div>
        <div class="col-md-8">
            <button id="addLabel"  class="k-button">add</button>
            <button id="cancelLabel" class="btn btn-default">Cancel</button>
            <hr>
            <div id="languageList">
                <ul>

                </ul>
            </div>

        </div>
    </div>
</script>

<script id="label-options-template" type="text/x-kendoui-template">
    <h3>add options</h3>
    <div class="row">
        <div class="col-md-4">

            <label>Text(default)</label>
            <input type="text" data-bind="value: newOption.text" class="form-control">

            <label>Value(mapping)</label>
            <input type="text" data-bind="value: newOption.value" class="form-control">

            <label>Return value(default)</label>
            <input type="text" data-bind="value: newOption.returnValue" class="form-control">

            <label>Num.Value(mapping)</label>
            <input type="text" data-bind="value: newOption.numValue" class="form-control">

            <label>Txt value(mapping)</label>
            <input type="text" data-bind="value: newOption.txtValue" class="form-control">

            <label>Default</label>
            <input type="checkbox" data-bind="checked: newOption._default">

            <label>Invalid</label>
            <input type="checkbox" data-bind="checked: newOption.invalid">

        </div>

        <div class="col-md-4">
            <label>English</label>
            <input type="text" data-bind="value: newOption.english" class="form-control">

            <label>Finnish</label>
            <input type="text" data-bind="value: newOption.finnish" class="form-control">

            <label>Norwegian</label>
            <input type="text" data-bind="value: newOption.norwegian" class="form-control">

            <label>German</label>
            <input type="text" data-bind="value: newOption.german" class="form-control">

            <label>Danish</label>
            <input type="text" data-bind="value: newOption.danish" class="form-control">

            <label>Polish</label>
            <input type="text" data-bind="value: newOption.polish" class="form-control">

        </div>

        <div class="col-md-6">
            <hr>
            <div id="optionList">
                <ul>

                </ul>
            </div>
        </div>


    </div>
    <button id="addOption"  class="k-button">add</button>
    <button id="cancelOption" class="btn btn-default">Cancel</button>
</script>
</body>
</html>
