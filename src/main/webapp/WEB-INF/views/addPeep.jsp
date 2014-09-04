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
    <title>Peeps</title>
</head>
<body>

<c:if test="${!empty firstName}">
    Congrats! You created a customer!
</c:if>


<form id="createEmployee" action="/createPeep" method="POST">

Create New Employee <br/>

    <label for="firstName">First Name: </label><input id="firstName" name="firstName"/><br/>
    <label for="lastName">Last Name: </label><input id="lastName" name="lastName"/><br/>
    <label for="address1">Primary Address: </label><input id="address1" name="address1"/><br/>
    <label for="address2">Secondary Address: </label><input id="address2" name="address2"/><br/>
    <label for="city">City: </label><input id="city" name="city"/><br/>
    <label for="state">State: </label><input id="state" name="state"/><br/>
    <label for="zip">Zip: </label><input id="zip" name="zip"/> // Create a address lookup function<br/>
    <label for="phone">Phone: </label><input id="phone" name="phone"/><br/>
    <label for="startDate">Start Date: </label><input id="startDate" name="startDate"/><br/>

<a href="/viewAndEdit"> <label>Edit a Peep</label></a>

    <button type="submit">Create Peep</button>
</form>
</body>
</html>
