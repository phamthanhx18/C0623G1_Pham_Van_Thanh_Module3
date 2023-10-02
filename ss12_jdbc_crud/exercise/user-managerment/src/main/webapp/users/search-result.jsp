<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/29/2023
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>Ket qua tim kiem cho Country: ${country}</h3>
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
