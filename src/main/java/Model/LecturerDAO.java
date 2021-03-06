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
import Bean.Lecturer;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class LecturerDAO {

    public static String addEditLecturer(DataManager dataManager, Lecturer lecturer, String choice) {
        int id = lecturer.getId();
        String name = lecturer.getName();
        String username = lecturer.getUserName();
        String password = lecturer.getPassword();
        String email = lecturer.getEmail();
        Connection connection = dataManager.getConnection();

        if (connection != null) {
            try {
                Statement statement = connection.createStatement();

                String query;
                if (choice.equals("add")) {
                    query = "INSERT INTO lecturer (`full name`, name, password, email) values('" + name + "', '"
                            + username + "', '"
                            + password + "', '"
                            + email + "')";
                } else {
                    query = "UPDATE lecturer set `full name` ='" + name
                            + "', name = '" + username
                            + "', password = '" + password
                            + "', email = '" + email
                            + "' where id = " + id;
                }
                try {
                    statement.executeUpdate(query);
                } catch (SQLException ex) {
                    Logger.getGlobal().log(Level.SEVERE, ex.getMessage());
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                if (e.getClass().equals(MySQLIntegrityConstraintViolationException.class)) {
                    return "Username " + lecturer.getUserName() + "is already taken";
                }
                Logger.getGlobal().log(Level.SEVERE, e.getMessage());
            }
        }
        return null;
    }

    public static void setDean(DataManager dataManager, int id) {
        Connection connection = dataManager.getConnection();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "Update lecturer set role = 'Dean' where id = " + id;
                try {
                    statement.executeUpdate(query);
                } catch (SQLException ex) {

                    Logger.getGlobal().log(Level.SEVERE, ex.getMessage());

                } finally {
                    statement.close();
                }
            } catch (SQLException ex) {

                Logger.getGlobal().log(Level.SEVERE, ex.getMessage());

            }
        }
    }

    public static void setHod(DataManager dataManager, int id) {
        Connection connection = dataManager.getConnection();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "Update lecturer set role = 'HOD' where id = " + id;
                try {
                    statement.executeUpdate(query);
                } catch (SQLException ex) {

                    Logger.getGlobal().log(Level.SEVERE, ex.getMessage());

                } finally {
                    statement.close();
                }
            } catch (SQLException ex) {

                Logger.getGlobal().log(Level.SEVERE, ex.getMessage());

            }
        }
    }

    public static List<Lecturer> getLecturers(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        List<Lecturer> lecturers = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer";
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Lecturer lecturer = new Lecturer();
                        lecturer.setId(Integer.parseInt(rs.getString("id")));
                        lecturer.setName(rs.getString("full name"));
                        lecturer.setUserName(rs.getString("name"));
                        lecturer.setPassword(rs.getString("password"));
                        lecturer.setLectureRole(rs.getString("role"));
                        lecturer.setEmail(rs.getString("email"));
                        lecturers.add(lecturer);
                    }
                } catch (SQLException ex) {
                    Logger.getGlobal().log(Level.SEVERE, ex.getMessage());
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.SEVERE, "Could not get lecturers");
            }
        }
        return lecturers;
    }

    public static Lecturer getLecturerById(DataManager dataManager, int id) {
        Connection connection = dataManager.getConnection();
        Lecturer lecturer = new Lecturer();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer where id = " + id;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    lecturer.setId(Integer.parseInt(rs.getString("id")));
                    lecturer.setName(rs.getString("name"));
                    lecturer.setUserName(rs.getString("username"));
                    lecturer.setPassword(rs.getString("password"));
                    lecturer.setLectureRole(rs.getString("role"));
                    lecturer.setEmail(rs.getString("email"));
                } catch (SQLException e) {
                    Logger.getGlobal().log(Level.SEVERE, e.getMessage());
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.SEVERE, "Could not find lecturer {0}", id);
            }
        }
        return lecturer;
    }

    public static List<Lecturer> getLectsForDrop(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        List<Lecturer> lecturers = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer where role <> 'Dean' AND "
                        + "role <> 'HOD' AND role <> 'Sysadmin'";
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Lecturer lecturer = new Lecturer();
                        lecturer.setId(Integer.parseInt(rs.getString("id")));
                        lecturer.setName(rs.getString("full name"));
                        lecturer.setUserName(rs.getString("name"));
                        lecturer.setPassword(rs.getString("password"));
                        lecturer.setLectureRole(rs.getString("role"));
                        lecturer.setEmail(rs.getString("email"));
                        lecturers.add(lecturer);
                    }
                } catch (SQLException ex) {
                    Logger.getGlobal().log(Level.SEVERE, ex.getMessage());
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.SEVERE, "Could not get lecturers");
            }
        }
        return lecturers;
    }

    public List<Lecturer> getLecturerIdByRole(DataManager dataManager, String name) {
        Connection connection = dataManager.getConnection();
        List<Lecturer> faculties = new ArrayList<>();
        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer where name like " + name;
                try {
                    ResultSet rs = statement.executeQuery(query);
                    while (rs.next()) {
                        Lecturer lecturer = new Lecturer();
                        lecturer.setId(Integer.parseInt(rs.getString("id")));
                        lecturer.setName(rs.getString("name"));
                        lecturer.setUserName(rs.getString("username"));
                        lecturer.setPassword(rs.getString("password"));
                        lecturer.setLectureRole(rs.getString("role"));
                        lecturer.setEmail(rs.getString("email"));
                        faculties.add(lecturer);
                    }
                } finally {
                    statement.close();
                }
            } catch (SQLException e) {
                Logger.getGlobal().log(Level.SEVERE, "Could not find lecturer {0}", name);
            }
        }
        return faculties;
    }

    public static Lecturer getLecturerLogin(DataManager dataManager, String userName, String password) {
        Connection connection = dataManager.getConnection();
        Lecturer lecturer = null;
        ResultSet rs;
        if (connection != null) {

            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM lecturer where name = '" + userName
                        + "' AND password = '" + password + "'";

                rs = statement.executeQuery(query);
                if (rs.next()) {
                    lecturer = new Lecturer();
                    lecturer.setId(Integer.parseInt(rs.getString("id")));
                    lecturer.setName(rs.getString("full name"));
                    lecturer.setUserName(rs.getString("name"));
                    lecturer.setPassword(rs.getString("password"));
                    lecturer.setLectureRole(rs.getString("role"));
                    lecturer.setEmail(rs.getString("email"));
                }
            } catch (SQLException ex) {
                Logger.getLogger(LecturerDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lecturer;
    }

    public static int countLecturer(DataManager dataManager) {
        Connection connection = dataManager.getConnection();
        Integer count = 0;
        if (connection != null) {
            try {

                Statement statement = connection.createStatement();
                String query = "SELECT Count(*) as COUNT FROM lecturer";
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
     * Get the lecture names and hours
     *
     * @param dataManager
     * @param day
     * @return
     * @throws java.sql.SQLException
     */
    public static List<Lecturer> getBlockedLecturers(DataManager dataManager, int day) throws SQLException {
        Connection connection = dataManager.getConnection();
        PreparedStatement pstatement = null;
        List<Lecturer> lecturers_name = new ArrayList<>();
        String query = "SELECT  `FULL NAME` FROM lecturer JOIN lecturer_has_courses ON "
                + "lecturer.id = lecturer_has_courses.lecturer_id WHERE "
                + "DAYOFWEEK (lecturer_has_courses.date) = ? AND HOUR (lecturer_has_courses.date) = ? ";

        if (connection != null) {
            try {
                pstatement = connection.prepareStatement(query);
//                pstatement.setInt(1, 5);
//                pstatement.setInt(1, 23);
                pstatement.setInt(1, day);
                for (int hour = 6; hour < 18; hour++) {
//
                    pstatement.setInt(2, hour);

                    ResultSet rs = pstatement.executeQuery();
                    while (rs.next()) {
                        Lecturer lecturer = new Lecturer();
                        lecturer.setName(rs.getString(1));//retrieve the 1st column
                        System.out.println(rs.getString(1));
                        lecturer.setHour(hour);
                        lecturers_name.add(lecturer);
                    }//end while loop

                }//end of for loop

            } catch (SQLException e) {
                throw (e);
            } finally {
                pstatement.close();
            }
        }//end of if loop

        return lecturers_name;
    }//end of method

    public static List<Lecturer> getFreeLecturers(DataManager dataManager, int day) throws SQLException {
        Connection connection = dataManager.getConnection();
        PreparedStatement pstatement = null;
        List<Lecturer> lecturers_name = new ArrayList<>();
        String query = "SELECT  `FULL NAME` FROM lecturer where lecturer.`FULL NAME` not in "
                + "(SELECT  `FULL NAME` FROM lecturer JOIN lecturer_has_courses ON "
                + "lecturer.id = lecturer_has_courses.lecturer_id WHERE "
                + "DAYOFWEEK (lecturer_has_courses.date) = ? AND HOUR (lecturer_has_courses.date) = ?);";

        if (connection != null) {
            try {
                pstatement = connection.prepareStatement(query);
//                pstatement.setInt(1, 5);
//                pstatement.setInt(1, 23);
                pstatement.setInt(1, day);
                for (int hour = 6; hour < 18; hour++) {
//
                    pstatement.setInt(2, hour);

                    ResultSet rs = pstatement.executeQuery();
                    while (rs.next()) {
                        Lecturer lecturer = new Lecturer();
                        lecturer.setName(rs.getString(1));//retrieve the 1st column
                        System.out.println(rs.getString(1));
                        lecturer.setHour(hour);
                        lecturers_name.add(lecturer);
                    }//end while loop

                }//end of for loop

            } catch (SQLException e) {
                throw (e);
            } finally {
                pstatement.close();
            }
        }//end of if loop

        return lecturers_name;
    }//end of method

    /**
     * Get the course title, classroom, day and time per lecturer
     *
     * @param dataManager
     * @param id
     * @return
     * @throws java.sql.SQLException
     */
    public static ResultSet getLecturerSchedule(DataManager dataManager, int id) throws SQLException {
        Connection connection = dataManager.getConnection();
        ResultSet rs = null;
        PreparedStatement pstatement = null;
        List<Lecturer> lecturers_name = new ArrayList<>();
        String query = "select leh.courses_code, cl.name, HOUR(leh.date) AS HOUR, DAYOFWEEK(leh.date) AS DAY "
                + "FROM lecturer l INNER JOIN lecturer_has_courses leh ON leh.lecturer_id = l.id INNER JOIN "
                + "classrooms cl on leh.classrooms_id=cl.id where l.id = ?;";

        if (connection != null) {
            pstatement = connection.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE);
            try {

//                pstatement.setInt(1, 5);
//                pstatement.setInt(1, 23);
                pstatement.setInt(1, id);//
                rs = pstatement.executeQuery();
            } catch (SQLException e) {
                throw (e);
            }
        }//end of if loop

        return rs;
    }//end of method

}
