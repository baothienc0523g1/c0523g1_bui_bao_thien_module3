<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/10/2023
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Danh sách bài học</h2>
<div class="container">
    <button type="button" class="btn btn-primary">Thêm mới</button>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>#</th>
            <th>Loại bài học</th>
            <th>Độ khó</th>
            <th>Module</th>
            <th>Link</th>
            <th colspan="2" style="text-align: center">Quản lý</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="baiHoc" items="${list}" varStatus="loop">
            <tr>
                <td><c:out value="${loop.count}"></c:out></td>
                <td>
                    <c:if test="${baiHoc.getMaLoaiBaiHoc() == 1}">
                        Thực Hành
                    </c:if>
                    <c:if test="${baiHoc.getMaLoaiBaiHoc() == 2}">
                        Lý Thuyết
                    </c:if>
                </td>
                <td>
                    <c:if test="${baiHoc.getDoKho() == 1}">
                        Dễ
                    </c:if>
                    <c:if test="${baiHoc.getDoKho() == 2}">
                        Trung Bình
                    </c:if>
                    <c:if test="${baiHoc.getDoKho() == 3}">
                        Khó
                    </c:if>
                        </td>
                <td>${baiHoc.getModule()}</td>
                <td>${baiHoc.getTenBaiHoc()}
                </td>
                <td><button type="button" class="btn btn-primary">Sửa</button></td>
                <td>
                    <button type="button" onclick="guiThongTin('${baiHoc.getMaBaiHoc()}','${baiHoc.getTenBaiHoc()}')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Xóa
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--modal--%>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: orangered">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Xóa dữ liệu bài học</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="maBaiHoc" id="maBaiHoc">
                <strong class="text-danger">
                    Bạn có chắc chắc xóa dữ liệu bài học: <span id="tenBaiHoc"> ?</span>
                </strong>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<%--modal end--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<%--scrip--%>
<script>
    function guiThongTin(maBaiHoc, tenBaiHoc) {
        document.getElementById("maBaiHoc").value = maBaiHoc;
        document.getElementById("tenBaiHoc").innerText = tenBaiHoc;

    }
</script>
<%--scrip--%>
</body>
</html>
