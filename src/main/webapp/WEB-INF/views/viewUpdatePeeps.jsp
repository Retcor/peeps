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
    <script src="${pageContext.request.contextPath}/resources/js/jquery.autosize.js"></script>
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

    <table>
        <tr>
            <td class="navigation">
                <a href="${pageContext.request.contextPath}/addPeep">
                    <div class="divLink">Add New Employee</div>
                </a>
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
                <td id="tdEdit_${peep.employeeId}"><input id="edit_${peep.employeeId}" type="button" class="sexyButton" value="Edit"/></td>
                <td id="tdUpdate_${peep.employeeId}" hidden="hidden"><input id="update_${peep.employeeId}" type="button" class="sexyButton" value="Update" hidden="hidden"/></td>
                <td class="employeeId"><input type="hidden" id="employeeId_${peep.employeeId}" value="${peep.employeeId}"/>${peep.employeeId}</td>
                <%-- ============== All the editable fields ================ --%>
                <td class="firstName"><textarea id="firstName_${peep.employeeId}" class="baseInput" rows="1" cols="15" readonly>${peep.firstName}</textarea></td>
                <td class="lastName"><textarea rows="1" cols="15" id="lastName_${peep.employeeId}" class="baseInput" readonly>${peep.lastName}</textarea></td>
                <td class="address1"><textarea rows="1" cols="15" id="address1_${peep.employeeId}" class="baseInput" readonly>${peep.address1}</textarea></td>
                <td class="address2"><textarea rows="1" cols="15" id="address2_${peep.employeeId}" class="baseInput" readonly>${peep.address2}</textarea></td>
                <td class="city"><textarea rows="1" cols="15" id="city_${peep.employeeId}" class="baseInput" readonly>${peep.city}</textarea></td>
                <td class="state"><textarea rows="1" cols="5" id="state_${peep.employeeId}" class="baseInput" readonly>${peep.state}</textarea></td>
                <td class="zip"><textarea rows="1" cols="10" id="zip_${peep.employeeId}" class="baseInput" readonly>${peep.zip}</textarea></td>
                <td class="phone"><textarea rows="1" cols="13" id="phone_${peep.employeeId}" class="baseInput" readonly>${peep.phone}</textarea></td>
                <%-- ======================================================= --%>
                <td class="startDate"><input type="hidden" id="startDate_${peep.employeeId}" value="${peep.startDate}"/>${peep.startDate}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</form>

</div>
</body>
</html>
