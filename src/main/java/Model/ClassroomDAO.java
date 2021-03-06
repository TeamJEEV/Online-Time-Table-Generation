/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Harvey Sama
 */
import Utilities.DataManager;
import Bean.Classroom;
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
 * @author Harvey
 */
public class ClassroomDAO {

    public static String addHall(DataManager dataManager, Classroom hall) {
        Connection connection = dataManager.getConnection();

        if (connection != null) {
            String name = hall.getName();
            int capacity = hall.getCapacity();
            String query = "INSERT into classrooms values(null,'" + name + "',"
                    + capacity + ")";
            try {
                Statement statement = connection.createStatement();
                statement.executeUpdate(query);
                try {
                    statement.executeUpdate(query);
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                if (e.getClass().equals(MySQLIntegrityConstraintViolationException.class)) {
                    return "Lecturer hall " + name + "has already been added";
                }
                Logger.getGlobal().log(Level.INFO, e.getMessage());
            }
        }
        return null;
    }

    public static List<Classroom> getClasses(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        List<Classroom> classrooms = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM classrooms";
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Classroom classroom = new Classroom();
                        classroom.setId(Integer.parseInt(rs.getString("id")));
                        classroom.setName(rs.getString("name"));
                        classroom.setCapacity(Integer.parseInt(rs.getString("capacity")));
                        classrooms.add(classroom);
                    }
                } catch (SQLException e) {
                    Logger.getGlobal().log(Level.INFO, e.getMessage());
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Coud not find class {0}", new Object());
            }
        }
        return classrooms;
    }

    public static Classroom getClassById(DataManager dataManager, int id) {
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
        return classroom;
    }

    public static List<Classroom> getClassByname(DataManager dataManager, String name) {
        Connection connection = dataManager.getConnection();
        List<Classroom> classrooms = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM classroom where name like " + name;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Classroom classroom = new Classroom();
                        classroom.setId(Integer.parseInt(rs.getString("id")));
                        classroom.setName(rs.getString("name"));
                        classroom.setCapacity(Integer.parseInt(rs.getString("capacity")));
                    }
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Coud not find class {0}", new Object());
            }
        }
        return classrooms;
    }

    public static int countHalls(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        int count = 0;
        if (connection != null) {
            try {

                Statement statement = connection.createStatement();
                String query = "SELECT Count(*) as COUNT FROM classrooms";
                try {
                    ResultSet rs;
                    rs = statement.executeQuery(query);
                    rs.next();
                    count = rs.getInt(1);

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch (SQLException e) {
            } //end catch block

        } //end of if loop
        return count;
    }
}
