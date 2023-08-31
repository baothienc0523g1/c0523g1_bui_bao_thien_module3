<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/30/2023
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<html>
<head>
    <title>Sort By Country</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <button type="button" class="btn btn-outline-primary"><a href="/users?action=show-list">Back to list</a></button>
    </h2>
</center>
<div align="center">
    <div>
        <table class="table table-striped">
            <tr>
                <th>No.</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
            </tr>
            <c:forEach var="user" items="${list}" varStatus="loop">
                <tr>
                    <td><c:out value="${loop.count}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.country}"/></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
</body>
</html>
