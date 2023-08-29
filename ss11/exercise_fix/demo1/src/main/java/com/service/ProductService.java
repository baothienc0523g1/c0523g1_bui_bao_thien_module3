package com.service;

import com.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService{
    private static Map<Integer, Product> products;
    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Sting", 9000.0,"Nuoc giai khat","Pepsi-Co"));
        products.put(2, new Product(2, "Coca Cola", 10000.0,"Nuoc giai khat","Coca"));
        products.put(3, new Product(3, "Pepsi", 10000.0,"Nuoc giai khat","Pepsi"));
        products.put(4, new Product(4, "Tiger", 15000.0,"Nuoc giai sau","Tiger"));
        products.put(5, new Product(5, "Huda", 12000.0,"Nuoc giai sau","Huda"));
    }
    @Override
    public List<Product> getList() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void add(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public void edit(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void delete(int id) {
        products.remove(id);
    }

    @Override
    public Product findById(int id) {
        Product product =  products.get(id);
        return product;
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> temp = new ArrayList<>(products.values());
        List<Product> result = new ArrayList<>();
        for(Product product : temp) {
            String findName = product.getName();
            if (findName.contains(name)) {
                result.add(product);
            }
        }
        return result;
    }
}
