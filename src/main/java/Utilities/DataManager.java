/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilities;
/**
 *
 * @author Harvey Sama
 */
import Bean.Classroom;
import Bean.Course;
import Model.ClassroomDAO;
import Model.DepartmenthasCourseDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Harvey
 */
public class DataManager {
    private String dbUrl="";
    private String userName = "";
    private String password = "";

    public String getDbUrl() {
        return dbUrl;
    }

    public void setDbUrl(String dbUrl) {
        this.dbUrl = dbUrl;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public Connection getConnection(){
        Connection connection = null;
        try{
            connection = DriverManager.getConnection(getDbUrl(), getUserName(),
          getPassword());
        }catch(SQLException e){
            System.out.println("Could not connect to DB: " + e.getMessage());
        }
        return connection;
    }
    
    public void putConnection(Connection conn) {
    if (conn != null) {
      try { conn.close(); }
      catch (SQLException e) { }
      }
    }
    
    //---------------Classroom operations---------------
    public Classroom getClassById(int id){
        return ClassroomDAO.getClassById(this, id);
    }
    
    public List<Classroom> getAllClasses(){
        return ClassroomDAO.getClasses(this);
    }
    
    public List<Classroom> getClassByName(String name){
        return ClassroomDAO.getClassByname(this, name);
    }
    
    //----------------Course Operations------------------
    public List<Course> getCoursesByDept(int dept){
        return DepartmenthasCourseDAO.getCoursesByDept(this, dept);
    }
    
    public List<Course> getDeptCourseBySem(int dept, int sem){
        return DepartmenthasCourseDAO.getDeptCoursesBySem(this, dept, sem);
    }
    
    public Course getCourse(int courseId){
        return DepartmenthasCourseDAO.getCourseById(this, courseId);
    }
}
