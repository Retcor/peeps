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
    <title>Peeps</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/addPeep"> <label>Add a Peep</label></a>

<div id="peeps">
    <input class="search" placeholder="Search"/>
    <button class="sort" data-sort="name">
        Sort by name
    </button>

    <table>
        <tbody class="list">
            <c:forEach items="${peeps}" var="customer">
            <tr>
                <td class="firstName">${customer.firstName}</td>
                <td class="LastName">${customer.lastName}</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

<script src="${pageContext.request.contextPath}/resources/js/list.js"></script>
<script type="text/javascript">
    var options = {
        valueNames: [ 'firstName', 'lastName' ]
    };

    //  new List(div id name, var above)
    var userList = new List('peeps', options);
</script>
</body>
</html>
