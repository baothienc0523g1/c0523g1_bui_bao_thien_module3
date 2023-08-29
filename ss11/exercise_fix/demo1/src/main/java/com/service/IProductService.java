package com.service;

import com.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getList();
    void add(Product product);
    void edit(int id, Product product);
    void delete(int id);
    Product findById(int id);
    List<Product> findByName(String name);
}
