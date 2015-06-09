/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Bean.Faculty;
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
public class FacultyDAO {
    public List<Faculty> getFacultys(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        List<Faculty> facultys = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM faculty";
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Faculty faculty = new Faculty();
                        faculty.setId(Integer.parseInt(rs.getString("id")));
                        faculty.setName(rs.getString("name"));
                        faculty.setDean(Integer.parseInt(rs.getString("Dean_ID")));
                        facultys.add(faculty);
                    }
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not get facultys");
            }
        }
        return facultys;
    }

    public Faculty getFacultyById(DataManager dataManager, int id) {
        Connection connection = dataManager.getConnection();
        Faculty faculty = new Faculty();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM faculty where id = " + id;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    faculty.setId(Integer.parseInt(rs.getString("id")));
                    faculty.setName(rs.getString("name"));
                    faculty.setDean(Integer.parseInt(rs.getString("Dean_ID")));
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find faculty {0}", id);
            }
        }
        return faculty;
    }

    public List<Faculty> searchFacultyByName(DataManager dataManager, String name) {
        Connection connection = dataManager.getConnection();
        List<Faculty> faculties = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM faculty where name like " + name;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Faculty faculty = new Faculty();
                        faculty.setId(Integer.parseInt(rs.getString("id")));
                        faculty.setName(rs.getString("name"));
                        faculty.setDean(Integer.parseInt(rs.getString("Dean_ID")));
                        faculties.add(faculty);
                    }
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find faculty {0}", name);
            }
        }
        return faculties;
    }
}
