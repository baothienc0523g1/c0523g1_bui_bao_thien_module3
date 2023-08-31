package com.repository;

import com.model.User;
import com.sun.org.apache.regexp.internal.RE;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository{
    private static final String GET_LIST_SP =  "call showList();";
    private static final String INSERT_SP =  "call insert_user(?,?,?);";
    private static final String DELETE_SP =  "call delete_user(?);";
    private static final String EDIT_SP =  "call edit_user(?,?,?,?);";
    private static final String SELECT_BY_ID_SP =  "call select_by_id(?);";
    private static final String FIND_BY_COUNTRY =  "call find_by_country(?);";
    private static final String SORT_BY_COUNTRY =  "call sort_by_name;";



    @Override
    public List<User> getList() {
        Connection connection = BaseRepository.getConnection();
        List<User> list = new ArrayList<>();

        try {
            CallableStatement callableStatement = connection.prepareCall(GET_LIST_SP);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void addUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT_SP);
            callableStatement.setString(1,user.getName());
            callableStatement.setString(2,user.getEmail());
            callableStatement.setString(3,user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void edit(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(EDIT_SP);
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2,user.getName());
            callableStatement.setString(3,user.getEmail());
            callableStatement.setString(4,user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_BY_ID_SP);
            callableStatement.setInt(1, id);
            ResultSet resultSet = callableStatement.executeQuery();

            while (resultSet.next()) {
                int new_id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(new_id, name, email, country);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    public void delete(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_SP);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> findResult = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_BY_COUNTRY);
            callableStatement.setString(1, '%' + country + '%');
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String find_country = resultSet.getString("country");
                findResult.add(new User(id, name, email, find_country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return findResult;
    }

    @Override
    public List<User> sortByCountry() {
        List<User> sortResult = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SORT_BY_COUNTRY);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String find_country = resultSet.getString("country");
                sortResult.add(new User(id, name, email, find_country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return sortResult;
    }
}
