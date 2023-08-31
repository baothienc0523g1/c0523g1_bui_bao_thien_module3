<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 8/30/2023
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<html>
<head>
    <title>SHOW LIST</title>
</head>
<style>
    a {
        text-decoration: none;
    }
</style>
<body>
<center>
    <h1>User Management</h1>
</center>
<h4>
    <a href="/users?action=add">Add new user</a>
    </br>
    <a href="/users?action=add-transaction">Add new user with transaction</a>
    </br>
    <a href="/users?action=sort">Sort user by name</a>
</h4>
<div align="center">
    <div>
        <table class="table table-striped">
            <tr>
                <th>No.</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th colspan="2">Actions</th>
            </tr>
            <c:forEach var="user" items="${list}" varStatus="loop">
                <tr>
                    <td><c:out value="${loop.count}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.country}"/></td>
                    <td>
                        <button type="submit" class="btn btn-outline-primary">
                            <a href="/users?action=edit&id=${user.id}">Edit</a>
                        </button>
                    </td>
                    <td>
                        <button type="submit" class="btn btn-outline-danger" data-bs-toggle="modal"
                                data-bs-target="#exampleModal"
                                onclick="sendInformation('${user.id}','${user.name}')">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div>
        <table>
            <tr>
                <form action="/users?action=find" method="post">
                    <td><input type="text" name="country" placeholder="Name a country of user you want to display"
                               size="80"></td>
                    <td><input type="submit" value="Submit"></td>
                </form>
            </tr>
        </table>
    </div>
</div>
<%--Modal--%>
<div class="modal" tabindex="-1" id="exampleModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/users?action=delete" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Remove User Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input id="id_delete" name="id_delete" type="hidden"/>
                    Are you sure to remove user:
                    <span id="name_delete"></span>?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </div>
            </form>

        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script>
    function sendInformation(id, name) {
        document.getElementById("name_delete").innerText = name;
        document.getElementById("id_delete").value = id;
    }
</script>
</body>
</html>
