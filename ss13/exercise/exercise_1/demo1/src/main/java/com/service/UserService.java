package com.service;

import com.model.User;
import com.repository.IUserRepository;
import com.repository.UserRepository;


import java.util.List;

public class UserService implements IUserService{
    private IUserRepository repository = new UserRepository();
    @Override
    public List<User> getList() {
        List<User> list = repository.getList();
        return list;
    }

    @Override
    public void edit(User user) {
        repository.edit(user);
    }

    @Override
    public void addUser(User user) {
        repository.addUser(user);
    }


    @Override
    public User selectUser(int id) {
        return repository.selectUser(id);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }
    @Override
    public List<User> findByCountry(String country) {
        List<User> list = repository.findByCountry(country);
        return list;
    }

    @Override
    public List<User> sortByCountry() {
        List<User> list = repository.sortByCountry();
        return list;
    }
}
