/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Harvey
 */
public class DataManager {
    private String dbUrl="";
    private String userName = "";
    private String password = "";

    public String getDbUrl() {
        return dbUrl;
    }

    public void setDbUrl(String dbUrl) {
        this.dbUrl = dbUrl;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public Connection getConnection(){
        Connection connection = null;
        try{
            connection = DriverManager.getConnection(getDbUrl(), getUserName(),
          getPassword());
        }catch(SQLException e){
            System.out.println("Could not connect to DB: " + e.getMessage());
        }
        return connection;
    }
    
    public void putConnection(Connection conn) {
    if (conn != null) {
      try { conn.close(); }
      catch (SQLException e) { }
      }
    }
    
    
}
