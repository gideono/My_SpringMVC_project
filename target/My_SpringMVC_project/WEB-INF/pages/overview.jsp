<%--
  Created by IntelliJ IDEA.
  User: gideon
  Date: 2014-01-20
  Time: 15:36
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
    <h1>Kendo Basic Single Page Application</h1>
    <hr>
    <div id="app"></div>

</div>


<script id="index" type="text/x-kendo-template">
    <h3>Hello <span data-bind = "text: foo"></span></h3>
</script>

<script type="text/javascript">

    var index = new kendo.View(
            "index",
            { model: kendo.observable({ foo: "World"}) }
    );

    var router = new kendo.Router();

    router.route("/", function() {
        index.render("#app");
    });

    $(function() {
        router.start();
    });

</script>

</body>
</html>
