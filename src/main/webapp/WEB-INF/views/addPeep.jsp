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
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places"></script>
    <title>Peeps</title>
</head>
<body>

<c:if test="${isSuccess}">
    Congrats! You created a customer!
</c:if>


<form id="createEmployee" action="${pageContext.request.contextPath}/createPeep" method="POST">

<table>
    <tbody>
        <tr>
            <td>Create New Employee</td>
            <td></td>
        </tr>
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
            <td><input id="zip" name="zip"/> // Create a address lookup function</td>
        </tr>
        <tr>
            <td><label for="phone">Phone: </label></td>
            <td><input id="phone" name="phone"/></td>
        </tr>
        <tr>
            <td><label for="startDate">Start Date: </label></td>
            <td><input id="startDate" name="startDate"/></td>
        </tr>
        <tr>
            <td><a href="${pageContext.request.contextPath}/viewAndEdit"> <label>Edit a Peep</label></a></td>
            <td><button type="submit">Create Peep</button></td>
        </tr>
    </tbody>
</table>

</form>
</body>
</html>
