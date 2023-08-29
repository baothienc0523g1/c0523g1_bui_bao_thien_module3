<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2023
  Time: 6:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<h1>Find product by ID</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
<table>
    <tr>
        <td>Enter product ID</td>
        <td><input type="number" name="id"></td>
    </tr>
    <tr>
        <td>Enter product name</td>
        <td><input type="text" name="name"></td>
    </tr>
    <tr>
        <td>Enter product price</td>
        <td><input type="number" name="price"></td>
    </tr>
    <tr>
        <td>Enter product description</td>
        <td><input type="text" name="description"></td>
    </tr>
    <tr>
        <td>Enter product brand</td>
        <td><input type="text" name="brand"></td>
    </tr>
    <tr>
        <td colspan="2"><button type="submit">Submit</button></td>
    </tr>
</table>
</form>
</body>
</html>
