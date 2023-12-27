<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/11/2023
  Time: 5:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="bai-hoc?action=sua" method="post">
  <input type="hidden" value="${maBaiHoc}" name="maBaiHoc" id="maBaiHoc">
  <label for="doKho">Độ khó</label>
  <select name="doKho" id="doKho">
    <option value="1">Dễ</option>
    <option value="2">Trung bình</option>
    <option value="3">Khó</option>
  </select>
  <label for="module">Module</label>
  <select name="module" id="module">
    <option value="1">Module 1</option>
    <option value="2">Module 2</option>
    <option value="3">Module 3</option>
  </select>
  <label for="tenBaiHoc">Tên bài học</label>
  <input type="text" id="tenBaiHoc" name="tenBaiHoc" value="${baiHoc.getTenBaiHoc()}">
  <label for="loaiBaiHoc">Loại bài hoc</label>
  <select name="loaiBaiHoc" id="loaiBaiHoc">
    <option value="1">Lý thuyết</option>
    <option value="2">Thực hành</option>
  </select>
  <button type="submit"> Xác nhận</button>
</form>
</body>
</html>
