CREATE DATABASE QuanLyBanHang;

USE QuanLyBanHang;
CREATE TABLE Product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    product_price FLOAT
);

CREATE TABLE Customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    customer_age INT
);

CREATE TABLE `Order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
    order_date date,
    order_total_price FLOAT
);

CREATE TABLE order_detail(
	order_id INT,
    product_id INT,
	FOREIGN KEY(order_id) REFERENCES `Order`(order_id),
	FOREIGN KEY(product_id) REFERENCES Product(product_id)
);