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

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/jquery-ui-1.10.4.custom.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/jquery.appendGrid-1.3.1.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/jquery.contextMenu.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/kendo.common.min.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/kendo.default.min.css" />

    <title>Drag & Drop</title>
</head>

<style>

    #sortableList { list-style-type: none; margin: 0; padding: 0; width: 100%; }
    #sortableList li { margin: 0 3px 0px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.0em;}
    #sortableList li span { position: absolute; margin-left: -1.3em; }
    .dropTrue { list-style-type: none; margin: 0; padding: 0; float: left; margin-right: 10px; background: #eee; padding: 5px; width: 143px; height: 380px; }

</style>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" onclick="false"><img src="../../res/styles/images/visma.png" width="150" height="30"></a>
            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown">
                    <a id="getBtn" href="#" class="dropdown-toggle" data-toggle="dropdown">Load Forms <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <div id="savedForms">
                            <div id="formList"></div>
                        </div>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">

<h1>Form Builder</h1>
<hr>
<div class="row">
    <div class="col-md-3">

        <div id="text" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <p style="pointer-events: none" data-bind='text: label'>Text</p>
        </div>

        <div id="link" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <a href="#" onclick="false" data-bind='text: label'>Link text</a>
        </div>

        <div id="image" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <p style="pointer-events: none;" data-bind='text: label'>Image</p>
        </div>

        <div id="textarea" class="draggable ui-widget-content" style="width: 170px; height: 60px; padding: 0.5em; resize: none; z-index: 10">
            <label data-bind='text: label'></label><textarea style="pointer-events: none"></textarea>
        </div>

        <div id="input" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <label data-bind='text: label'></label><input style="pointer-events: none" type="text">
        </div>

        <div id="datecomp" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <label data-bind='text: label'></label><input class="datecomp" style="pointer-events: none" type="date">
        </div>

        <div id="combobox" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <label data-bind='text: label'></label><select style="pointer-events: none" >
            <option value="option">options...</option>
        </select>
        </div>

        <div id="linkbutton" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <button style="pointer-events: none" data-bind='text: label'><a href="#" onclick="false"></a>Link Button</button>
        </div>

        <div id="radio" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <label data-bind='text: label'>Radio Button</label><input style="pointer-events: none" type="radio" name="group" value="option">
        </div>

        <div id="checkbox" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <label data-bind='text: label'>Checkbox</label><input style="pointer-events: none" type="checkbox" name="option" value="option">
        </div>

        <div id="calculationfield" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <p style="pointer-events: none;" data-bind='text: label'>Calculation field</p>
        </div>

        <div id="suppcelector" class="draggable ui-widget-content" style="width: 170px; height: 60px; padding: 0.5em;  z-index: 10">
            <label data-bind='text: label'></label><input type="text" style="pointer-events: none"><button>select</button> <button>clear</button>
        </div>

        <div id="emptystrut" class="draggable ui-widget-content" style="width: 170px; height: 45px; padding: 0.5em;  z-index: 10">
            <br>
            <br>
        </div>
    </div>

    <%------------------%>
    <%--Droppable area--%>
    <%------------------%>

    <div class="col-md-6">

        <div id="droppableArea" class="ui-widget-header"
             style="width: 740px; height: 500px; padding: 0.5em; margin: 10px;">
            <div class="row">
                <div id="firstColumn" class="col-md-6">
                    <ul id="sortableList" class="dropTrue"></ul>
                </div>
                <div id="secondColumn" class="col-md-6">
                    <ul id="sortableList" class="dropTrue"></ul>
                </div>
            </div>
        </div>


        <button id="saveBtn" class="btn default-btn">Save</button>
        <button id="updateBtn" class="btn default-btn">Update</button>
        <button id="previewBtn" class="btn default-btn">Preview</button>
    </div>
</div>

<%------------------%>
<%---Kendo windows--%>
<%------------------%>

<div id="window" style="display: none"> </div>
<div id="previewWindow" style="display: none">

    <h2>Form</h2>
    <form action="" method="post">
        <div class="row">
            <div class="formComponents col-md-4">
                <div id="columnFirst"></div>
            </div>
            <div class="formComponents col-md-4">
                <div id="columnSecond"></div>
            </div>
            <div class="col-md-8">
                <hr>
                <button id="preSubmit" onclick="false" >Submit</button>
                <button id="preCancel" onclick="false" >Cancel</button>
            </div>
        </div>

    </form>
</div>

<div id="labelGrid" style="display: none"> </div>
<div id="optionGrid" style="display: none"> </div>
<div id="gridWindow" style="display: none">
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label>ID(unique) *</label>  <input data-bind="value: uniqueId"  type="text" class="forced-right">
            </div>

            <div class="form-group">
                <label>Label name(Swedish) *</label>   <input type="text" data-bind="value: label " class="forced-right"><button class="forced-right" >Languages</button>
            </div>

            <div class="form-group">
                <label>Tooltip </label>  <input type="text" data-bind="value: toolTips" class="forced-right"><button class="forced-right" >Languages</button>
            </div>

            <div class="form-group">
                <label>Label width *</label> <input type="text" data-bind="value:  labelWidth" class="forced-right">
            </div>

            <div class="form-group ">
                <label>Label positioning </label> <div class="forced-right"><select data-role="dropdownlist"
                                                                                    data-text-field="name"
                                                                                    data-value-field="value"
                                                                                    data-bind="source: labelPositionSrc, value: labelPosition"></select></div>
                <%--<select>--%>
                <%--<option value="vertical">Vertical</option>--%>
                <%--<option value="horizontal">Horizontal</option>--%>
                <%--</select>--%>
            </div>


            <div class="form-group">
                <label>Text style </label> <div class="forced-right"><select data-role="dropdownlist"
                                                                             data-text-field="name"
                                                                             data-value-field="value"
                                                                             data-bind="source: textStyleSrc, value: textStyle"></select></div>
                <%--<select>--%>
                <%--<option value="bold">Bold</option>--%>
                <%--<option value="normal">Normal</option>--%>
                <%--<option value="italic">Italic</option>--%>
                <%--</select>--%>
            </div>

            <div class="form-group">
                <label>Text size </label> <div class="forced-right"><select data-role="dropdownlist"
                                                                            data-text-field="name"
                                                                            data-value-field="value"
                                                                            data-bind="source: textSizeSrc, value: textSize"></select></div>

                <%--<select>--%>
                <%--<option value="12">12</option>--%>
                <%--<option value="14">14</option>--%>
                <%--<option value="18">18</option>--%>
                <%--</select>--%>
            </div>

            <div class="form-group">
                <label>Text format </label> <div class="forced-right"><select data-role="dropdownlist"
                                                                              data-text-field="name"
                                                                              data-value-field="value"
                                                                              data-bind="source: textFormatSrc, value: textFormat"></select></div>

                <%--<select>--%>
                <%--<option value="chars">Chars</option>--%>
                <%--<option value="numbers">Numbers</option>--%>
                <%--<option value="timeformat">Time format</option>--%>
                <%--<option value="dateformat">Date format</option>--%>
                <%--<option value="emailformat">Email format</option>--%>
                <%--</select>--%>
            </div>

            <div class="form-group">
                <label>Mandatory information </label><input id="mandatoryInfo" type="checkbox" class="input_cbox forced-right" >
            </div>


        </div>

        <div  class="col-md-4">
            <div class="form-group">
                <label>Component height *</label> <input type="text" data-bind="value: componentHeight" class="forced-right">
            </div>

            <div class="form-group">
                <label>Component width *</label> <input type="text" data-bind="value: componentWidth" class="forced-right">
            </div>

            <div class="form-group">
                <label>In-mapping default value </label> <input type="text" data-bind="value: inMappingDefValue" class="forced-right">
            </div>

            <div class="form-group">
                <label>From-mapping field </label> <div class="forced-right"><select data-role="dropdownlist"
                                                                                     data-text-field="name"
                                                                                     data-value-field="value"
                                                                                     data-bind="source: fromMappingFieldSrc, value: fromMappingField"></select></div>

                <%--<select>--%>
                <%--<option value="chars">Chars</option>--%>
                <%--<option value="numbers">Numbers</option>--%>
                <%--<option value="timeformat">Time format</option>--%>
                <%--<option value="dateformat">Date format</option>--%>
                <%--<option value="emailformat">Email format</option>--%>
                <%--</select>--%>
            </div>

            <div class="form-group">
                <label>To-mapping field </label> <div class="forced-right"><select data-role="dropdownlist"
                                                                                   data-text-field="name"
                                                                                   data-value-field="value"
                                                                                   data-bind="source: toMappingFieldSrc, value: toMappingField"></select></div>
                <%--<select>--%>
                <%--<option value="chars">Chars</option>--%>
                <%--<option value="numbers">Numbers</option>--%>
                <%--<option value="timeformat">Time format</option>--%>
                <%--<option value="dateformat">Date format</option>--%>
                <%--<option value="emailformat">Email format</option>--%>
                <%--</select>--%>
            </div>

            <div class="form-group">
                <label>Print order </label> <input type="text" data-bind="value: printOrder">
            </div>

            <div class="form-group">
                <label>Print on approval mail </label><input id="printOnApprovalMail" type="checkbox" class="input_cbox forced-right" >
            </div>

            <div class="form-group">
                <label>Print on order mail </label><input id="printOnOrderMail" type="checkbox" class="input_cbox forced-right" >
            </div>

            <div class="form-group">
                <label>Keep after adding </label><input id="keepAfterAdding" type="checkbox" class="input_cbox forced-right" >
            </div>

        </div>

    </div>

    <div id="grid"></div>

    <div class="col-md-8 window-footer ">
        <div class="form-group">
            <p>NOTE! Important information when adding languages. (Place the mouse pointer here)</p>
            <p>* Mandatory information</p>
        </div>
        <div class="form-group forced-right">
            <button id="btnOK" >OK</button>
            <button id="gridCancelBtn">Cancel</button>
        </div>

    </div>

</div>
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
    var column = null;
    var fromToMappingFieldSrc = [
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

    var previewForm = [];

    $('#previewBtn').attr("disabled", true);
    $('#updateBtn').attr("disabled", true);

    Array.prototype.move = function (old_index, new_index) {
        if (new_index >= this.length) {
            var k = new_index - this.length;
            while ((k--) + 1) {
                this.push(undefined);
            }
        }
        this.splice(new_index, 0, this.splice(old_index, 1)[0]);
        return this; // for testing purposes
    };


    /****************************************************/
    /*************Right click functionality**************/
    /****************************************************/

    $(function(){
        $.contextMenu({
            selector: '.ui-state-default',
            callback: function(key, options) {
                if(key == "delete"){
                    deleteComponent(this);
                }else{
                    var m = "clicked: " + key;
                    window.console && console.log(m) || alert(m);
                }
            },
            items: {
                "edit": {name: "Edit", icon: "edit"},
                "copy": {name: "Copy", icon: "copy"},
                "cut": {name: "Cut", icon: "cut"},
                "delete": {name: "Delete", icon: "delete"}
            }
        });
    });

    function deleteComponent(component){

        var componentId = $(component).attr("id");
        $.each(form, function(i, data){
            if(form[i].uniqueId == componentId){
                form.splice(i, 1);
            }
        });
        $(component).remove();
    }


    /****************************************************/
    /*******************Drag & drop**********************/
    /****************************************************/

    $(".draggable").draggable({
        revert: "invalid",
        scroll: false,
        helper: "clone"
    });

    $("#droppableArea").droppable({
        drop: onDrop
    });

    function onDrop(e, droppedComponent){
        var componentData = returnObservableType(droppedComponent.draggable.attr("id"));

        if(droppedComponent.draggable.hasClass("draggable")){
            $("#sortableList").append( "<li id="+ objectId +" class='ui-state-default'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span>" + droppedComponent.draggable.html() + "</li>");
            form.push(componentData);
            //console.log("Array lenght: " + form.length +" "+ JSON.stringify(form));
            addToPreviewForm(droppedComponent.draggable.html(), componentData.uniqueId);
            $('#previewBtn').attr("disabled", true);
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

            case "emptystrut":
                return createEmptyStrutObservableObject(objectId, type);
                break;
        }
    };

    function createTextObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "text",
            newLanguage:labelLanguagetemplate,
            labelLanguage:[],
            labelWidth: 100,
            textStyle: "Normal",
            textStyleSrc: textStyleSrc,
            type: type,
            textSize: 12,
            textSizeSrc: textSizeSrc,
            viewToCall: "text-configuration-menu",
            column: "firstColumn",
            row: ""
        });
    }

    function createLinkObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "link",
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
            viewToCall: "link-configuration-menu",
            column: "firstColumn",
            row: ""
        });
    }

    function createInputObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "input",
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
            inMappingDefValue: "",
            fromMappingField: "choose..",
            fromMappingFieldSrc: fromToMappingFieldSrc,
            toMappingField: "choose..",
            toMappingFieldSrc: fromToMappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            keepAfterAdding: false,
            viewToCall: "input-configuration-menu",
            column: "firstColumn",
            row: ""
        });
    }

    function createComboboxObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "label",
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
            inMappingDefValue: "",
            fromMappingField: "choose..",
            fromMappingFieldSrc: fromToMappingFieldSrc,
            toMappingField: "choose..",
            toMappingFieldSrc: fromToMappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            keepAfterAdding: false,
            addedOptions: [],
            newOption: optionTemplate,
            viewToCall: "combobox-configuration-menu",
            gridView: true,
            column: "firstColumn",
            row: ""
        });
    }

    function createRadioObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "label",
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
            inMappingDefValue: "",
            fromMappingField: "choose..",
            fromMappingFieldSrc: fromToMappingFieldSrc,
            toMappingField: "choose..",
            toMappingFieldSrc: fromToMappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            group: "default",
            keepAfterAdding: false,
            addedOptions: [],
            newOption: optionTemplate,
            viewToCall: "radio-configuration-menu",
            gridView: true,
            column: "firstColumn",
            row: ""
        });
    }

    function createLinkButtonObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "label",
            newLanguage:labelLanguagetemplate,
            labelLanguage: [],
            toolTips: "A Simple Tooltip",
            url: "http://",
            type: type,
            viewToCall: "linkbutton-configuration-menu",
            column: "firstColumn",
            row: ""
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
            viewToCall: "image-configuration-menu",
            column: "firstColumn",
            row: ""
        });
    }

    function createCalculationfieldObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "label",
            newLanguage:labelLanguagetemplate,
            labelLanguage:[],
            type: type,
            mappingOperation: "",
            toMappingField: "choose..",
            toMappingFieldSrc: fromToMappingFieldSrc,
            printOrder: "Otto",
            printOnApprovalMail: false,
            printOnOrderMail: false,
            viewToCall: "calc-configuration-menu",
            column: "firstColumn",
            row: ""
        });
    }

    function createSuppcelectorObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "label",
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
            componentHeight: 18,
            componentWidth: 150,
            inMappingDefValue: "",
            fromMappingField: "choose..",
            fromMappingFieldSrc: fromToMappingFieldSrc,
            toMappingField: "choose..",
            toMappingFieldSrc: fromToMappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            keepAfterAdding: false,
            viewToCall: "supp-configuration-menu",
            column: "firstColumn",
            row: ""
        });
    }

    function createCheckboxObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "label",
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
            inMappingDefValue: "",
            fromMappingField: "choose..",
            fromMappingFieldSrc: fromToMappingFieldSrc,
            toMappingField: "choose..",
            toMappingFieldSrc: fromToMappingFieldSrc,
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
            viewToCall: "checkbox-configuration-menu",
            gridView: true,
            column: "firstColumn",
            row: ""
        });
    }

    function createTextareaObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "label",
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
            inMappingDefValue: "",
            fromMappingField: "choose..",
            fromMappingFieldSrc: fromToMappingFieldSrc,
            toMappingField: "choose..",
            toMappingFieldSrc: fromToMappingFieldSrc,
            printOrder: "Otto",
            inputLength: 200,
            printOnApprovalMail: false,
            printOnOrderMail: false,
            readOnly: false,
            doNotShow: false,
            keepAfterAdding: false,
            viewToCall: "textarea-configuration-menu",
            column: "firstColumn",
            row: ""
        });
    }

    function createDatecompObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            label: "label",
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
            inMappingDefValue: "",
            fromMappingField: "choose..",
            fromMappingFieldSrc: fromToMappingFieldSrc,
            toMappingField: "choose..",
            toMappingFieldSrc: fromToMappingFieldSrc,
            printOrder: "Otto",
            printOnApprovalMail: false,
            printOnOrderMail: false,
            keepAfterAdding: false,
            viewToCall: "datecomp-configuration-menu",
            column: "firstColumn",
            row: ""
        });
    }


    function createEmptyStrutObservableObject(objectId, type){
        return new kendo.data.ObservableObject({
            uniqueId: objectId,
            type: type,
            column: "firstColumn"
        })
    }

    var formRow = null;
    var fromIndex = null;
    var columnChanged = false;


    $("ul.dropTrue").sortable({
        connectWith: 'ul',
        dropOnEmpty: true,
        revert: true,
        receive: function(event, ui) {
            console.log("receive");

            column = $(this).closest("div").attr("id")
            var observableId = $(ui.item).closest("li").attr("id");
            for (var i = 0; i < form.length; i++) {
                if(form[i].uniqueId == observableId){
                    form[i].set("column", column);
                }
            }
            columnChanged = true;
        },
        start: function(event, ui) {
            console.log("Start component: " + $(ui.item).closest("li").attr("id") +" from index: "+ ui.item.index() + " and column: " + $(this).closest("div").attr("id"));
            var observableId = $(ui.item).closest("li").attr("id");
            fromIndex = ui.item.index();
            for (var i = 0; i < form.length; i++) {
                if(form[i].uniqueId == observableId){
                    formRow = form[i];
                }
            }
        },
        stop: function(event, ui) {
            var toIndex = ui.item.index();
            if(!columnChanged){
                console.log("Stop component: " + $(ui.item).closest("li").attr("id") +" to index: "+ ui.item.index() + " and column: " + $(this).closest("div").attr("id"));

                form.move(fromIndex, toIndex);
            }
            columnChanged = false;
             //console.log("array length: " + JSON.stringify(form));
            // console.log("array length: " + JSON.stringify(form.length));
        }
    });

    Array.prototype.move = function (old_index, new_index) {
        if (new_index >= this.length) {
            var k = new_index - this.length;
            while ((k--) + 1) {
                this.push(undefined);
            }
        }
        this.splice(new_index, 0, this.splice(old_index, 1)[0]);
        return this; // for testing purposes
    };

    $('#sortableList').disableSelection();

    function addToPreviewForm(html, id){
        var data = {
            html: html,
            id: id
        }
        previewForm.push(data);

//        console.log(JSON.stringify(previewForm));
    }

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
            $('#previewBtn').attr("disabled", true);
            $("#droppableArea ul li").remove();
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

    function postPreviewForm(data){
        $.ajax({
            type: 'POST',
            //contentType: 'application/json',
            url: "/previewPost",
            dataType: "json",
            data: {data: data},
            success: function(){
                console.log("u are cool");
            }
        });
    }

    function renderList(data){
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
        $('#formList li').remove();
        $.each(list, function(index, form) {
            $('#formList').append('<li><a class="linkable" id='+ form.form_id +' href="#" onclick="false">'+form.form_id+ " " +form.name+ " "+ form.date+'</a></li>');
        });
    };

    $("#formList").on("click", ".linkable", function(e){
        id = e.target.id;
        form = [];
        previewForm = [];
        optionGridCreated = false;
        languageGridCreated = false;
        $.ajax({
            type: 'GET',
            url: 'getForm' + '/' + id,
            dataType: "json",
            success: renderForm
        });
        $('#saveBtn').attr("disabled", true);
        $('#updateBtn').attr("disabled", false);
        $('#previewBtn').attr("disabled", false);
    });

    function renderForm(data){
        $("#droppableArea ul li").remove();

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
        console.log(formComponentData.type);
        switch (formComponentData.type){
            case "text":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> <div style='pointer-events: none;' >"+ formComponentData.label +" </div></li>");

                var htmlDomComponent = "<div class='form-group'><div id='"+ formComponentData.uniqueId +"' class='form-group' >"+formComponentData.label+"</div></div>";
                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

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
                    viewToCall: formComponentData.viewToCall,
                    column: formComponentData.column,
                    row: formComponentData.row
                });
                form.push(componentData);
                console.log(JSON.stringify(form));
                break;

            case "link":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span><a href='"+ formComponentData.url +"'>"+ formComponentData.label +"</a></li>");

                var htmlDomComponent = "<div class='form-group'><a id='"+ formComponentData.uniqueId +"' href='"+ formComponentData.url +"'>"+ formComponentData.label +"</a></div>";

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);


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
                    viewToCall: formComponentData.viewToCall,
                    column: formComponentData.column,
                    row: formComponentData.row
                });
                form.push(componentData);
                break;

            case "input":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" :   <input id='"+ formComponentData.uniqueId +"' type='text'></input></li>");

                var htmlDomComponent = "<div class='form-group'>"+formComponentData.label+": <input name='"+ formComponentData.uniqueId +"' class='forced-right' type='text'></div>";
                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

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
                    inMappingDefValue: formComponentData.inMappingDefValue,
                    fromMappingField: formComponentData.fromMappingField,
                    fromMappingFieldSrc: fromToMappingFieldSrc,
                    toMappingField: formComponentData.toMappingField,
                    toMappingFieldSrc: fromToMappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    viewToCall: formComponentData.viewToCall,
                    column: formComponentData.column,
                    row: formComponentData.row
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "combobox":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span data-bind='text: label'> "+formComponentData.label+" :   <select id='"+ formComponentData.uniqueId +"'>"+getComboOptions(formComponentData.addedOptions)+"</select></li>");

                var htmlDomComponent = "<div class='form-group'>"+formComponentData.label+" : <select name='"+ formComponentData.uniqueId +"' class='forced-right'>"+getComboOptions(formComponentData.addedOptions)+"</select></div>";

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

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
                    inMappingDefValue: formComponentData.inMappingDefValue,
                    fromMappingField: formComponentData.fromMappingField,
                    fromMappingFieldSrc: fromToMappingFieldSrc,
                    toMappingField: formComponentData.toMappingField,
                    toMappingFieldSrc: fromToMappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    addedOptions: formComponentData.addedOptions,
                    newOption: optionTemplate,
                    viewToCall: formComponentData.viewToCall,
                    gridView: true,
                    column: formComponentData.column,
                    row: formComponentData.row

                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "radio":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span data-bind='text: label'> "+formComponentData.label+" :   <input id='"+ formComponentData.uniqueId +"' name='"+ formComponentData.group +"' type='"+ formComponentData.type +"' > </input></li>");

                var htmlDomComponent = " "+formComponentData.label+" : <div class='form-group'> "+ getRadioOptions(formComponentData.addedOptions, formComponentData.uniqueId) +" </div>";

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

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
                    inMappingDefValue: formComponentData.inMappingDefValue,
                    fromMappingField: formComponentData.fromMappingField,
                    fromMappingFieldSrc: fromToMappingFieldSrc,
                    toMappingField: formComponentData.toMappingField,
                    toMappingFieldSrc: fromToMappingFieldSrc,
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
                    viewToCall: formComponentData.viewToCall,
                    gridView: true,
                    column: formComponentData.column,
                    row: formComponentData.row

                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "linkbutton":
                $('#'+formComponentData.column+' ul').append("<li id=" + formComponentData.uniqueId + " class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span><a href='"+ formComponentData.url+ "'><button>"+ formComponentData.label +"</button></a></li>");

                var htmlDomComponent = "<div class='form-group'><a href='"+ formComponentData.url+ "'><button>"+ formComponentData.label +"</button></a></div>" ;

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    type: formComponentData.type,
                    label: formComponentData.label,
                    labelLanguage: formComponentData.labelLanguage,
                    toolTips: formComponentData.toolTips,
                    url: formComponentData.url,
                    viewToCall: formComponentData.viewToCall,
                    column: formComponentData.column,
                    row: formComponentData.row
                });
                form.push(componentData);
                break;

            case "image":
                $('#'+formComponentData.column+' ul').append("<li id=" + formComponentData.uniqueId + " class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span><img src='"+ formComponentData.url+ "'></li>");

                var htmlDomComponent = "<div class='form-group'><img id='"+ formComponentData.uniqueId +"' src='"+ formComponentData.url+ "'></div>" ;

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

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
                    viewToCall: formComponentData.viewToCall,
                    column: formComponentData.column,
                    row: formComponentData.row
                });
                form.push(componentData);
                break;

            case "calculationfield":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> <div>"+ formComponentData.label +" </div></li>");

                var htmlDomComponent = "<div class='form-group'> <div name='"+ formComponentData.uniqueId +"' >"+ formComponentData.label +" </div> </div>" ;

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    label: formComponentData.label,
                    newLanguage:labelLanguagetemplate,
                    labelLanguage: formComponentData.labelLanguage,
                    type: formComponentData.type,
                    mappingOperation: formComponentData.mappingOperation,
                    toMappingField: formComponentData.toMappingField,
                    toMappingFieldSrc: fromToMappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    viewToCall: formComponentData.viewToCall,
                    column: formComponentData.column,
                    row: formComponentData.row
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "suppcelector":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" :   <input id='"+ formComponentData.uniqueId +"' type='text'></input><button>select</button> <button>clear</button></li>");

                var htmlDomComponent = "<div class='form-group'> "+formComponentData.label+" :   <input name='"+ formComponentData.uniqueId +"' class='forced-right' type='text'></input><button>select</button> <button>clear</button></div>" ;

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

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
                    componentHeight: formComponentData.componentHeight,
                    componentWidth: formComponentData.componentWidth,
                    inMappingDefValue: formComponentData.inMappingDefValue,
                    fromMappingField: formComponentData.fromMappingField,
                    fromMappingFieldSrc: fromToMappingFieldSrc,
                    toMappingField: formComponentData.toMappingField,
                    toMappingFieldSrc: fromToMappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    viewToCall: formComponentData.viewToCall,
                    column: formComponentData.column,
                    row: formComponentData.row
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "checkbox":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span data-bind='text: label'> "+formComponentData.label+" : <input id='"+ formComponentData.uniqueId +"' type='checkbox'></input></li>");

                var htmlDomComponent = " <div class='form-group'>"+formComponentData.label+" : <input name='"+ formComponentData.uniqueId +"'  type='checkbox' value='"+ formComponentData.checked +"' ></input></div>" ;

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

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
                    inMappingDefValue: formComponentData.inMappingDefValue,
                    fromMappingField: formComponentData.fromMappingField,
                    fromMappingFieldSrc: fromToMappingFieldSrc,
                    toMappingField: formComponentData.toMappingField,
                    toMappingFieldSrc: fromToMappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    addedOptions: formComponentData.addedOptions,
                    checked: formComponentData.checked,
                    viewToCall: formComponentData.viewToCall,
                    column: formComponentData.column,
                    row: formComponentData.row,
                    gridView: true
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "textarea":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" :   <textarea id='"+ formComponentData.uniqueId +"'></textarea></li>");

                var htmlDomComponent = " <div class='form-group'> "+formComponentData.label+" :   <textarea name='"+ formComponentData.uniqueId +"' value='textarea' class='forced-right'></textarea></div>" ;

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

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
                    inMappingDefValue: formComponentData.inMappingDefValue,
                    fromMappingField: formComponentData.fromMappingField,
                    fromMappingFieldSrc: fromToMappingFieldSrc,
                    toMappingField: formComponentData.toMappingField,
                    toMappingFieldSrc: fromToMappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    inputLength: 200,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    readOnly: formComponentData.readOnly,
                    doNotShow: formComponentData.doNotShow,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    viewToCall: formComponentData.viewToCall,
                    column: formComponentData.column,
                    row: formComponentData.row
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "datecomp":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span> "+formComponentData.label+" :   <input id='"+ formComponentData.uniqueId +"' type='date'></input></li>");

                var htmlDomComponent = "<div class='form-group'> "+formComponentData.label+" :   <input name='"+ formComponentData.uniqueId +"' value='date' class='forced-right' type='date'></input> </div>" ;

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

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
                    inMappingDefValue: formComponentData.inMappingDefValue,
                    fromMappingField: formComponentData.fromMappingField,
                    fromMappingFieldSrc: fromToMappingFieldSrc,
                    toMappingField: formComponentData.toMappingField,
                    toMappingFieldSrc: fromToMappingFieldSrc,
                    printOrder: formComponentData.printOrder,
                    printOnApprovalMail: formComponentData.printOnApprovalMail,
                    printOnOrderMail: formComponentData.printOnOrderMail,
                    keepAfterAdding: formComponentData.keepAfterAdding,
                    viewToCall: formComponentData.viewToCall,
                    column: formComponentData.column,
                    row: formComponentData.row
                });
                checkBoxValidation(componentData);
                form.push(componentData);
                break;

            case "emptystrut":
                $('#'+formComponentData.column+' ul').append("<li id="+ formComponentData.uniqueId +" class='ui-state-default'>" +
                        "<span class='ui-icon ui-icon-arrowthick-2-n-s'>" +
                        "</span><br><br></li>");

                var htmlDomComponent = "<div class='form-group'><br><br></div>";

                addToPreviewForm(htmlDomComponent, formComponentData.uniqueId);

                var componentData = new kendo.data.ObservableObject({
                    uniqueId: formComponentData.uniqueId,
                    type: formComponentData.type,
                    column: formComponentData.column,
                    row: formComponentData.row
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
        $("#droppableArea ul li").remove();
        form = [];
        $('#saveBtn').attr("disabled", false);
        $('#updateBtn').attr("disabled", true);
        $('#previewBtn').attr("disabled", true);

    });

    function getComboOptions(arrayData){
        var htmlOption = " ";
        for(var i = 0; i < arrayData.length ; i++){

            htmlOption += "<option value='"+arrayData[i].text+"'>"+arrayData[i].text+"</option>";
        }
        return htmlOption;
    }

    function getRadioOptions(arrayData, componenetId){
        var htmlOption = " ";
        for(var i = 0; i < arrayData.length ; i++){
            htmlOption += " "+ arrayData[i].text +" <input  name='"+ componenetId +"' type='radio' value='"+ arrayData[i].text +"'> </input>";
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

    $("#droppableArea").on("dblclick", ".ui-state-default", openConfigurationMenu);

    function openConfigurationMenu (e){
        var Observable = getKendoObservable(e);
        console.log("id of observable and target: " + Observable.uniqueId+" "+ e.target.id);
        var configurationView = new kendo.View(Observable.viewToCall);
        var configHtml = configurationView.render();
        kendo.bind(configHtml, Observable);
        kendo.bind($("#"+Observable.uniqueId), Observable);
        $("#window").html(configHtml);
        if(Observable.gridView){
            $("#gridWindow").data("kendoWindow").center().open();
        }else{
            $("#window").data("kendoWindow").center().open();
        }
        activateWindowKeyFunction(e);
        activateLabelWindow(Observable);
        activateOptionWindow(Observable);
        checkBoxbuilder(Observable);
        checkBoxValidation(Observable);
        gridWin(Observable);
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

        $("#gridCancelBtn").on("click", function(){
            $("#window").data("kendoWindow").close();
        });
        $("#btnOK").click(function(){
           // console.log("Array lenght: " + form.length +" "+ JSON.stringify(form));
            $("#window").data("kendoWindow").close();
        });
    }

    $("#window").kendoWindow({
        title: "Component configuration window",
        width: "1300px",
        height: "600px",
        modal: true,
        visible: false
    }).data("kendoWindow");

    $.fn.serializeObject = function()
    {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };

    /****************************************************/
    /*****************Configuration windows**************/
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
                var row = $(this).closest("li").attr("id");
                console.log(row);

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
                        "Default: "+ value._default +" Invalid: "+ value.invalid +"<button class='deleteRow'>delete</button><button class='editRow'>edit</button><button id="+ 'nr'+ index +" class='saveRow'>save</button></li>");
            });
            $('.saveRow').attr("disabled", true);
            rowButtons(Observable);
            activateOptionButtons(Observable);
        });

        function activateOptionButtons(Observable){
            $("#addOption").click(function(){
                Observable.get("addedOptions").push(Observable.newOption);
                Observable.set("newOption", optionTemplate);
                console.log(JSON.stringify(Observable.addedOptions));
                optionTable(Observable);
            });

            $("#cancelOption").click(function(){
                $("#optionGrid").data("kendoWindow").close();
            });
        }

        function optionTable(Observable){
            var arr = Observable.get("addedOptions");
            // console.log(JSON.stringify(arr));
            var count = arr.length - 1;
            console.log(" language length: "+count+" and the content " + arr[count].text +" "+arr[count].value);
            $("#optionList ul").append("<li id='"+ count +"'>index:"+ count +" Text: "+ arr[count].text +" "+" Value: "+ arr[count].value +" " +
                    "Return: "+ arr[count].returnValue +" Num value: "+ arr[count].numValue +" Txt value: "+ arr[count].txtValue +" English: "+ arr[count].english +" Finnish: "+ arr[count].finnish
                    +" Norwegian: "+ arr[count].norwegian +" German: "+ arr[count].german +" Danish: "+ arr[count].danish +" polish: "+ arr[count].polish +" " +
                    "Default: "+ arr[count]._default +" Invalid: "+ arr[count].invalid +"<button class='deleteRow'>delete</button><button class='editRow'>edit</button><button class='saveRow'>save</button></li>");
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
                var row = $(this).closest("li").attr("id");
                var buttonNr = "nr"+row;

                $("#"+buttonNr).attr("disabled", false);
                $("#optionText").val($(arr).get(row).text);
                $("#optionValue").val($(arr).get(row).value);
                $("#optionRtunValue").val($(arr).get(row).returnValue);
                $("#optionNum").val($(arr).get(row).numValue);
                $("#optionTxt").val($(arr).get(row).txtValue);
                $("#optionDef").prop('checked', $(arr).get(row)._default);
                $("#optionInv").prop('checked', $(arr).get(row).invalid);
                $("#optionEng").val($(arr).get(row).english);
                $("#optionFin").val($(arr).get(row).finnish);
                $("#optionNor").val($(arr).get(row).norwegian);
                $("#optionGer").val($(arr).get(row).german);
                $("#optionDan").val($(arr).get(row).danish);
                $("#optionPol").val($(arr).get(row).polish);

            });

            $(".saveRow").on("click", function(){
                var row = $(this).closest("li").attr("id");
                var buttonNr = "nr"+row;

                var option = $(arr).get(row);
                option["text"] = $("#optionText").val();
                option["value"] = $("#optionValue").val();
                option["returnValue"] = $("#optionRtunValue").val();
                option["numValue"] = $("#optionNum").val();
                option["txtValue"] = $("#optionTxt").val();
                option["_default"] = $("#optionDef").is(':checked');
                option["invalid"] = $("#optionInv").is(':checked');
                option["english"] = $("#optionEng").val();
                option["finnish"] = $("#optionFin").val();
                option["norwegian"] = $("#optionNor").val();
                option["german"] = $("#optionGer").val();
                option["danish"] = $("#optionDan").val();
                option["polish"] = $("#optionPol").val();

                arr.splice( $.inArray(row, arr), 0 );
                Observable.set("addedOptions", arr);
                console.log(JSON.stringify(Observable.addedOptions));
                $("#"+buttonNr).attr("disabled", true);
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

    /**********************************************/
    /*****************Preview windows**************/
    /**********************************************/

    $("#previewBtn").on("click", function(){
        $('#columnFirst').empty();
        $('#columnSecond').empty();
        $.each(previewForm, function(index, list){
            //console.log("length of array: " + previewForm.length + " ID col : " + list.id + " Obs Id: " + form[index].uniqueId);
           /* for(var i = 0 ; i < previewForm.length ; i++){
                if(form[index].uniqueId == previewForm[i].id){
                    console.log(true);
                }else{
                    console.log(false);
                }
            }*/
           if(form[index].uniqueId == list.id){
                console.log(true);
                if(form[index].column == "firstColumn"){
                    console.log("type: " + form[index].type + " col: " +form[index].column)
                    $("#columnFirst").append(list.html);
                }else if(form[index].column == "secondColumn"){
                    $("#columnSecond").append(list.html);
                }
            }else{
                console.log(false);
            }
        });

        previewWindowController();
        $("#previewWindow").data("kendoWindow").center().open();
    });


    function previewWindowController(){
        $("#preSubmit").on("click", function(){

            console.log(JSON.stringify($('form').serializeObject()));
            var data = JSON.stringify($('form').serializeObject());
            postPreviewForm(data);
        });
        

        $("#preCancel").on("click", function(){
            $("#previewWindow").data("kendoWindow").close();
        });
    }


    $("#previewWindow").kendoWindow({
        width: "800px",
        height: "600px",
        modal: true,
        title: "Form preview"
    }).data("kendoWindow");

    /*****************************************/
    /*****************Kendo Grid**************/
    /*****************************************/

    function gridWin(Observable){

        var options = Observable.get("addedOptions");


        var dataSource = new kendo.data.DataSource({
            data: options,
            transport: {
                read: function (object) {
                    object.success(options);
                },
                create: function (object) {
                    var item = object.data;
                    object.success(item);
                },
                update: function (object) {
                    object.success();
                },
                destroy: function (object) {
                    object.success();
                }
            },
            schema: {
                model: {
                    fields: {
                        text: { validation: { required: true } },
                        value: { validation: { required: false } },
                        returnValue: { validation: { required: false } },
                        numValue: { type: "number", validation: { min: 0, required: false } },
                        txtValue: { validation: { required: false } },
                        english: { validation: { required: false } },
                        finnish: { validation: { required: false } },
                        norwegian: { validation: { required: false } },
                        german: { validation: { required: false } },
                        danish: { validation: { required: false } },
                        polish: { validation: { required: false } },
                        _default: { type: "boolean" },
                        invalid: { type: "boolean" }
                    }
                }
            },
            change: function (e) {
                if (e.action === "add") {
                    console.log(JSON.stringify(e.items[0]));
                    // console.log(JSON.stringify(options));
                    console.log(JSON.stringify(JSON.stringify(Observable.addedOptions.length)));

                }
            }
        });

        var grid = $("#grid").data("kendoGrid");
        grid.setDataSource(dataSource);

        kendo.bind($("#gridWindow"), Observable);

        $("#gridBtn").on("click", function(){
            $("#gridWindow").data("kendoWindow").center().open();
        });
    };


    $("#grid").kendoGrid({
        pageable: false,
        toolbar: ["create"],
        editable: "popup",
        resizable: false,
        columns: [
            { field: "text", title: "Text" },
            { field: "value", title: "Value" },
            { field: "returnValue", title: "Return Value" },
            { field: "numValue", title: "Num.Value", format: "0.00", width: "100px" },
            { field: "txtValue", title: "Txt Value" },

            { field: "english", title: "English" },
            { field: "finnish", title: "Finnish" },
            { field: "norwegian", title: "Norwegian" },
            { field: "german", title: "German" },
            { field: "danish", title: "Danish" },
            { field: "polish", title: "Polish" },
            { field: "_default" },
            { field: "invalid" },

            { command: ["edit", "destroy"], title: "&nbsp;", width: "180px" }
        ]
    });

    $("#gridWindow").kendoWindow({
        width: "1300px",
        height: "650px",
        resizable: false,
        modal: true,
        title: "Component configuration window"

    }).data("kendoWindow");

});
</script>

<%------------------%>
<%-----Templates----%>
<%------------------%>

<script id="text-configuration-menu" type="text/x-kendoui-template">
    <div class="row">
        <div class="col-md-8">
            <h3>Text</h3>
        </div>

        <div class="col-md-4">
            <div class="form-group">
                <label >ID (Unigue):</label>
                <input type="text" data-bind="value: uniqueId" class="forced-right"  >
            </div>

            <div class="form-group">
                <label for="swe-text">Text(Swedish):</label>
                <input type="text" data-bind="value: label" class="forced-right">
                <button id="swe-textBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label >Label width</label>
                <input type="text" data-bind="value: labelWidth" class="forced-right" >
            </div>

            <div class="form-group">
                <label >Text style:</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textStyleSrc, value: textStyle"></select></div>
            </div>

            <div class="form-group">
                <label >Text size:</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textSizeSrc, value: textSize"></select></div>
            </div>

        </div>

        <div class="col-md-8 window-footer ">
            <div class="form-group">
                <p>* Mandatory information</p>
            </div>
            <div class="form-group forced-right">
                <button id="btnOK" >OK</button>
                <button id="gridCancelBtn">Cancel</button>
            </div>

        </div>

    </div>
</script>

<script id="link-configuration-menu" type="text/x-kendoui-template">
    <div class="row">

        <div class="col-md-8">
            <h3>Link</h3>
        </div>


        <div class="col-md-4">
            <div class="form-group">
                <label>ID (Unigue):</label>
                <input type="text" data-bind="value: uniqueId" class="forced-right"  >
            </div>

            <div class="form-group">
                <label for="swe-text">Text(Swedish):</label>
                <input type="text" data-bind="value: label" class="forced-right">
                <button id="swe-textBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label>Tooltip</label>
                <input type="text" data-bind="value: toolTips" class="forced-right">
            </div>

            <div class="form-group">
                <label>Label width</label>
                <input type="text" data-bind="value: labelWidth" class="forced-right" >
            </div>

            <div class="form-group">
                <label>Label positioning</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: labelPositionSrc, value: labelPosition"></select></div>
            </div>

            <div class="form-group">
                <label>Text style:</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textStyleSrc, value: textStyle"></select></div>
            </div>

            <div class="form-group">
                <label>Text size:</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textSizeSrc, value: textSize"></select></div>
            </div>

            <div class="form-group">
                <label>Text format</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textFormatSrc, value: textFormat"></select></div>
            </div>

            <div class="form-group">
                <label>Component width</label>
                <input type="text" data-bind="value: componentWidth" class="forced-right">
            </div>

            <div class="form-group">
                <label>URL:</label>
                <input type="text" data-bind="value: url" class="forced-right">
            </div>
        </div>


        <div class="col-md-8 window-footer ">
            <div class="form-group">
                <p>* Mandatory information</p>
            </div>
            <div class="form-group forced-right">
                <button id="btnOK" >OK</button>
                <button id="gridCancelBtn">Cancel</button>
            </div>

        </div>
    </div>
</script>


<script id="input-configuration-menu" type="text/x-kendoui-template">
    <div class="row">

        <div class="col-md-8">
            <h3>Input</h3>
        </div>

        <div class="col-md-4">
            <div class="form-group">
                <label for="uniqeu-id">ID (Unigue):</label>
                <input type="text" data-bind="value: uniqueId" class="forced-right">
            </div>

            <div class="form-group">
                <label for="swe-text">Text(Swedish):</label>
                <input type="text" data-bind="value: label" class="forced-right">
                <button id="swe-textBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label for="tooltip">Tooltip:</label>
                <input type="text" data-bind="value: toolTips" class="forced-right">
                <button id="tooltipBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label for="unique-id">Label width:</label>
                <input type="text" data-bind="value:  labelWidth" class="forced-right">
            </div>

            <div class="form-group">
                <label for="labelPositioning">Label Positioning:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: labelPositionSrc, value: labelPosition"></select>
                </div>
            </div>

            <div class="form-group">
                <label for="textStyle">Text style:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textStyleSrc, value: textStyle"></select></div>
            </div>

            <div class="form-group">
                <label for="textSize">Text Size:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textSizeSrc, value: textSize"></select></div>
            </div>

            <div class="form-group">
                <label for="textFormat">Text format:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textFormatSrc, value: textFormat"></select></div>
            </div>

            <div class="form-group">
                <label>Mandatory Info</label>
                <input id="mandatoryInfo" class="input_cbox forced-right" type="checkbox" value="Apple"/>
            </div>

            <div class="form-group">
                <label>Person Number</label>
                <input id="personNumber" class="input_cbox forced-right" type="checkbox" value="Banana"/>
            </div>

        </div>

        <div class="col-md-4">
            <div class="form-group">
                <label for="componentHeight">Component Height:</label>
                <input type="text" data-bind="value: componentHeight" class="forced-right">
            </div>

            <div class="form-group">
                <label for="componentWidth">Component Width:</label>
                <input type="text" data-bind="value: componentWidth" class="forced-right">
            </div>

            <div class="form-group">
                <label for="inMappingDefValue">In-mapping default value:</label>
                <input type="text" data-bind="value: inMappingDefValue" class="forced-right">
            </div>

            <div class="form-group">
                <label for="fromMappingField">From-mapping field:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: fromMappingFieldSrc, value: fromMappingField"></select>
                </div>
            </div>

            <div class="form-group">
                <label for="toMappingField">To-mapping field:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: toMappingFieldSrc, value: toMappingField"></select>
                </div>
            </div>

            <div class="form-group">
                <label for="printOrder">Print order:</label>
                <input type="text" data-bind="value: printOrder" class="forced-right">
            </div>

            <div class="form-group">
                <label for="inputLength">input Length:</label>
                <input type="text" data-bind="value: inputLength" class="forced-right">
            </div>

            <div class="form-group">
                <label>Print on approval mail</label>
                <input id="printOnApprovalMail" class="input_cbox forced-right" type="checkbox"/>
            </div>

            <div class="form-group">
                <label>Print on order mail</label>
                <input id="printOnOrderMail" class="input_cbox forced-right" type="checkbox"/>
            </div>

            <div class="form-group">
                <label>Read-only</label>
                <input id="readOnly" class="input_cbox forced-right" type="checkbox"/>
            </div>

            <div class="form-group">
                <label>Do not show</label>
                <input id="doNotShow" class="input_cbox forced-right" type="checkbox"/>
            </div>
            <div class="form-group">
                <label>Keep after adding</label>
                <input id="keepAfterAdding" class="input_cbox forced-right" type="checkbox"/>
            </div>

        </div>

        <div class="col-md-8 window-footer ">
            <div class="form-group">
                <p>* Mandatory information</p>
            </div>

            <div class="form-group forced-right">
                <button id="btnOK">OK</button>
                <button id="gridCancelBtn">Cancel</button>
            </div>
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
            <label for="inMappingDefValue">In-mapping default value:</label>
            <input type="text" data-bind="value: inMappingDefValue" class="form-control">
            <hr>
            <label for="fromMappingFiel">From-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: fromMappingFieldSrc, value: fromMappingField"></select>
            <label for="toMappingField">To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: toMappingFieldSrc, value: toMappingField"></select>
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
    <div class="row">

        <div class="col-md-8">
            <h3>Linkbutton</h3>
        </div>

        <div class="col-md-4">
            <div class="form-group">
                <label for="unique-id">ID (Unigue) *</label>
                <input type="text" data-bind="value: uniqueId" class="forced-right">
            </div>


            <div class="form-group">
                <label for="swe-text">Text(Swedish) *</label>
                <input type="text" data-bind="value: label" class="forced-right">
                <button id="swe-textBtn" class="forced-right">Language</button>
            </div>


            <div class="form-group">
                <label for="tooltip">Tooltip</label>
                <input type="text" data-bind="value: toolTips" class="forced-right">
                <button id="tooltipBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label>URL</label>
                <input type="text" data-bind="value: url" class="forced-right">
            </div>
        </div>

        <div class="col-md-8 window-footer ">
            <div class="form-group">
                <p>* Mandatory information</p>
            </div>
            <div class="form-group forced-right">
                <button id="btnOK" >OK</button>
                <button id="gridCancelBtn">Cancel</button>
            </div>

        </div>
    </div>
</script>

<script id="image-configuration-menu" type="text/x-kendoui-template">
    <div class="row">

        <div class="col-md-8">
            <h3>Image</h3>
        </div>

        <div class="col-md-4">
            <div class="form-group">
                <label for="unique-id">ID (Unigue) *</label>
                <input type="text" data-bind="value: uniqueId" class="forced-right">
            </div>

            <div class="form-group">
                <label for="swe-text">Text(Swedish) *</label>
                <input type="text" data-bind="value: label" class="forced-right">
                <button id="swe-textBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label for="tooltip">Tooltip</label>
                <input type="text" data-bind="value: toolTips" class="forced-right">
                <button id="tooltipBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label>URL</label>
                <input type="text" data-bind="value: url" class="forced-right">
            </div>

            <div class="form-group">
                <label for="componentHeight">Component Height *</label>
                <input type="text" data-bind="value: componentHeight" class="forced-right">
            </div>

            <div class="form-group">
                <label for="componentWidth">Component Width *</label>
                <input type="text" data-bind="value: componentWidth" class="forced-right">
            </div>

            <div class="form-group">
                <label>Image Resize options:</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: imageResizeSrc, value: imageResize"></select></div>
            </div>
        </div>

        <div class="col-md-8 window-footer ">
            <div class="form-group">
                <p>* Mandatory information</p>
            </div>
            <div class="form-group forced-right">
                <button id="btnOK" >OK</button>
                <button id="gridCancelBtn">Cancel</button>
            </div>

        </div>


    </div>
</script>

<script id="calc-configuration-menu" type="text/x-kendoui-template">
    <div role="row" >

        <div class="col-md-8">
            <h3>Input</h3>
        </div>

        <div class="col-md-4">
            <div class="form-group">
                <label for="unique-id">ID (Unigue) *</label>
                <input type="text" data-bind="value: uniqueId" class="forced-right">
            </div>

            <div class="form-group">
                <label for="swe-text">Text(Swedish) *</label>
                <input type="text" data-bind="value: label" class="forced-right">
                <button id="swe-textBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label> Mapping Operation</label>
                <textarea  type="text" data-bind="value: mappingOperation" class="forced-right" ></textarea>
            </div>
        </div>

        <div class="col-md-4">
            <div class="form-group">
                <label for="toMappingField">To-mapping field</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: toMappingFieldSrc, value: toMappingField"></select></div>
            </div>

            <div class="form-group">
                <label for="printOrder">Print order</label>
                <input type="text" data-bind="value: printOrder" class="forced-right">
            </div>

            <div class="form-group">
                <label>Print on approval mail</label><input id="printOnApprovalMail" class="input_cbox forced-right" type="checkbox" />
            </div>

            <div class="form-group">
                <label>Print on order mail</label><input id="printOnOrderMail" class="input_cbox forced-right"  type="checkbox" />
            </div>
        </div>

        <div class="col-md-8 window-footer ">
            <div class="form-group">
                <p>* Mandatory information</p>
            </div>

            <div class="form-group forced-right">
                <button id="btnOK" >OK</button>
                <button id="gridCancelBtn">Cancel</button>
            </div>
        </div>

    </div>
</script>

<script id="supp-configuration-menu" type="text/x-kendoui-template">
    <div class="row">

        <div class="col-md-8">
            <h3>Suppcelector</h3>
        </div>

        <div class="col-md-4">
            <div class="form-group">
                <label for="unique-id">ID (Unigue) *</label>
                <input type="text" data-bind="value: uniqueId" class="forced-right">
            </div>

            <div class="form-group">
                <label for="swe-text">Text(Swedish) *</label>
                <input type="text" data-bind="value: label" class="forced-right">
                <button id="swe-textBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label for="tooltip">Tooltip</label>
                <input type="text" data-bind="value: toolTips" class="forced-right">
                <button id="tooltipBtn" class="forced-right">Language</button>
            </div>


            <div class="form-group">
                <label for="unique-id">Label width *</label>
                <input type="text" data-bind="value:  labelWidth" class="forced-right">
            </div>

            <div class="form-group">
                <label for="labelPositioning">Label Positioning:</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: labelPositionSrc, value: labelPosition"></select></div>
            </div>

            <div class="form-group">
                <label for="textStyle">Text style</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textStyleSrc, value: textStyle"></select></div>
            </div>


            <div class="form-group">
                <label for="textSize">Text Size</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textSizeSrc, value: textSize"></select></div>
            </div>

            <div class="form-group">
                <label for="textFormat">Text format</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textFormatSrc, value: textFormat"></select></div>
            </div>

            <div class="form-group">
                <label>Mandatory Info</label>
                <div class="forced-right"><input id="mandatoryInfo" class="input_cbox" type="checkbox" value="Apple"/></div>
            </div>
        </div>


        <div class="col-md-4">
            <div class="form-group">
                <label for="componentHeight">Component Height *</label>
                <input type="text" data-bind="value: componentHeight" class="forced-right">
            </div>

            <div class="form-group">
                <label for="componentWidth">Component Width *</label>
                <input type="text" data-bind="value: componentWidth" class="forced-right">
            </div>

            <div class="form-group">
                <label for="inMappingDefValue">In-mapping default value</label>
                <input type="text" data-bind="value: inMappingDefValue" class="forced-right">
            </div>

            <div class="form-group">
                <label for="fromMappingField">From-mapping field</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: fromMappingFieldSrc, value: fromMappingField"></select></div>
            </div>

            <div class="form-group">
                <label for="toMappingField">To-mapping field</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: toMappingFieldSrc, value: toMappingField"></select></div>
            </div>

            <div class="form-group">
                <label for="printOrder">Print order</label>
                <input type="text" data-bind="value: printOrder" class="forced-right">
            </div>

            <div class="form-group">
                <label for="inputLength">input Length *</label>
                <input type="text" data-bind="value: inputLength" class="forced-right">
            </div>

            <div class="form-group">
                <label>Print on approval mail</label><input id="printOnApprovalMail" class="input_cbox forced-right" type="checkbox" />
            </div>

            <div class="form-group">
                <label>Print on order mail</label><input id="printOnOrderMail" class="input_cbox forced-right"  type="checkbox" />
            </div>

            <div class="form-group">
                <label>Read-only</label><input id="readOnly" class="input_cbox forced-right" type="checkbox" />
            </div>

            <div class="form-group">
                <label>Do not show</label><input id="doNotShow" class="input_cbox forced-right"  type="checkbox" />
            </div>

            <div class="form-group">
                <label>Keep after adding</label><input id="keepAfterAdding" class="input_cbox forced-right" type="checkbox" />
            </div>

        </div>


        <div class="col-md-8 window-footer ">
            <div class="form-group">
                <p>NOTE! Important information when adding languages. (Place the mouse pointer here)</p>
                <p>* Mandatory information</p>
            </div>
            <div class="form-group forced-right">
                <button id="btnOK" >OK</button>
                <button id="gridCancelBtn">Cancel</button>
            </div>

        </div>

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
            <input type="text" data-bind="value: inMappingDefValue" class="form-control">

            <hr>

            <label>From-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: fromMappingFieldSrc, value: fromMappingField"></select>

            <label>To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: toMappingFieldSrc, value: toMappingField"></select>

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
            <button class="btn btn-primary" id="gridBtn" >Grid</button>

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
            <label for="inMappingDefValue">In-mapping default value:</label>
            <input type="text" data-bind="value: inMappingDefValue" class="form-control">
            <hr>
            <label for="fromMappingField">From-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: fromMappingFieldSrc, value: fromMappingField"></select>
            <label for="toMappingField">To-mapping field:</label>
            <select data-role="dropdownlist"
                    data-text-field="name"
                    data-value-field="value"
                    data-bind="source: toMappingFieldSrc, value: toMappingField"></select>
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
    <div class="row">

        <div class="col-md-8">
            <h3>Textarea</h3>
        </div>

        <div class="col-md-4">
            <div class="form-group">
                <label for="uniqeu-id">ID (Unigue):</label>
                <input type="text" data-bind="value: uniqueId" class="forced-right">
            </div>

            <div class="form-group">
                <label for="swe-text">Text(Swedish):</label>
                <input type="text" data-bind="value: label" class="forced-right">
                <button id="swe-textBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label for="tooltip">Tooltip:</label>
                <input type="text" data-bind="value: toolTips" class="forced-right">
                <button id="tooltipBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label for="unique-id">Label width:</label>
                <input type="text" data-bind="value:  labelWidth" class="forced-right">
            </div>

            <div class="form-group">
                <label for="labelPositioning">Label Positioning:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: labelPositionSrc, value: labelPosition"></select>
                </div>
            </div>

            <div class="form-group">
                <label for="textStyle">Text style:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textStyleSrc, value: textStyle"></select></div>
            </div>

            <div class="form-group">
                <label for="textSize">Text Size:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textSizeSrc, value: textSize"></select></div>
            </div>


            <div class="form-group">
                <label>Mandatory Info</label>
                <input id="mandatoryInfo" class="input_cbox forced-right" type="checkbox" value="Apple"/>
            </div>

        </div>

        <div class="col-md-4">
            <div class="form-group">
                <label for="componentHeight">Component Height:</label>
                <input type="text" data-bind="value: componentHeight" class="forced-right">
            </div>

            <div class="form-group">
                <label for="componentWidth">Component Width:</label>
                <input type="text" data-bind="value: componentWidth" class="forced-right">
            </div>

            <div class="form-group">
                <label for="inMappingDefValue">In-mapping default value:</label>
                <input type="text" data-bind="value: inMappingDefValue" class="forced-right">
            </div>

            <div class="form-group">
                <label for="fromMappingField">From-mapping field:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: fromMappingFieldSrc, value: fromMappingField"></select>
                </div>
            </div>

            <div class="form-group">
                <label for="toMappingField">To-mapping field:</label>

                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: toMappingFieldSrc, value: toMappingField"></select>
                </div>
            </div>

            <div class="form-group">
                <label for="printOrder">Print order:</label>
                <input type="text" data-bind="value: printOrder" class="forced-right">
            </div>

            <div class="form-group">
                <label for="inputLength">input Length:</label>
                <input type="text" data-bind="value: inputLength" class="forced-right">
            </div>

            <div class="form-group">
                <label>Print on approval mail</label>
                <input id="printOnApprovalMail" class="input_cbox forced-right" type="checkbox"/>
            </div>

            <div class="form-group">
                <label>Print on order mail</label>
                <input id="printOnOrderMail" class="input_cbox forced-right" type="checkbox"/>
            </div>

            <div class="form-group">
                <label>Read-only</label>
                <input id="readOnly" class="input_cbox forced-right" type="checkbox"/>
            </div>

            <div class="form-group">
                <label>Do not show</label>
                <input id="doNotShow" class="input_cbox forced-right" type="checkbox"/>
            </div>
            <div class="form-group">
                <label>Keep after adding</label>
                <input id="keepAfterAdding" class="input_cbox forced-right" type="checkbox"/>
            </div>

        </div>

        <div class="col-md-8 window-footer ">
            <div class="form-group">
                <p>* Mandatory information</p>
            </div>

            <div class="form-group forced-right">
                <button id="btnOK">OK</button>
                <button id="gridCancelBtn">Cancel</button>
            </div>
        </div>
    </div>
</script>

<script id="datecomp-configuration-menu" type="text/x-kendoui-template">
    <div class="row">

        <div class="col-md-8">
            <h3>Datecomp</h3>
        </div>


        <div class="col-md-4">
            <div class="form-group">
                <label for="unique-id">ID (Unigue) *</label>
                <input type="text" data-bind="value: uniqueId" class="forced-right">
            </div>

            <div class="form-group">
                <label for="swe-text">Text(Swedish) *</label>
                <input type="text" data-bind="value: label" class="forced-right">
                <button id="swe-textBtn" class="forced-right">Language</button>
            </div>

            <div class="form-group">
                <label for="tooltip">Tooltip</label>
                <input type="text" data-bind="value: toolTips" class="forced-right">
                <button id="tooltipBtn" class="forced-right">Language</button>
            </div>


            <div class="form-group">
                <label for="labelPositioning">Label Positioning:</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: labelPositionSrc, value: labelPosition"></select></div>
            </div>

            <div class="form-group">
                <label for="textStyle">Text style</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textStyleSrc, value: textStyle"></select></div>
            </div>


            <div class="form-group">
                <label for="textSize">Text Size</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textSizeSrc, value: textSize"></select></div>
            </div>

            <div class="form-group">
                <label for="textFormat">Text format</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: textFormatSrc, value: textFormat"></select></div>
            </div>

            <div class="form-group">
                <label>Mandatory Info</label>
                <div class="forced-right"><input id="mandatoryInfo" class="input_cbox" type="checkbox" value="Apple"/></div>
            </div>
        </div>

        <div class="col-md-4">

            <div class="form-group">
                <label for="componentWidth">Component Width *</label>
                <input type="text" data-bind="value: componentWidth" class="forced-right">
            </div>


            <div class="form-group">
                <label for="toMappingField">To-mapping field</label>
                <div class="forced-right"><select data-role="dropdownlist"
                                                  data-text-field="name"
                                                  data-value-field="value"
                                                  data-bind="source: toMappingFieldSrc, value: toMappingField"></select></div>
            </div>

            <div class="form-group">
                <label>Print on approval mail</label><input id="printOnApprovalMail" class="input_cbox forced-right" type="checkbox" />
            </div>

            <div class="form-group">
                <label>Print on order mail</label><input id="printOnOrderMail" class="input_cbox forced-right"  type="checkbox" />
            </div>

            <div class="form-group">
                <label>Keep after adding</label><input id="keepAfterAdding" class="input_cbox forced-right" type="checkbox" />
            </div>

        </div>

        <div class="col-md-8 window-footer ">
            <div class="form-group">
                <p>NOTE! Important information when adding languages. (Place the mouse pointer here)</p>
                <p>* Mandatory information</p>
            </div>

            <div class="form-group forced-right">
                <button id="btnOK" >OK</button>
                <button id="gridCancelBtn">Cancel</button>
            </div>
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
            <input id="optionText" type="text" data-bind="value: newOption.text" class="form-control">

            <label>Value(mapping)</label>
            <input id="optionValue" type="text" data-bind="value: newOption.value" class="form-control">

            <label>Return value(default)</label>
            <input id="optionRtunValue" type="text" data-bind="value: newOption.returnValue" class="form-control">

            <label>Num.Value(mapping)</label>
            <input id="optionNum" type="text" data-bind="value: newOption.numValue" class="form-control">

            <label>Txt value(mapping)</label>
            <input id="optionTxt" type="text" data-bind="value: newOption.txtValue" class="form-control">

            <label>Default</label>
            <input id="optionDef" type="checkbox" data-bind="checked: newOption._default">

            <label>Invalid</label>
            <input id="optionInv" type="checkbox" data-bind="checked: newOption.invalid">

        </div>

        <div class="col-md-4">
            <label>English</label>
            <input id="optionEng" type="text" data-bind="value: newOption.english" class="form-control">

            <label>Finnish</label>
            <input id="optionFin" type="text" data-bind="value: newOption.finnish" class="form-control">

            <label>Norwegian</label>
            <input id="optionNor" type="text" data-bind="value: newOption.norwegian" class="form-control">

            <label>German</label>
            <input id="optionGer" type="text" data-bind="value: newOption.german" class="form-control">

            <label>Danish</label>
            <input id="optionDan" type="text" data-bind="value: newOption.danish" class="form-control">

            <label>Polish</label>
            <input id="optionPol" type="text" data-bind="value: newOption.polish" class="form-control">

        </div>

        <div class="col-md-6">
            <hr>
            <div id="optionList">
                <ul>

                </ul>
            </div>
            <hr>
        </div>

    </div>
    <button id="addOption"  class="k-button">add</button>
    <button id="cancelOption" class="btn btn-default">Cancel</button>
</script>



</body>
</html>
