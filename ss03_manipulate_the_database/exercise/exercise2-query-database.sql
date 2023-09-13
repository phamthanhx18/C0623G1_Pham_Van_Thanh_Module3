USE `quanlybanhang`;

INSERT INTO `customer`(`customer_name`,`customer_age`)
VALUES
('Minh Quan',10),
('Ngoc Oanh',20),
('Hong Ha',50)
;

INSERT INTO `order`(`customer_id`,`order_date`,`order_total_price`)
VALUES
(1,'2006-3-21',null),
(2,'2006-3-23',null),
(1,'2006-3-16',null)
;

INSERT INTO `product`(`product_name`,`product_price`)
VALUES
('May giat',3),
('Tu lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2)
;

INSERT INTO `order_detail`(`order_id`,`product_id`,`order_qty`)
VALUES 
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3)
;
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT 
    *
FROM
    `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT 
    c.*, p.product_name
FROM
    `customer` c
        INNER JOIN
    `order` o ON c.customer_id = o.customer_id
        INNER JOIN
    `order_detail` od ON o.order_id = od.order_id
        INNER JOIN
    `product` p ON od.product_id = p.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT 
    *
FROM
    `customer` c
        LEFT JOIN
    `order` o ON c.customer_id = o.customer_id
WHERE
    o.customer_id IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của 
-- từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

SELECT 
    od.order_id,
    o.order_date,
    od.order_qty,
    p.product_price,
    (od.order_qty * p.product_price) AS totalprice
FROM
    `order_detail` od
        JOIN
    `order` o ON od.order_id = o.order_id
        JOIN
    `product` p ON od.product_id = p.product_id;

-- Total group by order_id
SELECT 
    od.order_id,
    o.order_date,
    SUM(od.order_qty * p.product_price) AS total
FROM
    `order_detail` od
        JOIN
    `order` o ON od.order_id = o.order_id
        JOIN
    `product` p ON od.product_id = p.product_id
GROUP BY order_id;


