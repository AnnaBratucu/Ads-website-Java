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
public class messageDAO {

    private static messageDAO instance;

    public static messageDAO getInstance() {
        if (instance == null) {
            instance = new messageDAO();
        }
        return instance;
    }

    private messageDAO() {
    }

    public List<Message> InsertMessage(String content, String sender, String receiver, String ad) {
        String sql = "INSERT INTO message(content,sender, receiver, ad, date) VALUES ('" + content + "','" + sender + "','" + receiver + "','" + ad + "', now());";
        List<Message> messages = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            prepStmt.executeUpdate();
//while (rs.next()) {
//ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName")));
//}
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return messages;
    }

    public List<Message> getMessage(String user, String ad) {
        String sql = "SELECT * FROM message where (sender = '" + user + "' or receiver ='" + user + "') and ad='" + ad + "'";
        List<Message> messages = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                messages.add(new Message(rs.getString("id"), rs.getString("content"), rs.getString("sender"), rs.getString("receiver"), rs.getString("ad"), rs.getString("date")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return messages;
    }

    public List<Message> getMessages(String user) {
        String sql = "SELECT DISTINCT ad, content, receiver, sender, date, id FROM message where sender = '" + user + "' or receiver ='" + user + "' GROUP BY ad";
        List<Message> messages = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                messages.add(new Message(rs.getString("id"), rs.getString("content"), rs.getString("sender"), rs.getString("receiver"), rs.getString("ad"), rs.getString("date")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return messages;
    }

}
