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
public class CourseDAO {

    public static List<Course> getCourses(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        List<Course> courses = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM course";
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

    /**
     * Gets the courses of a given department
     *
     * @param dataManager
     * @param deptId
     * @return list of courses
     */
    public static List<Course> getCourseByDepartment(DataManager dataManager, int deptId) {
        Connection connection = dataManager.getConnection();
        if (connection != null) {
            try {
                List<Course> courses = new ArrayList<>();
                Statement statement = connection.createStatement();
                String query = "SELECT code, title, semester FROM courses INNER JOIN"
                        + " department_has_courses ON courses.code = department.courses_code";
                try {
                    ResultSet resultSet = statement.executeQuery(query);
                    while (resultSet.next()) {
                        Course course = new Course();
                        course.setId(resultSet.getString("code"));
                        course.setName(resultSet.getString("title"));
                        course.setSemester(Integer.parseInt(resultSet.getString("semester")));
                        courses.add(course);
                        return courses;
                    }
                } catch (SQLException e) {
                    Logger.getGlobal().log(Level.INFO, "Could not get courses");
                }//end try catch
                finally {
                    statement.close();
                }
            } catch (SQLException e) {
            }
        }
        return null;
    }

    /*
     Algorithm
     Get the id of the dean from the session variable
     Use the it to query the faculty table - get the dean's faculty
     Get all the dapartments of the faculty.
     For each department, get the department_has_course class
     Use this to get the courses of that department
     Repeat for each department
     Create a JSOnObject and add it to the response
     */
    public static List<Course> getCourseByFaculty(DataManager dataManager, int deanId) {
        Connection connection = dataManager.getConnection();
        if (connection != null) {
            try {
                List<Course> courses = new ArrayList<>();
                Statement statement = connection.createStatement();
                String query = "SELECT courses.code, courses.title, semester FROM faculty INNER JOIN "
                        + "department ON faculty.id = department.faculty_id INNER JOIN "
                        + "department_has_courses ON department.id = department_has_courses.department_id INNER JOIN "
                        + "courses ON courses.code = department_has_courses.courses_code WHERE "
                        + "faculty.dean_id = " + deanId;
                try {
                    ResultSet resultSet = statement.executeQuery(query);
                    while (resultSet.next()) {
                        Course course = new Course();
                        course.setId(resultSet.getString(1));
                        course.setName(resultSet.getString(2));
                        course.setSemester(Integer.parseInt(resultSet.getString(3)));
                        courses.add(course);
                    }
                    return courses;
                } catch (SQLException ex) {
                    Logger.getGlobal().log(Level.WARNING, ex.getMessage());
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {

            }
        }
        return null;
    }

    public int countCourse(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        Integer count = 0;
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT Count(*) as COUNT FROM course";
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

    public static String addCourse(DataManager dataManager, Course course, int depart_id) {
        Connection connection = dataManager.getConnection();

        if (connection != null) {
            String code = course.getId();
            String title = course.getName();
            int semester = course.getSemester();

            String query = "INSERT into courses values('"
                    + code + "', '"
                    + title + "', "
                    + semester + ")";

            String query1 = "INSERT into department_has_courses values("
                    + depart_id + ", '"
                    + code + "')";

            Statement statement;
            try {
                statement = connection.createStatement();
                try {
                    statement.executeUpdate(query);
                    statement.executeUpdate(query1);

                } catch (SQLException e) {
                    Logger.getGlobal().log(Level.WARNING, e.getMessage());
                } finally {
                    statement.close();
                }
                return "Course created";

            } catch (SQLException e) {
                if (e.getClass().equals(MySQLIntegrityConstraintViolationException.class)) {
                    return "Course with title " + code + " already exist.";
                }
                Logger.getGlobal().log(Level.INFO, e.getMessage());
            }

        }
        return null;
    }
}
