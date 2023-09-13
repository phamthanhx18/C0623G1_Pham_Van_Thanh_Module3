CREATE DATABASE QuanLyBanHang;

USE QuanLyBanHang;
CREATE TABLE Product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    product_price FLOAT NOT NULL
);

CREATE TABLE Customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_age INT NOT NULL
);

CREATE TABLE `Order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
    order_date date NOT NULL,
    order_total_price FLOAT NOT NULL
);

CREATE TABLE order_detail(
	order_id INT NOT NULL,
    product_id INT NOT NULL,
    order_qty INT CHECK (order_qty>0),
	FOREIGN KEY(order_id) REFERENCES `Order`(order_id),
	FOREIGN KEY(product_id) REFERENCES Product(product_id),
    PRIMARY KEY(order_id,product_id)
);