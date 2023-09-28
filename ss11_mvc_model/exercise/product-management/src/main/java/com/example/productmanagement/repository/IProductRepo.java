package com.example.productmanagement.repository;

import com.example.productmanagement.model.Product;

import java.util.List;

public interface IProductRepo {
    List<Product> findAll();

    void add(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);
}
