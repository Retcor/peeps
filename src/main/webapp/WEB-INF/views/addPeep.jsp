<%--
  Created by IntelliJ IDEA.
  User: danbaker
  Date: 9/3/14
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/resources/js/list.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css"/>
    <title>Peeps</title>
</head>
<body>

<form id="createEmployee" action="${pageContext.request.contextPath}/createPeep" method="POST">

<table title="Create New Employee">
    <caption>Create New Employee</caption>
    <tbody>
        <tr>
            <td><label for="firstName">First Name: </label></td>
            <td><input id="firstName" name="firstName"/></td>
        </tr>
        <tr>
            <td><label for="lastName">Last Name: </label></td>
            <td><input id="lastName" name="lastName"/></td>
        </tr>
        <tr>
            <td><label for="address1">Primary Address: </label></td>
            <td><input id="address1" name="address1"/></td>
        </tr>
        <tr>
            <td><label for="address2">Secondary Address: </label></td>
            <td><input id="address2" name="address2"/></td>
        </tr>
        <tr>
            <td><label for="city">City: </label></td>
            <td><input id="city" name="city"/></td>
        </tr>
        <tr>
            <td><label for="state">State: </label></td>
            <td><input id="state" name="state"/></td>
        </tr>
        <tr>
            <td><label for="zip">Zip: </label></td>
            <td><input id="zip" name="zip"/></td>
        </tr>
        <tr>
            <td><label for="phone">Phone: </label></td>
            <td><input id="phone" name="phone"/></td>
        </tr>
        <tr>
            <td><label for="startDate">Start Date: </label></td>
            <td><input id="startDate" name="startDate" type="date"/></td>
        </tr>

    </tbody>
</table>
<table>
    <tbody>
    <tr>
        <td class="navigation">
            <a href="${pageContext.request.contextPath}/viewAndEdit">
                <div class="divLink">Edit Existing</div>
            </a>
        </td>
        <td class="navigation">
            <button type="submit" class="submit">Create</button>
        </td>
    </tr>
    </tbody>
</table>
</form>

<table id="successTable" hidden="hidden">
    <tbody>
    <tr>
        <td class="successMessage">
            Congrats! You created an Employee!
        </td>
    </tr>
    </tbody>
</table>



<script type="text/javascript">
    $(document).ready(function() {
        $("#startDate").datepicker();

        if(${not empty isSuccess}) {
            $("#successTable").show().delay(5000).fadeOut();
        }
    });
</script>
</body>
</html>
