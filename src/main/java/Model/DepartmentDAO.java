/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Utilities.DataManager;
import Bean.Classroom;
import Bean.Department;
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
public class DepartmentDAO {

    public static String addDepartment(DataManager dataManager, Department department) {
        Connection connection = dataManager.getConnection();

        if (connection != null) {
            String name = department.getName();
            int facultyId = department.getFaculty();
            int hodId = department.getHOD();
            String query = "INSERT into department values(null,'" + name + "', "
                    + facultyId + ", "
                    + hodId + ")";
            try {
                Statement statement = connection.createStatement();
                statement.executeUpdate(query);
                try {
                    statement.executeUpdate(query);
                } catch (SQLException e) {
                    Logger.getGlobal().log(Level.WARNING,e.getMessage());
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                if (e.getClass().equals(MySQLIntegrityConstraintViolationException.class)) {
                    return "Lecturer with id " + hodId + " is already an HOD. Select someone else.";
                }
                Logger.getGlobal().log(Level.INFO, e.getMessage());
            }
        }
        return null;
    }

    public static List<Department> getDepartments(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        List<Department> departments = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM department";
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Department department = new Department();
                        department.setId(Integer.parseInt(rs.getString("id")));
                        department.setName(rs.getString("name"));
                        department.setHOD(Integer.parseInt(rs.getString("hod_id")));
                        department.setFaculty(Integer.parseInt(rs.getString("faculty_id")));
                        departments.add(department);
                    }
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not get departments");
            }
        }
        return departments;
    }

    public static Department getDepartmentById(DataManager dataManager, int id) {
        Connection connection = dataManager.getConnection();
        Department department = new Department();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM department where id = " + id;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    department.setId(Integer.parseInt(rs.getString("id")));
                    department.setName(rs.getString("name"));
                    department.setHOD(Integer.parseInt(rs.getString("HOD_ID")));
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find department {0}", id);
            }
        }
        return department;
    }

    public static List<Department> searchDepartmentByName(DataManager dataManager, String name) {
        Connection connection = dataManager.getConnection();
        List<Department> departments = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM department where name like " + name;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Department department = new Department();
                        department.setId(Integer.parseInt(rs.getString("id")));
                        department.setName(rs.getString("name"));
                        department.setHOD(Integer.parseInt(rs.getString("HOD_ID")));
                        departments.add(department);
                    }
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find department {0}", name);
            }
        }
        return departments;
    }
    public int countDepartment(DataManager dataManager){
         Connection connection = dataManager.getConnection();
         Integer count=0;
         if (connection != null){
             try {
                 
              Statement statement = connection.createStatement();
              String query = "SELECT Count(*) as COUNT FROM department";
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
