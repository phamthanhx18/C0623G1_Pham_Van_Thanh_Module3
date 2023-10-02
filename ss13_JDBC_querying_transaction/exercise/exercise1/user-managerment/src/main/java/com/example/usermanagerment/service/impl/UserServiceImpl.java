package com.example.usermanagerment.service.impl;

import com.example.usermanagerment.model.User;
import com.example.usermanagerment.repository.IUserRepo;
import com.example.usermanagerment.repository.impl.UserRepoImpl;
import com.example.usermanagerment.service.IUserService;

import java.util.List;

public class UserServiceImpl implements IUserService {
    private final IUserRepo userRepo = new UserRepoImpl();
    @Override
    public List<User> selectAllUsers() {
        return userRepo.selectAllUsers();
    }

    @Override
    public User selectUser(int id) {
        return userRepo.selectUser(id);
    }

    @Override
    public void insertUser(User user) {
        userRepo.insertUser(user);
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepo.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userRepo.updateUser(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepo.findByCountry(country);
    }

    @Override
    public User getUserByIdSp(int id) {
        return userRepo.getUserByIdSp(id);
    }

    @Override
    public void insertUserStoreSp(User user) {
        userRepo.insertUserStoreSp(user);
    }

    @Override
    public void addUserTransaction(User newUser, List<Integer> permissions) {
        userRepo.addUserTransaction(newUser,permissions);
    }

    @Override
    public List<User> displayListUserSp() {
        return userRepo.displayListUserSp();
    }

    @Override
    public boolean deleteUserSp(int id) {
        return userRepo.deleteUserSp(id);
    }

    @Override
    public boolean updateUserSp(User user) {
        return userRepo.updateUserSp(user);
    }

}
