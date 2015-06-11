/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Bean.Department;
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
public class DepartmentDAO {

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
                        department.setHOD(Integer.parseInt(rs.getString("HOD_ID")));
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
}
