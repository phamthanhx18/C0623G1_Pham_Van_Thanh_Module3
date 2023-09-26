<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Product Discount Calculator" %>
</h1>
<br/>
<form action="/display-discount" method="post">
    <label>Product Description:
        <input type="text" name="description" placeholder="Product Description"/><br/>
    </label><br/>
    <label>List Price:
        <input type="number" name="price" placeholder="Product Price"/><br/>
    </label><br/>
    <label>Discount Percent:
        <input type="number" name="percent" placeholder="Discount Percent"/>
    </label><br/>
    <br/>
    <input type="submit" id="submit" value="Tính chiết khẩu"/>
</form>

</body>
</html>