<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2023
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<p>
  <a href="/products">Back to product list</a>
</p>
<form method="post">
  <h3>Are you sure</h3>
  <legend>Product</legend>
  <table>
    <tr>
      <td>Enter product ID</td>
      <td><input type="number" name="id" placeholder="Enter product ID"></td>
      <td><input type="submit" value="Confirm"/></td>
    </tr>
  </table>
</form>
</body>
</html>
