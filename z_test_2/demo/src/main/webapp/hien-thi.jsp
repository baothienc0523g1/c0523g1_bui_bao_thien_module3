<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/11/2023
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <title>Title</title>
</head>
<style>
    body {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        overflow: hidden;
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
</style>
<body>
<div class="header">
    <img src="https://cdn.codegym.vn/wp-content/uploads/2021/08/CodeGym-Logo.webp" alt="">
</div>
<div class="container mt-3">
    <table class="table table-hover" id="thongKe" nonce="thongKe">
        <thead>
        <tr>
            <th>#</th>
            <th>Độ khó</th>
            <th>Module</th>
            <th>Tên bài học</th>
            <th>Loại bài học</th>
            <th colspan="2">Quản lý</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="li" items="${list}" varStatus="loop">
            <tr>
                <td><c:out value="${loop.count}"></c:out></td>
                <td>
                    <c:if test="${li.getDoKho() == 1}">
                        Dễ
                    </c:if>
                    <c:if test="${li.getDoKho() == 2}">
                        Trung bình
                    </c:if>
                    <c:if test="${li.getDoKho() == 3}">
                        Khó
                    </c:if>
                </td>
                <td>
                        ${li.getModule()}
                </td>
                <td>
                        ${li.getTenBaiHoc()}
                </td>
                <td>
                    <c:if test="${li.getMaLoaiBaiHoc() == 1}">
                        Thực hành
                    </c:if>
                    <c:if test="${li.getMaLoaiBaiHoc() == 2}">
                        Lý thuyết
                    </c:if>
                </td>
                <td>
                    <button type="button" class="btn btn-outline-primary"><a
                            href="bai-hoc?action=sua&maBaiHoc=${li.maBaiHoc}"
                    >Sửa</a></button>
                </td>
                <td>
                    <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
                            data-bs-target="#exampleModal"
                            onclick="guiThongTin('${li.getMaBaiHoc()}','${li.getTenBaiHoc()}')">
                        Xóa
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="container mt-3">
    <button type="button" class="btn btn-outline-primary"><a href="bai-hoc?action=themMoi">Thêm mới nội dung đào tạo</a></button>
</div>

<%--modal--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="bai-hoc?action=xoa" method="post">
            <div class="modal-content">
                <div class="modal-header" style="background-color: orangered; color:#000;">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="maBaiHoc" id="maBaiHoc">
                    <strong>Bạn có chắc chắc muốn xóa <span id="tenBaiHoc"></span></strong>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%--modal end--%>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#thongKe').DataTable({
            language: {
                "decimal": ",",
                "thousands": ".",
                "sEmptyTable": "Không có dữ liệu",
                "sInfo": "Đang hiển thị _START_ đến _END_ của tổng số _TOTAL_ mục",
                "sInfoEmpty": "Đang hiển thị 0 đến 0 của tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ tổng số _MAX_ mục)",
                "sInfoPostFix": "",
                "sInfoThousands": ",",
                "sLengthMenu": "Hiển thị _MENU_ mục",
                "sLoadingRecords": "Đang tải...",
                "sProcessing": "Đang xử lý...",
                "sSearch": "Tìm kiếm:",
                "Show:": "",
                "entries": "",
                "oPaginate": {
                    "sFirst": "Đầu",
                    "sLast": "Cuối",
                    "sNext": "Tiếp",
                    "sPrevious": "Trước"
                },

            },
            color: {
                "oPaginate": {
                    "sFirst": "blue",
                    "sLast": "green",
                    "sNext": "green",
                    "sPrevious": "blue"
                },
            }
        });
    });
</script>
<script>
    function guiThongTin(maBaiHoc, tenBaiHoc) {
        document.getElementById("maBaiHoc").value = maBaiHoc;
        document.getElementById("tenBaiHoc").innerText = tenBaiHoc;
    }
</script>
</html>
