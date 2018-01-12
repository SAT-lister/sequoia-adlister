package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao() {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                Config.url,
                Config.user,
                Config.password
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE is_deleted = 0");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description, categories) VALUES (?, ?, ?, ?);";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setString(4, ad.getCategory());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getString("categories")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    @Override
    public List<Ad> search(String searchTerm){
        String selectQuery = "SELECT * FROM ads WHERE title LIKE ? OR description LIKE ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(selectQuery);
            stmt.setString(1, "%" + searchTerm + "%");
            stmt.setString(2, "%" + searchTerm + "%");

            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving searched ads.", e);
        }
    }

    @Override
    public Ad getAd(long id) {
        String sql = "SELECT * FROM ads WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractAd(rs);

        } catch (SQLException e) {
            throw new RuntimeException("Error finding an ad", e);
        }
    }

    public List<Ad> getAds(long id) {
        String sql = "SELECT * FROM ads WHERE user_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a list of ads", e);
        }
    }



    @Override
    public void deleteAd(Ad ad) {
        try{
            PreparedStatement stmt = connection.prepareStatement("UPDATE ads SET is_deleted = ? WHERE id = ?");


            stmt.setBoolean(1, true);
            stmt.setLong(2, ad.getId());

            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error updating Profile information", e);
        }

    }



//    @Override
//    public void updateAd(Ad ad) {
//        try{
//            PreparedStatement stmt = connection.prepareStatement("UPDATE ads SET title=?, description=? WHERE id=?");
//
//
//            stmt.setString(1, ad.getTitle());
//            stmt.setString(2, ad.getDescription());
//            stmt.setLong(3, ad.getId());
//
//            stmt.executeUpdate();
//
//        } catch (SQLException e) {
//            throw new RuntimeException("Error updating Ad information", e);
//        }
//    }



}


