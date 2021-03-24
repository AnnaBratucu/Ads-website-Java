/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/**
 *
 * @author ANA
 */
import java.sql.*;
public class Exists {
    
    public boolean userExists (String username) throws SQLException{
         Connection conn=null;
      
      try{
           conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab2wad?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","gotony1997");
            System.out.println("Connected");
            Statement stmt=(Statement)conn.createStatement();
            String select="SELECT username FROM lab2wad.users;";
            ResultSet rs = stmt.executeQuery(select);
            while(rs.next()){
            String user=rs.getString("username");
            if(user.equals(username)){
                return true;
            }
        }
        }catch (SQLException e){
            e.printStackTrace();
        }
    
        return false;
    }
    
    public boolean isUser(String username,String password) throws SQLException{
       Connection conn=null;
      
      try{
           conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab2wad?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=CONVERT_TO_NULL&serverTimezone=GMT","root","gotony1997");
            System.out.println("Connected");
            Statement stmt=(Statement)conn.createStatement();
            String pass1=stmt.executeQuery("SELECT SHA1(\'"+password+"\')").toString();
      
            ResultSet rs=stmt.executeQuery("SELECT username,password FROM lab2wad.users;  ");
 
        while(rs.next()){
            String user=rs.getString("username");
            String pass=rs.getString("password");
        
           
            if(user.equals(username)&&pass.equals(pass)){
                return true;
            }
        }
         }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    
    
}
