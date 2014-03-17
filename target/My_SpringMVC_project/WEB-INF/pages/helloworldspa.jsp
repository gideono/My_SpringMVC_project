<%--
  Created by IntelliJ IDEA.
  User: gideon
  Date: 2014-01-21
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/kendo.web.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/kendo.view.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/kendo.router.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/res/styles/kendo.default.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/res/styles/kendo.common.min.css" rel="stylesheet" type="text/css"/>
    <title></title>
</head>
<body>

<div class="container">
    <h1>Kendo Kittes SPA page</h1>
    <hr>
    <div id="image-list"></div>
    <div id="main"></div>
</div>

<script type="text/javascript">
    $(document).ready(function(){

        var image = kendo.observable({
            url: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQlLVsyOQ_cRxnAH1bxzJMBsXozfGHE289x37xSedBKl1mzWFxzVQ",
            //data Source with a list of images
            imageDataSource: new kendo.data.DataSource({
                //we hard code the sources for now, with the help of the data attribute
                data: [
                    {name: "kitteh", url:"http://images4.fanpop.com/image/photos/16700000/Cute-little-kitties-teddybear64-16776219-600-602.jpg"},
                    {name: "nuther kitteh", url:"http://sasfapr.files.wordpress.com/2012/02/kitties_small.jpg"},
                    {name: "cutezee", url:"http://sasfapr.files.wordpress.com/2012/02/kitties_small.jpg"},
                    {name: "fuzzeh", url:"http://oregonbachfestival.com/wp-content/uploads/2011/06/kitties-in-teacup1.jpg"}
                ]
            })
        });

        //we create a new view object for the image list
        var listView = new kendo.View("kitteh-list-template",{
            model: image
        });

        //we render i over main
        var listHtml = listView.render();
        $("#image-list").html(listHtml);

        var kittehView = new kendo.View("kitteh-view-template",{
            model: image
        });

       // var html = kittehView.render();
       // $("#main").html(html);

    });
</script>


<%--We dont want to hard code html code in javaScript instead we use templats instead --%>

<%--Templet is used for kittheView--%>
<scritp type="text/x-kendoui-template" id="kitteh-view-template">
    <img data-bind="attr: {src: url}">
</scritp>

<%--Template for listView, data-role initialize listView controller that will show the view--%>
<%--we add the kitthe-list-item-template as a attribuet templat to tell the list view how to show the images--%>
<%--we also add a data-bind="source: imageDataSource" that tells the listview how to read the data from the view model which the view is bound to--%>
<script type="text/x-kendoui-template" id="kitteh-list-template">
    <div data-role="listview" data-template="kitteh-list-item-template" data-bind="source: imageDataSource"></div>
</script>

<%--Templet the list each individual image this will also force imge to have width of 150 px--%>
<script type="text/x-kendoui-template" id="kitteh-list-item-template">
    <img data-bind="attr {src: url}" width="150">
</script>

</body>
</html>
