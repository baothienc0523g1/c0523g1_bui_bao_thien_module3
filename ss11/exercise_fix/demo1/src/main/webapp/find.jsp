<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2023
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Find by ID</title>
</head>
<body>
<h1>Find product by ID</h1>
<p>
    <a href="/products">Back to product list</a>
</p>


<form method="post" action="/products?action=find">
    <table>
        <tr>
            <td>Product ID</td>
            <td><input type="number" name="id" placeholder="Product ID"></td>
            <td><input type="submit" value="Confirm"/></td>
        </tr>
    </table>
</form>


</body>
</html>
