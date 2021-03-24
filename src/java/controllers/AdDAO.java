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
public class AdDAO {

    private static AdDAO instance;

    public static AdDAO getInstance() {
        if (instance == null) {
            instance = new AdDAO();
        }
        return instance;
    }

    private AdDAO() {
    }

    public List<Ads> getAds() {
        String sql = "SELECT * FROM ads LEFT JOIN users ON ads.user = users.username ORDER BY users.subscription ASC";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName"), rs.getString("price")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }

    public List<Ads> getMyAds(String user) {
        String sql = "SELECT * FROM ads where user = '" + user + "'";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName"), rs.getString("price")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }
    
    public List<Ads> getMyAdsSearch(String user, String search) {
        String sql = "SELECT * FROM ads where user = '" + user + "' and (name LIKE '%" + search + "%' or description LIKE '%" + search + "%')";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName"), rs.getString("price")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }
    
    public List<Ads> getSearchAds(String search) {
        String sql = "SELECT * FROM ads where name LIKE '%" + search + "%' or description LIKE '%" + search + "%'";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName"), rs.getString("price")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }

    public List<Ads> getCarsAds() {
        String sql = "SELECT * FROM ads where category = 'cars'";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName"), rs.getString("price")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }

    public List<Ads> getHouseAds() {
        String sql = "SELECT * FROM ads where category = 'house and garden'";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName"), rs.getString("price")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }

    public List<Ads> getElectronicsAds() {
        String sql = "SELECT * FROM ads where category = 'electronics'";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName"), rs.getString("price")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }

    public List<Ads> getBooksAds() {
        String sql = "SELECT * FROM ads where category = 'books'";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName"), rs.getString("price")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }

    public List<Ads> getIdAd(Integer id) {
        String sql = "SELECT * FROM ads WHERE id = '" + id + "'";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName"), rs.getString("price")));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }

    public List<Ads> EditAd(String id, String name, String description, String category, String user, String path, String filePath,String price) {
        String sql = "UPDATE ads SET name='" + name + "', description='" + description + "', date=now(),category='" + category + "',user='" + user + "',location='" + path + "',fileName='" + filePath + "',price='" + price + "' WHERE id='" + id + "';";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            prepStmt.executeUpdate();
//while (rs.next()) {
//ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName")));
//}
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }

    public List<Ads> AddAd(String name, String description, String category, String user, String path, String filePath,String price) {
        String sql = "INSERT INTO ads(name,description,date,category,user,location,fileName,price) VALUES ('" + name + "','" + description + "',now(),'" + category + "','" + user + "','" + path + "','" + filePath + "','" + price + "');";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            prepStmt.executeUpdate();
//while (rs.next()) {
//ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName")));
//}
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }

    public List<Ads> DeleteAd(String id) {
        String sql = "DELETE FROM ads WHERE id='" + id + "';";
        List<Ads> ads = new ArrayList<>();
        try (Connection connection = Connection1.getConnection();
                PreparedStatement prepStmt = connection.prepareStatement(sql);) {
            prepStmt.executeUpdate();
//while (rs.next()) {
//ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName")));
//}
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ads;
    }

}
