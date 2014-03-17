<%--
  Created by IntelliJ IDEA.
  User: gideon
  Date: 2014-01-16
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/kendo.web.min.js"></script>
    <link href="${pageContext.request.contextPath}/res/styles/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/res/styles/kendo.default.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/res/styles/kendo.common.min.css" rel="stylesheet" type="text/css"/>
    <title></title>
</head>
<body>

<div class="container">
    <h1>Welcome ${USER.name}</h1>
    <a href="${pageContext.request.contextPath}/overview"><button>Overview</button></a>
    <a href="${pageContext.request.contextPath}/helloworldspa"><button>HelloWorld SPA</button></a>
    <a href="${pageContext.request.contextPath}/draganddrop"><button>Drag And Drop</button></a>
    <hr>
    <h3>Kendo Editor</h3>
    <textarea id="editor" rows="10" cols="30" style="width:740px;height:440px"></textarea>
    <hr>
    <h3>Kendo Basic MVVM</h3>
    <!-- The view is the UI which will be bound to the view-model (present data) -->
    <div id="view">
        <input data-bind="value: name" />
        <button data-bind="click: displayGreeting">Display Greeting</button>
    </div>

</div>

<script type="text/javascript">

    //kendo UI component
    $(document).ready(function(){
        $("#editor").kendoEditor();
        //viewModel is a representation of your data to the view
        var viewModel = kendo.observable({
            name: "Johan Doe",
            displayGreeting: function(name){
                var name = this.get("name");
                alert("Hello, " + name + "!!!");
            }
        });
        //we bind the vm with the v, the bindings are specified by via the data-bind attribute in HTML
        kendo.bind($("#view"), viewModel);
    });

</script>



</body>
</html>
