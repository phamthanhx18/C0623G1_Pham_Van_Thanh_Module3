package com.example.usermanagerment.service;

import com.example.usermanagerment.model.User;

import java.util.List;

public interface IUserService {
    List<User> selectAllUsers();
    User selectUser(int id);
    void insertUser(User user);
    boolean deleteUser(int id);
    boolean updateUser(User user);
    List<User> findByCountry(String country);
    User getUserByIdSp(int id);
    void insertUserStoreSp(User user);
    void addUserTransaction(User newUser, List<Integer> permissions);
    List<User> displayListUserSp();
    boolean deleteUserSp(int id);
    boolean updateUserSp(User user);
}
