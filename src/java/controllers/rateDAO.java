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
public class rateDAO {
     private static rateDAO instance;
     public static rateDAO getInstance() {
     if (instance == null) {
     instance = new rateDAO();
}
return instance;
}
private rateDAO() {}

public List<Rate> getRating(String ad) {
String sql="SELECT * FROM rate WHERE ad='"+ad+"'";
List<Rate> ratings = new ArrayList<>();
try (Connection connection=Connection1.getConnection();
PreparedStatement prepStmt = connection.prepareStatement(sql);
){
ResultSet rs = prepStmt.executeQuery();
while (rs.next()) {
ratings.add(new Rate(rs.getString("id"), rs.getString("score"), rs.getString("ad"), rs.getString("ratingNo")));
}
} catch (SQLException ex) {
ex.printStackTrace();
}
return ratings;
}

public List<Rate> InsertRating(String score, String ad, String ratingNo) {
String sql="INSERT INTO rate(score,ad,ratingNo) VALUES ('"+score+"','"+ad+"','"+ratingNo+"');";
List<Rate> ratings = new ArrayList<>();
try (Connection connection=Connection1.getConnection();
PreparedStatement prepStmt = connection.prepareStatement(sql);
){
prepStmt.executeUpdate();
//while (rs.next()) {
//ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName")));
//}
} catch (SQLException ex) {
ex.printStackTrace();
}
return ratings;
}

public List<Rate> EditRate(String score, String ad, String ratingNo) {
String sql="UPDATE rate SET score='"+score+"', ad='"+ad+"', ratingNo='"+ratingNo+"' WHERE ad='"+ad+"';";
List<Rate> ratings = new ArrayList<>();
try (Connection connection=Connection1.getConnection();
PreparedStatement prepStmt = connection.prepareStatement(sql);
){
prepStmt.executeUpdate();
//while (rs.next()) {
//ads.add(new Ads(rs.getString("id"), rs.getString("name"), rs.getString("description"), rs.getString("date"), rs.getString("category"), rs.getString("user"), rs.getString("fileName")));
//}
} catch (SQLException ex) {
ex.printStackTrace();
}
return ratings;
}

}
