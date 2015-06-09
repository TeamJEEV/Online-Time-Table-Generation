/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Bean.Lecturer;
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
 * @author Harvey
 */
public class LecturerDAO {

    public List<Lecturer> getLecturers(DataManager dataManager) {
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
}
