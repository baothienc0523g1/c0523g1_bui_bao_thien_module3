<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/30/2023
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Cant not find</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=show-list">Back to list</a>
    </h2>
</center>
<h1><c:out value="${notice}"/></h1>
</body>
</html>
