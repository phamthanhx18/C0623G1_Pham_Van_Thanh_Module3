<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/29/2023
  Time: 1:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Ban co chac chan xoa nguoi dung nay khong</h3>
<form action="?action=delete&id=${user.getId()}" method="post">
    <h3>Thong tin nguoi dung</h3>
    <p>Ten: ${user.getName()}</p>
    <p>Email: ${user.getEmail()}</p>
    <p>Country ${user.getCountry()}</p>
    <button><a href="/users">Quay lai danh sach</a></button>
    <input type="submit" value="Xoa">
</form>


</body>
</html>
