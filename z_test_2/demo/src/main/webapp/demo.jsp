<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/11/2023
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    body {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        overflow: hidden;
        display: grid;
    }

    .header {
        display: grid;
        height: 70px;
        background-color: #2b287f;
        width: 100%;
        justify-items: center;
        align-items: center;
    }

    a {
        text-decoration: none;
    }
    a:hover {
        color: white;
    }
    table {
        border: 1px solid blue;
        border-radius: 5px;
        place-self: center;
    }
</style>
<body>

<div class="header">
    <img src="logo.png" alt="">
</div>
<div class="container mt-3 ">
    <form action="/bai-hoc?action=themMoi" method="post">
        <table>
            <tr>
                <td>
                    <label for="maLoaiBaiHoc">Loại bài học:</label>
                </td>
                <td>
                    <select name="maLoaiBaiHoc" id="maLoaiBaiHoc">
                        <c:forEach items="${danhSachTenBaiHoc}" var="baiHoc">
                            <option value="${baiHoc.getMaLoaiBaiHoc()}"><c:out value="${baiHoc.getTenLoaiBaiHoc()}"></c:out></option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="doKho">Độ khó:</label>
                </td>
                <td>
                    <select name="doKho" id="doKho">
                        <c:forEach items="${danhSachDoKho}" var="doKho">
                            <option value="${doKho}"><c:out value="${doKho}"></c:out> </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="module">Module:</label>
                </td>
                <td>
                    <select name="module" id="module">
                        <c:forEach items="${danhSachModule}" var="module">
                            <option value="${module}"><c:out value="${module}"></c:out> </option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="tenBaiHoc">Tên bài học</label>
                </td>
                <td>
                    <input type="text" id="tenBaiHoc" name="tenBaiHoc">
                </td>
            </tr>
            <tr>
                <td colspan="2"><button type="submit">OK</button></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
