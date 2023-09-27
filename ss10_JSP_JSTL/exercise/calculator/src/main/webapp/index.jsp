<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple Caculator</h1>
<form action="/caculator" method="post">
    <div id="caculator" class="form-group">
        NumberA: <input type="number" class="form-control" name="numberA" id="numberA"><br><br>
        Operator:
        <select name="operator" id="operator">
            <option value="plus">Cộng</option>
            <option value="minus">Trừ</option>
            <option value="multiplication">Nhân</option>
            <option value="division">Chia</option>
        </select>
        <br>
        <br>
        NumberB: <input type="number" class="form-control" name="numberB" id="numberB"><br>
    </div>
    <br>
    <input type="submit" value="Tính">
</form>
</body>
</html>