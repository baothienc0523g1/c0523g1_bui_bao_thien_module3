package com.repository;

import com.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getList();
    void addUser(User user);
    void edit(User user);
    void delete(int id);
    List<User> findByCountry(String country);
    List<User> sortByCountry();
    User getUserById(int id);
    void insertUserStore(User user);
}
