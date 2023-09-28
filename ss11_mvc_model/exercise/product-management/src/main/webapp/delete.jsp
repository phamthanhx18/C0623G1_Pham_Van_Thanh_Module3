<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/28/2023
  Time: 12:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <h3>Bạn có chắc chắn xóa những sản phẩm có thông tin sau không?</h3>
    <p>Tên sản phẩm: ${product.getName()}</p>
    <p>Mô tả san pham: ${product.getDescription()}</p>
    <p>Gia sản phẩm: ${product.getPrice()}</p>
    <br>
    <button onclick="location.href='/products'" type="button">
        Không xóa, quay trở lại</button>
    <input type="submit" value="Xóa">
</form>
</body>
</html>
