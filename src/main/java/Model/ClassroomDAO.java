/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Bean.Classroom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Harvey
 */
public class ClassroomDAO {

    public Classroom getClassById(DataManager dataManager, int id) {
        Connection connection = dataManager.getConnection();
        Classroom classroom = new Classroom();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM classroom where id = " + id;
                ResultSet rs = statement.executeQuery(query);
                classroom.setName(rs.getString("name"));
                classroom.setCapacity(Integer.parseInt(rs.getString("capacity")));
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find classroom");
            }
        }
        return null;
    }

    public Classroom getClassByname(DataManager dataManager, String name) {
        Connection connection = dataManager.getConnection();
        Classroom classroom = new Classroom();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM classroom where name like " + name;
                ResultSet rs = statement.executeQuery(query);
                classroom.setId(Integer.parseInt(rs.getString("id")));
                classroom.setName(rs.getString("name"));
                classroom.setCapacity(Integer.parseInt(rs.getString("capacity")));
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Coud not find class {0}", new Object());
            }
        }
        return classroom;
    }
}