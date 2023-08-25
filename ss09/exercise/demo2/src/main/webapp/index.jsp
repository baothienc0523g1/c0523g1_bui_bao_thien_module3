<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>[Bài tập] Ứng dụng Product Discount Calculator</h1>
<form action="/display-discount" method="post">
    <h4>Description: The white iPhone 3G(S) is very beautiful, but the black one is too when it is in good shape</h4>
    <table>
        <tr>
            <td><label for="listPrice">List Price</label></td>
            <td><input type="text" name="listPrice"></td>
        </tr>
        <tr>
            <td><label for="discountPercent">Discount Percent</label></td>
            <td><input type="text" name="discountPercent"></td>
        </tr>
        <tr colspan="2">
            <td><button type="submit">Confirm</button></td>
        </tr>
    </table>

</form>
<h3>Discount Amount: ${discountAmount} </h3>
</body>
</html>