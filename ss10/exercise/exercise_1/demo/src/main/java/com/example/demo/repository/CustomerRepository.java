package com.example.demo.repository;

import com.example.demo.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository{
    private static List<Customer> list;
    static {
        list = new ArrayList<>();
        list.add(new Customer(1, "My Lien","1996-09-20","Da Nang","https://cdn.chanhtuoi.com/uploads/2020/05/icon-facebook-19-2.jpg.webp"));
        list.add(new Customer(2,"Bao Thien","1995-08-04","Dong Hoi","https://cdn.chanhtuoi.com/uploads/2020/05/icon-facebook-05-2.jpg.webp"));
        list.add(new Customer(3,"Phuoc Hung","1994-08-04","Hoi An","https://cdn.chanhtuoi.com/uploads/2020/05/icon-facebook-33-2.jpg.webp"));
        list.add(new Customer(4,"Hue Minh","1998-08-04","Da Neng","https://cdn.chanhtuoi.com/uploads/2020/05/icon-facebook-17-1.jpg.webp"));
        list.add(new Customer(5,"Van Lam","2000-08-04","Dong Hoi","https://cdn.chanhtuoi.com/uploads/2020/05/icon-facebook-07-1.jpg.webp"));
    }
    @Override
    public List<Customer> getList() {
        return list;
    }
}
