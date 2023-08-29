<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2023
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add</title>
</head>
<body>
<h1>Add new product</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post" action="/products?action=add">
    <table>
        <thead>
        <th>Product Information</th>
        </thead>
        <tbody>
        <tr>
        <tr>
            <td>ID: </td>
            <td><input type="number" name="id" id="id" placeholder="ID"/></td>
        </tr>
        <tr>
            <td>Name: </td>
            <td><input type="text" name="name" id="name" placeholder="Name"/></td>
        </tr>
        <tr>
            <td>Price: </td>
            <td><input type="number" name="price" id="price" placeholder="Price"/></td>
        </tr>
        <tr>
            <td>Description: </td>
            <td><input type="text" name="description" id="description" placeholder="Description"/></td>
        </tr>
        <tr>
            <td>Brand: </td>
            <td><input type="text" name="brand" id="brand" placeholder="Brand"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Create product"></td>
        </tr>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>
