<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/28/2023
  Time: 12:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<p style="color: red">${error}</p>

<form method="post">
    <label for="name">Tên sản phẩm</label>
    <input type="text" name="name" id="name" value="${product.getName()}"><br><br>
    <label for="description">Tên sản phẩm</label>
    <input type="text" name="description" id="description" value="${product.getDescription()}"><br><br>
    <label for="price">Giá sản phẩm</label>
    <input type="number" name="price" id="price" value="${product.getPrice()}"><br><br>
    <input type="submit" value="Cập nhật">
</form>
</body>
</html>
