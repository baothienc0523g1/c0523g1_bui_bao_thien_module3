package com.service;

import com.model.User;

import java.util.List;

public interface IUserService {
    List<User> getList();
    void addUser(User user);
    User selectUser(int id);
    void edit(User user) ;
    void delete(int id);
    List<User> findByCountry(String country);
    List<User> sortByCountry();

}
