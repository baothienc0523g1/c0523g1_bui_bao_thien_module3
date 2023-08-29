<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/29/2023
  Time: 7:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/products?action=findName">
    <table>
        <tr>
            <td>Product name?</td>
            <td><input type="text" name="name" placeholder="Product name"></td>
            <td><input type="submit" value="Confirm"/></td>
        </tr>
    </table>
</form>
</body>
</html>
