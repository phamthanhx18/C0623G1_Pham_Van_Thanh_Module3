<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>
<h3>Them moi nguoi dung</h3>
<form action="?action=create" method="post">
    <label for="name">Name:</label><br>
    <input type="text" id="name" name="name" ><br><br>
    <label for="email">Email:</label><br>
    <input type="text" id="email" name="email" ><br><br>
    <label for="country">Country:</label><br>
    <input type="text" id="country" name="country" ><br><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
