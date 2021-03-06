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
import Bean.Course;
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
 * @author Harvey, Eyog Yvon Leonce
 */
public class DepartmenthasCourseDAO {
     public static List<Course> getCoursesByDept(DataManager dataManager, int deptId) {
        Connection connection = dataManager.getConnection();
        List<Course> courses = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT id, name, semester FROM course, departmenthascourse where "
                        + "departmenthascourse.Department_ID = " + deptId;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Course course = new Course();
                        course.setId(rs.getString("id"));
                        course.setName(rs.getString("name"));
                        course.setSemester(Integer.parseInt(rs.getString("semester")));
                        courses.add(course);
                    }

                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not get courses");
            }
        }
        return courses;
    }
     
     public static List<Course> getDeptCoursesBySem(DataManager dataManager, int deptId, int semester) {
        Connection connection = dataManager.getConnection();
        List<Course> courses = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT id, name, semester FROM course, departmenthascourse where "
                        + "departmenthascourse.Department_ID = " + deptId + 
                        " and course.semester = " + semester;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Course course = new Course();
                        course.setId(rs.getString("id"));
                        course.setName(rs.getString("name"));
                        course.setSemester(Integer.parseInt(rs.getString("semester")));
                        courses.add(course);
                    }

                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not get courses");
            }
        }
        return courses;
    }

    public static Course getCourseById(DataManager dataManager, int id) {
        Connection connection = dataManager.getConnection();
        Course course = new Course();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM course where id = " + id;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    course.setId(rs.getString("id"));
                    course.setName(rs.getString("name"));
                    course.setSemester(Integer.parseInt(rs.getString("semester")));
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find course {0}", id);
            }
        }
        return course;
    }

    public static List<Course> searchCourseByName(DataManager dataManager, String name) {
        Connection connection = dataManager.getConnection();
        List<Course> courses = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM course where name like " + name;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Course course = new Course();
                        course.setId(rs.getString("id"));
                        course.setName(rs.getString("name"));
                        course.setSemester(Integer.parseInt(rs.getString("semester")));
                        courses.add(course);
                    }
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find course {0}", name);
            }
        }
        return courses;
    }
}
