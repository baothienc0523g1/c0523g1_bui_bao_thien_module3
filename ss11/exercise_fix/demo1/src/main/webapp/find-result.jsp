<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2023
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Find result</title>
    <style>
        a {
            text-decoration: underline;
        }

        table tr td{
            border: 1px solid rgba(19, 23, 19, 0.95);
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<p>
    <a href="/products">Back to product list</a>
</p>
<table>
    <tr>
        <td><c:out value="${product.getName()}"/></td>
        <td><c:out value="${product.getPrice()}"/></td>
        <td><c:out value="${product.getDescription()}"/></td>
        <td><c:out value="${product.getBrand()}"/></td>
    </tr>
</table>
</body>
</html>
