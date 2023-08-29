<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2023
  Time: 7:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Find By Name Result</title>
</head>
<body>
<p>
    <a href="/products">Back to product list</a>
</p>
<h1>Find By Name Result</h1>
<table>
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Brand</td>
    </tr>
    <c:forEach items="${product}" var="product" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getBrand()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
