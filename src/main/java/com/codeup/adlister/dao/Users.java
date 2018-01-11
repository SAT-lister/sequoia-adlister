package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.sql.SQLException;

public interface Users {
    User findByUsername(String username);
    User findByEmail(String email);
    Long insert(User user);
    User updateUser(String username, String email, String password, Long user_id);

    User updateUser(String username, String email, String password, long userId) throws SQLException;
}
