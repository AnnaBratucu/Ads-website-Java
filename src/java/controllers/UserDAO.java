/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ANA
 */
public class UserDAO {
    
    private static UserDAO instance;
public static UserDAO getInstance() {
if (instance == null) {
instance = new UserDAO();
}
return instance;
}
private UserDAO() {}

public List<Users> InsertUser(String username, String password, String email, String type, String subscription) {
        String sql = "INSERT INTO users(username,password,email, type, subscription) VALUES ('" + username + "',sha1('" + password + "'),'" + email + "','" + type + "','" + subscription + "');";
        List<Users> users = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            prepStmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }

public List<Users> getUser(String user) {
        String sql = "SELECT * FROM users where username = '" + user + "';";
        List<Users> users = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                users.add(new Users(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("type"), rs.getString("subscription")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }

public List<Users> getAllUsers() {
        String sql = "SELECT * FROM users;";
        List<Users> users = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                users.add(new Users(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("type"), rs.getString("subscription")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }

public List<Users> EditUserSubscr(String id, String subscription) {
        String sql = "UPDATE users SET subscription='" + subscription + "' WHERE id='" + id + "';";
        List<Users> users = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            prepStmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }
    
}

