/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Utilities.DataManager;
import Bean.Lecturer;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Harvey, Eyog Yvon Léonce 
 */
public class LecturerDAO {
    
    public static String addLecturer(DataManager dataManager, Lecturer lecturer) {
        String name = lecturer.getName();
        String username = lecturer.getUserName();
        String password = lecturer.getPassword();
        String role = lecturer.getLectureRole();
        Connection connection = dataManager.getConnection();
        
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "INSERT INTO lecturer values(null,'" + name + "', '" 
                        + username + "', '" 
                        + password + "', '" 
                        + role + "')";
                try {
                    statement.executeUpdate(query);
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                if (e.getClass().equals(MySQLIntegrityConstraintViolationException.class)) {
                    return "Username " + lecturer.getUserName() + "is already taken";
                }
                Logger.getGlobal().log(Level.INFO, e.getMessage());
            }
        }
        return null;   
    }

    public static List<Lecturer> getLecturers(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        List<Lecturer> lecturers = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer";
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Lecturer lecturer = new Lecturer();
                        lecturer.setId(Integer.parseInt(rs.getString("id")));
                        lecturer.setName(rs.getString("fullName"));
                        lecturer.setUserName(rs.getString("username"));
                        lecturer.setPassword(rs.getString("password"));
                        lecturer.setLectureRole(rs.getString("role"));
                        lecturers.add(lecturer);
                    }
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not get lecturers");
            }
        }
        return lecturers;
    }
    
    public Lecturer getLecturerById(DataManager dataManager, int id) {
        Connection connection = dataManager.getConnection();
        Lecturer lecturer = new Lecturer();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer where id = " + id;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    lecturer.setId(Integer.parseInt(rs.getString("id")));
                    lecturer.setName(rs.getString("name"));
                    lecturer.setUserName(rs.getString("username"));
                    lecturer.setPassword(rs.getString("password"));
                    lecturer.setLectureRole(rs.getString("role"));
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find lecturer {0}", id);
            }
        }
        return lecturer;
    }
    
    public List<Lecturer> searchLecturerByName(DataManager dataManager, String name) {
        Connection connection = dataManager.getConnection();
        List<Lecturer> faculties = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer where name like " + name;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Lecturer lecturer = new Lecturer();
                        lecturer.setId(Integer.parseInt(rs.getString("id")));
                        lecturer.setName(rs.getString("name"));
                        lecturer.setUserName(rs.getString("username"));
                        lecturer.setPassword(rs.getString("password"));
                        lecturer.setLectureRole(rs.getString("role"));
                        faculties.add(lecturer);
                    }
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find lecturer {0}", name);
            }
        }
        return faculties;
    }
    
    public static Lecturer getLecturerLogin(DataManager dataManager, String userName, String password) {
        Connection connection = dataManager.getConnection();
        Lecturer lecturer = null;
        ResultSet rs;
        if (connection != null) {
            
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer where name = '" + userName
                        + "' AND password = '" + password + "'";
                
                rs = statement.executeQuery(query);
                if (rs.next()) {
                    lecturer = new Lecturer();
                    lecturer.setId(Integer.parseInt(rs.getString("id")));
                    lecturer.setName(rs.getString("full name"));
                    lecturer.setUserName(rs.getString("name"));
                    lecturer.setPassword(rs.getString("password"));
                    lecturer.setLectureRole(rs.getString("role"));
                }
            } catch (SQLException ex) {
                Logger.getLogger(LecturerDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lecturer;
    }
    
    public int countLecturer(DataManager dataManager){
         Connection connection = dataManager.getConnection();
         Integer count=0;
         if (connection != null){
             try {
                 
              Statement statement = connection.createStatement();
              String query = "SELECT Count(*) as COUNT FROM lecturer";
             try{
                 ResultSet rs;
                 rs= statement.executeQuery(query);
                 rs.next();
                 count= rs.getInt(1);
                 
             }catch (SQLException e ) {
                 e.printStackTrace();
             }
         } catch (SQLException e){
                 } //end catch block
        
    } //end of if loop
  return count;

    }
    
}
      
