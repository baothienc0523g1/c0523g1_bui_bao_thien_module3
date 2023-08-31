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
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_LIST_SP);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void addUser(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SP);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void edit(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_SP);
            preparedStatement.setInt(1, user.getId());
            preparedStatement.setString(2,user.getName());
            preparedStatement.setString(3,user.getEmail());
            preparedStatement.setString(4,user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User getUserById(int id) {
        User user = null;
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID_SP);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

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
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SP);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> findResult = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_COUNTRY);
            preparedStatement.setString(1, '%' + country + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
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
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_BY_COUNTRY);
            ResultSet resultSet = preparedStatement.executeQuery();
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

    @Override
    public void insertUserStore(User user) {
        String query = "call insert_user(?, ?, ?);";
        Connection connection = BaseRepository.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(query);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
