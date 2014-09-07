<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: danbaker
  Date: 9/3/14
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="${pageContext.request.contextPath}/resources/js/list.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <title>Peeps</title>
</head>
<body>

<div id="peeps">
    <input class="search" placeholder="Search"/>

    <table>
        <tr>
            <th>Employee ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Primary Address</th>
            <th>Secondary Address</th>
            <th>City</th>
            <th>State</th>
            <th>Zip</th>
            <th>Phone</th>
            <th>Start Date</th>
        </tr>
        <tbody class="list">
            <c:forEach items="${peeps}" var="peep">
            <tr>
                <td class="employeeId">${peep.employeeId}</td>
                <td class="firstName">${peep.firstName}</td>
                <td class="lastName">${peep.lastName}</td>
                <td class="address1">${peep.address1}</td>
                <td class="address2">${peep.address2}</td>
                <td class="city">${peep.city}</td>
                <td class="state">${peep.state}</td>
                <td class="zip">${peep.zip}</td>
                <td class="phone">${peep.phone}</td>
                <td class="startDate">${peep.startDate}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/addPeep"> <label>Add a Peep</label></a>
</div>

<script type="text/javascript">
    var options = {
        valueNames: [ 'employeeId', 'firstName', 'lastName', 'address1', 'address2',
            'city', 'state', 'zip', 'phone', 'startDate']
    };

    //  new List(div id name, var above)
    var userList = new List('peeps', options);
</script>
</body>
</html>
