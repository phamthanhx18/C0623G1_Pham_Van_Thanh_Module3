package com.example.productmanagement.service.impl;

import com.example.productmanagement.model.Product;
import com.example.productmanagement.repository.IProductRepo;
import com.example.productmanagement.repository.impl.ProductRepoImpl;
import com.example.productmanagement.service.IProductService;
import org.omg.CosNaming.NamingContextPackage.NotFound;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    IProductRepo productRepo = new ProductRepoImpl();
    @Override
    public List<Product> findAll() {
        return productRepo.findAll();
    }

    @Override
    public void add(Product product) {
        productRepo.add(product);
    }

    @Override
    public Product findById(int id) {
        return productRepo.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        productRepo.update(id,product);
    }

    @Override
    public void remove(int id) throws Exception {
        Product product = productRepo.findById(id);
        if (product == null) {
           throw new Exception("Khong tim thay");
        } else {
            productRepo.remove(id);
        }
    }
}
