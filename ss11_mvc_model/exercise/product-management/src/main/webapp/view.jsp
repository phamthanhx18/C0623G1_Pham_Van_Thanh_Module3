<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/28/2023
  Time: 12:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thông tin chi tiết ${product.getName()}</title>
</head>
<body>
<h1> Thông tin chi tiết ${product.getName()}</h1>
<p>Tên sản phẩm: ${product.getName()}</p>
<p>Mô tả san pham: ${product.getDescription()}</p>
<p>Gia sản phẩm: ${product.getPrice()}</p>
<a href="/products">Quay lai danh sach</a>
</body>
</html>
