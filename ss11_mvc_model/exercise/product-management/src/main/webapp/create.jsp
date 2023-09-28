<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/28/2023
  Time: 11:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Thêm mới sản phẩm</h2>
<p style="color: red">${error}</p>
<form method="post">
    <label for="name">Tên sản phẩm</label>
    <input type="text" name="name" id="name"><br><br>
    <label for="description">Tên sản phẩm</label>
    <input type="text" name="description" id="description"><br><br>
    <label for="price">Giá sản phẩm</label>
    <input type="number" name="price" id="price"><br><br>
    <input type="submit" value="Thêm sản phẩm">
</form>
</body>
</html>
