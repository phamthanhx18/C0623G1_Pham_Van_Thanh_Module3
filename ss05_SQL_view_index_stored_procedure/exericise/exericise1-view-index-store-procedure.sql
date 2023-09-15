CREATE DATABASE demo;

USE demo;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(50) NOT NULL UNIQUE,
    product_name VARCHAR(50) NOT NULL,
    product_price DOUBLE CHECK (product_price > 0),
    product_amount INT CHECK (product_amount >= 0),
    product_description VARCHAR(256),
    product_status BIT
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values
('P001','Áo thun nam','150000','50','Áo thun nam kiểu dáng đơn giản và thoải mái',1),
('P002','Quần jeans nữ','300000','30','Quần jeans nữ có kiểu dáng phong cách và chất lượng tốt',1),
('P003','Đầm dạo phố','250000','0','Đầm dạo phố thời trang và thoải mái',0);

-- Thao tác với index
EXPLAIN SELECT * FROM products WHERE product_name = 'Áo thun nam'; 
ALTER TABLE products ADD INDEX index_product_code(product_code);
ALTER TABLE products ADD INDEX index_name_price(product_name, product_price);
EXPLAIN SELECT * FROM products WHERE product_name = 'Áo thun nam'; 

DROP INDEX index_name_price
ON products;

-- Thao tác với VIEW
CREATE VIEW product_views AS
SELECT product_code, product_name, product_price,product_status
FROM  products;

SELECT 
    *
FROM
    product_views;
    
CREATE OR REPLACE VIEW product_views AS
SELECT product_code, product_name, product_price, product_status
FROM products
WHERE product_status = '1';

DROP VIEW product_views;

-- Thao tác với Store Procedure
DELIMITER //

-- Hien thi danh sach
CREATE PROCEDURE findAllProduct()
BEGIN
  SELECT * FROM products;
END //
DELIMITER ;

CALL findAllProduct();

--  Them san pham moi
DELIMITER //
CREATE PROCEDURE addNewProduct(
	product_code VARCHAR(50),
    product_name VARCHAR(50),
    product_price DOUBLE,
    product_amount INT,
    product_description VARCHAR(256),
    product_status BIT)
BEGIN
INSERT INTO products(product_code,product_name,product_price,product_amount,product_description,product_status)
VALUES(product_code,product_name,product_price,product_amount,product_description,product_status);
END //
DELIMITER ;

CALL addNewProduct('P004','Vay dạo phố','250000','0','Vay dạo phố thời trang và thoải mái',0);

-- Update san pham
DELIMITER //
CREATE PROCEDURE editProduct(
	product_id int,
	product_code VARCHAR(50),
    product_name VARCHAR(50),
    product_price DOUBLE,
    product_amount INT,
    product_description VARCHAR(256),
    product_status BIT)
BEGIN
	UPDATE products
    SET
    product_code = product_code,
    product_name = product_name,
    product_price = product_price,
    product_amount = product_amount,
    product_description = product_description,
    product_status = product_status
    WHERE id = product_id;
END //
DELIMITER ;

CALL editProduct(4,'P004','Vay xinh dạo phố','250000','0','Vay dạo phố thời trang và thoải mái',0);

-- Xoa san pham theo id
DELIMITER //
CREATE PROCEDURE deleteProduct(
	product_id int)
BEGIN
	DELETE FROM products
    WHERE id = product_id;
END //
DELIMITER ;

CALL deleteProduct(4);

