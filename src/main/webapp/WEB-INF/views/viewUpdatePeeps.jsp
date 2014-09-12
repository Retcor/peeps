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
        <caption>Employees</caption>
        <tr>
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

<script type="text/javascript">
    $(function() {
        // ======= List.JS Required Information =============
        // List.JS needs this information to know what to search
        options = {
            valueNames: [ 'employeeId', 'firstName', 'lastName', 'address1', 'address2',
                'city', 'state', 'zip', 'phone', 'startDate' ]
        };

        var userList = new List('peeps', options);

        $("#searchOptions").change(function() {
            var selected = $("#searchOptions").val();

            if (selected == "employeeId") {
                options = {
                    valueNames: [ 'employeeId' ]
                };
            } else if (selected == 'firstName') {
                options = {
                    valueNames: [ 'firstName' ]
                };
            } else if (selected == 'lastName') {
                options = {
                    valueNames: [ 'lastName' ]
                };
            } else if (selected == 'startDate') {
                options = {
                    valueNames: [ 'startDate' ]
                };
            } else if (selected == "all") {
                options = {
                    valueNames: [ 'employeeId', 'firstName', 'lastName', 'address1', 'address2',
                        'city', 'state', 'zip', 'phone', 'startDate' ]
                };
            }

            userList = new List('peeps', options);
        });

        // ==================================================

        $("#search").keyup(function() {
            if($(this).val() != '') {
                $("#searchOptions").attr("disabled", true);
            } else {
                $("#searchOptions").attr("disabled", false);
            }
        })
    });

//    $(document).ready(function() {
//        if ($("#search").val().length > 0) {
//            $("#searchOptions").attr("disabled", "disabled");
//        }
//    })

</script>
</body>
</html>
