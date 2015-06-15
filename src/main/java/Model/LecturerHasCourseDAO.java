/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Utilities.DataManager;
import Bean.LecturerHasCourse;
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
public class LecturerHasCourseDAO {

    public static List<LecturerHasCourse> getClass(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        List<LecturerHasCourse> lectCourse = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer";
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        LecturerHasCourse lhc = new LecturerHasCourse();
                        lhc.setCourse(Integer.parseInt(rs.getString("Course_ID")));
                        lhc.setClassroom(Integer.parseInt(rs.getString("Classroom_ID")));
                        lhc.setLecturer(Integer.parseInt(rs.getString("Lecturer_ID")));
                        lhc.setDate(new java.sql.Date(Long.parseLong(rs.getString("date"))));

                    }
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not get lectCourse");
            }
        }
        return lectCourse;
    }

    public static LecturerHasCourse getLecturerHasCourseById(DataManager dataManager, int id) {
        Connection connection = dataManager.getConnection();
        LecturerHasCourse lhc = new LecturerHasCourse();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer where id = " + id;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    lhc.setCourse(Integer.parseInt(rs.getString("Course_ID")));
                    lhc.setClassroom(Integer.parseInt(rs.getString("Classroom_ID")));
                    lhc.setLecturer(Integer.parseInt(rs.getString("Lecturer_ID")));
                    lhc.setDate(new java.sql.Date(Long.parseLong(rs.getString("date"))));

                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.INFO, "Could not find lecturer {0}", id);
            }
        }
        return lhc;
    }

    public static List<LecturerHasCourse> searchLecturerHasCourseByName(DataManager dataManager, String name) {
        Connection connection = dataManager.getConnection();
        List<LecturerHasCourse> faculties = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer where name like " + name;

                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        LecturerHasCourse lhc = new LecturerHasCourse();
                        lhc.setCourse(Integer.parseInt(rs.getString("Course_ID")));
                        lhc.setClassroom(Integer.parseInt(rs.getString("Classroom_ID")));
                        lhc.setLecturer(Integer.parseInt(rs.getString("Lecturer_ID")));
                        lhc.setDate(new java.sql.Date(Long.parseLong(rs.getString("date"))));
                        faculties.add(lhc);
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
