<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/30/2023
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<html>
<head>
    <title>Title</title>
</head>
<body>
<button type="button" class="btn btn-outline-primary"><a href="/users?action=show-list">Back to list</a></button>

<form method="post">
  <table class="table table-striped">
      <input type="hidden" name="id" value="<c:out value="${user.id}"/>">
    <tr>
      <td>User name</td>
      <td><input type="text" name="name" value="<c:out value='${user.name}'/>"  placeholder="Enter user's name"/></td>
    </tr>
    <tr>
      <td>User email</td>
      <td><input type="text" name="email" value="<c:out value='${user.email}'/>" placeholder="Enter user's email"/></td>
    </tr>
    <tr>
      <td>User country</td>
      <td><input type="text" name="country" value="<c:out value='${user.country}'/>" placeholder="Enter user's country"/></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
        <input type="submit" value="Save">
      </td>
    </tr>
  </table>
</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
</body>
</html>
