package com.example.productmanagement.repository.impl;

import com.example.productmanagement.model.Product;
import com.example.productmanagement.repository.IProductRepo;

import java.util.ArrayList;
import java.util.List;

public class ProductRepoImpl implements IProductRepo {
    private static final List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product(1, "Laptop Dell", "Laptop Dell 5560 gia re mau xanh", 1500));
        productList.add(new Product(2, "Laptop Nitro", "Laptop Nitro gia re", 2000));
        productList.add(new Product(3, "Laptop XPS", "Laptop XPS gia re", 3500));
        productList.add(new Product(4, "Laptop Macbook", "Laptop Macbook gia re", 1000));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
        product.setId(productList.size() + 1);
    }

    @Override
    public Product findById(int id) {
        for (Product product : productList) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
        if (findById(id) != null) {
            int index = productList.indexOf(findById(id));
            productList.set(index, product);
        }
    }

    @Override
    public void remove(int id) {
        if (findById(id) != null) {
            productList.remove(findById(id));
        }
    }
}
