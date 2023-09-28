<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý sản phẩm</title>
</head>
<body>
<br/>
<a href="/products?action=create">Thêm sản phẩm</a>
<table cellpadding="5px" width="50%" border="1px" align="center">
    <thead>
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Xem</th>
        <th>Sửa</th>
        <th>Xóa</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach items='${productList}' var="products" varStatus="loop">
            <tr>
                <td>${products.getName()}</td>
                <td>${products.getDescription()}</td>
                <td>${products.getPrice()}</td>
                <td><a href="/products?action=view&id=${products.getId()}">Xem</a></td>
                <td><a href="/products?action=edit&id=${products.getId()}">Sửa</a></td>
                <td><a href="/products?action=delete&id=${products.getId()}">Xóa</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>