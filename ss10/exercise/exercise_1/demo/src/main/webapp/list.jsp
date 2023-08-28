<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/28/2023
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    table {
        border: 1px solid #191da4;
        box-shadow: 2px 2px 3px 4px #6255a4;
        border-radius: 2%;
        border-collapse: collapse;
    }
</style>
<body>
<table border="1px">
    <thead>
    <th colspan="4">Danh sách khách hàng</th>
    </thead>
    <tr>
        <td>Ten</td>
        <td>Ngay seen</td>
        <td>Dia chi</td>
        <td>Anh</td>
    </tr>
    <tbody>
    <c:forEach var="c" items="${list}">
        <tr>
            <td><c:out value="${c.name}"/></td>
            <td><c:out value="${c.birthDay}"/></td>
            <td><c:out value="${c.address}"/></td>
            <td><img src="${c.image}" width="60px" height="60px"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
