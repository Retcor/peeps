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
    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/viewAndEdit.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css"/>
    <title>Peeps</title>
</head>
<body>

<div id="peeps">

    <table>
        <tr>
            <td><input id = "search" class="search" placeholder="Search"/></td>
            <td>
                <select id="searchOptions">
                    <option value="all">All</option>
                    <option value="employeeId">Employee ID</option>
                    <option value="firstName">First Name</option>
                    <option value="lastName">Last Name</option>
                    <option value="startDate">Start Date</option>
                </select>
            </td>
        </tr>
    </table>

<form id="updateEmployee" action="${pageContext.request.contextPath}/editPeep" method="POST">
    <table>
        <caption>Employees</caption>
        <tr>
            <th></th>
            <th>ID</th>
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
            <%--Adding this to help styling--%>
            <c:choose>
                <c:when test="${peep.employeeId % 2 == 0}">
            <tr class="even-row">
                </c:when>
                <c:otherwise>
            <tr>
                </c:otherwise>
            </c:choose>
                <td id="tdEdit_${peep.employeeId}"><input id="edit_${peep.employeeId}" type="button" value="Edit"/></td>
                <td id="tdUpdate_${peep.employeeId}" hidden="hidden"><input id="update_${peep.employeeId}" type="button" value="Update" hidden="hidden"/></td>
                <td class="employeeId"><input type="hidden" id="employeeId_${peep.employeeId}" value="${peep.employeeId}"/>${peep.employeeId}</td>
                <td class="firstName"><input id="firstName_${peep.employeeId}" class="baseInput" value="${peep.firstName}" disabled/></td>
                <td class="lastName"><input id="lastName_${peep.employeeId}" class="baseInput" value="${peep.lastName}" disabled/></td>
                <td class="address1"><input id="address1_${peep.employeeId}" class="baseInput" value="${peep.address1}" disabled/></td>
                <td class="address2"><input id="address2_${peep.employeeId}" class="baseInput" value="${peep.address2}" disabled/></td>
                <td class="city"><input id="city_${peep.employeeId}" class="baseInput" value="${peep.city}" disabled/></td>
                <td class="state"><input id="state_${peep.employeeId}" class="baseInput" value="${peep.state}" disabled/></td>
                <td class="zip"><input id="zip_${peep.employeeId}" class="baseInput" value="${peep.zip}" disabled/></td>
                <td class="phone"><input id="phone_${peep.employeeId}" class="baseInput" value="${peep.phone}" disabled/></td>
                <td class="startDate">${peep.startDate}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</form>
    <table>
        <tr>
            <td class="navigation">
                <a href="${pageContext.request.contextPath}/addPeep">
                    <div class="divLink">Add New Employee</div>
                </a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
