create database QuanLyBanHang;

use QuanLyBanHang;
create table Product(
	product_id int primary key auto_increment,
    product_name varchar(100),
    product_price float
);

create table Customer(
	customer_id int primary key auto_increment,
    customer_name varchar(100),
    customer_age int
);

create table `Order`(
	order_id int primary key auto_increment,
    customer_id int,
    foreign key(customer_id) references Customer(customer_id),
    order_date date,
    order_total_price float
);

create table order_detail(
	order_id int,
    product_id int,
    order_quantity int,
	foreign key(order_id) references `Order`(order_id),
	foreign key(product_id) references Product(product_id),
    primary key(order_id,product_id)
);