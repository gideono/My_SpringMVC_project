<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/kendo.web.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/res/styles/bootstrap.min.css">

</head>
<body>
    <div class="container">
        <h1>${message}</h1>
        <hr>
        <form:form commandName="USER">
            <table>
                <tr><td colspan="2"><form:errors path="*" cssStyle="color : red;"/></td></tr>
                <tr><td>Name : </td><td><form:input path="name" /></td></tr>
                <tr><td>Civil Status : </td><td><form:input path="standard" /></td></tr>
                <tr><td>Age : </td><td><form:input path="age" /></td></tr>
                <tr><td>Sex : </td><td><form:select path="gender">
                    <form:option value="Male"/>
                    <form:option value="Female"/>
                </form:select></td></tr>
                <tr><td colspan="2"><input type="submit" value="Save Changes" /></td></tr>
            </table>
        </form:form>
    </div>
</body>
</html>