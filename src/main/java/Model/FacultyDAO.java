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
import Bean.Faculty;
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
public class FacultyDAO {

    public static String addFaculty(DataManager dataManager, Faculty faculty) {
        Connection connection = dataManager.getConnection();

        if (connection != null) {
            String name = faculty.getName();
            int dean = faculty.getDean();
            String query = "INSERT into faculty values(null,'" + name + "',"
                    + dean + ")";
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
                    return "Dean id" + dean + " owner is already a dean. Select someone else.";
                } else {
                    Logger.getGlobal().log(Level.INFO, e.getMessage());
                }
            }
        }
        return null;
    }

    public static List<Faculty> getFaculties(DataManager dataManager) {
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
                }catch(SQLException | NumberFormatException e){
                    String msg = e.getMessage();                   
                    Logger.getGlobal().log(Level.INFO, msg);
                }finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not get facultys");
            }
        }
        return facultys;
    }

    public static Faculty getFacultyByDeanId(DataManager dataManager, int deanId) {
        Connection connection = dataManager.getConnection();
        Faculty faculty = new Faculty();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM faculty where dean_id = " + deanId;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    rs.next();
                    faculty.setId(Integer.parseInt(rs.getString("id")));
                    faculty.setName(rs.getString("name"));
                    faculty.setDean(Integer.parseInt(rs.getString("dean_id")));
                } catch (SQLException e) {
                    Logger.getGlobal().log(Level.INFO, e.getMessage());
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find faculty {0}", deanId);
            }
        }
        return faculty;
    }

    public static Faculty getFacultyById(DataManager dataManager, int id) {
        Connection connection = dataManager.getConnection();
        Faculty faculty = new Faculty();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM faculty where id = " + id;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    rs.next();
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

    public static int countFaculty(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        Integer count = 0;
        if (connection != null) {
            try {

                Statement statement = connection.createStatement();
                String query = "SELECT Count(*) as COUNT FROM faculty";
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

    /**
     * Get Faculty names
     */
    public ArrayList getFacultyNames(DataManager dataManager) throws SQLException {
        Statement statement = null;
        Connection connection = dataManager.getConnection();
        ArrayList names = new ArrayList();
        String query = "SELECT NAME FROM FACULTY";
        if (connection != null) {
            try {
                statement = connection.createStatement();
                ResultSet rs = statement.executeQuery(query);
                while (rs.next()) {
                    int i = 1;
                    names.add(rs.getString(i));
                    i++;

                }
            } catch (SQLException e) {
                e.printStackTrace();

            } finally {
                if (statement != null) {
                    statement.close();
                }
            }
        }
        return names;
    }

}

//String query = "SELECT faculty.id as facId, faculty.name as facName,"
//                        + "departement.id as deptId, departement.name  as deptname FROM faculty, "
//                        + "departement WHERE department.faculty_id = faculty.id";
//                try {
//                    ResultSet rs = statement.executeQuery(query);
//                    while (rs.next()) {
//                        FacultyDept faculty = new FacultyDept();
//                        faculty.setFactId(Integer.parseInt(rs.getString("factId")));
//                        faculty.setDeptId(Integer.parseInt(rs.getString("deptId")));
//                        faculty.setFactname(rs.getString("factName"));
//                        faculty.setDeptName(rs.getString("deptName"));
//                        facultys.add(faculty);
//                        facultys.add(faculty);

