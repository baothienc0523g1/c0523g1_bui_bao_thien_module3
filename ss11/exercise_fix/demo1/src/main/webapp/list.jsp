<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2023
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product list</title>
</head>
<style>
    a {
        text-decoration: underline;
    }
    table {
        border: 1px solid rgba(19,23,19,0.95);
        border-collapse: collapse;
    }
    .menu-action {
        text-align: center;
    }
</style>
<body>
<h1>Products</h1>
<p>
    <a href="/products?action=add">Add new Product</a>
</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Brand</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/products?action=list&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getBrand()}</td>

        </tr>
    </c:forEach>
    <tr>
        <td class="menu-action" colspan="4"><a href="/products?action=edit">Edit</a></td>
    </tr>
    <tr>
        <td class="menu-action" colspan="4"><a href="/products?action=delete">Delete</a></td>
    </tr>
    <tr>
        <td class="menu-action" colspan="4"><a href="/products?action=find">Find by ID</a></td>
    </tr>
    <tr>
        <td class="menu-action" colspan="4"><a href="/products?action=findName">Find by name</a></td>
    </tr>
</table>
</body>
</html>
