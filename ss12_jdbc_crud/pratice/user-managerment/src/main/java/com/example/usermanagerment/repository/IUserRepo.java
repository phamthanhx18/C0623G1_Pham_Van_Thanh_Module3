package com.example.usermanagerment.repository;

import com.example.usermanagerment.model.User;

import java.util.List;

public interface IUserRepo {
    List<User> selectAllUsers();
    User selectUser(int id);
    void insertUser(User user);
    boolean deleteUser(int id);
    boolean updateUser(User user);
    List<User> findByCountry(String country);
}
