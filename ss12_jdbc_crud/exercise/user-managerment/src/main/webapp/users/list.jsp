<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP - Hello World</title>
</head>
<body>
<h2>Danh sách người dùng</h2>
<a href="?action=create">Thêm mới user</a>
<form action="?action=search" method="post">
    <input type="text" id="country" name="country"><br><br>
    <input type="submit" value="Tim kiem">
</form>
<table border="1px" cellpadding="5px" width="70%" align="center" style="text-align: center">
    <thead>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Xem</th>
        <th>Sửa</th>
        <th>Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="user" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td><a href="?action=view&id=${user.getId()}">Xem</a></td>
            <td><a href="?action=edit&id=${user.getId()}">Sửa</a></td>
            <td><a href="?action=delete&id=${user.getId()}">Xóa</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>