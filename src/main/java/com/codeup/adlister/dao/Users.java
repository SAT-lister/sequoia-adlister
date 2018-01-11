package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.sql.SQLException;

public interface Users {
    User findByUsername(String username);
    User findById(Long id);
    User findByEmail(String email);
    Long insert(User user);
    void updateUser(User user);
}
