<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<table width="80%" cellpadding="20px" border="1px" style="text-align: center">
    <thead>
        <tr>
            <th>STT</th>
            <th>Ten</th>
            <th>Ngay Sinh</th>
            <th>Dia Chi</th>
            <th>Image</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${customerList}" var="customer" varStatus="count">
            <tr>
                <td>${count.count}</td>
                <td>${customer.name}</td>
                <td>${customer.birthday}</td>
                <td>${customer.address}</td>
                <td><img width="200px" height="200px" src="${customer.avatar}" alt="${customer.name}"></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>