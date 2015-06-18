/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Bean.Classroom;
import Bean.Department;
import Bean.Faculty;
import Bean.Lecturer;
import Model.ClassroomDAO;
import Model.DepartmentDAO;
import Model.FacultyDAO;
import Utilities.DataManager;
import Model.LecturerDAO;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Harvey
 */
public class TimeTableServlet extends HttpServlet {

    DataManager dataManager;
    String base;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config); //To change body of generated methods, choose Tools | Templates.

        dataManager = new DataManager();
        dataManager.setDbUrl(config.getInitParameter("dbURL"));
        dataManager.setUserName(config.getInitParameter("dbUserName"));
        dataManager.setPassword(config.getInitParameter("dbPassword"));
        base = "/";

        ServletContext context = config.getServletContext();

        context.setAttribute(
                "base", config.getInitParameter("base"));
        context.setAttribute(
                "dataManager", dataManager);

        try {  // load the database JDBC driver
            Class.forName(config.getInitParameter("jdbcDriver"));
        } catch (ClassNotFoundException e) {
            System.out.println(e.toString());
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = base + "index.jsp";
//        Enumeration<String> parameterNames = request.getParameterNames();
//        while (parameterNames.hasMoreElements()) {
//            System.out.println(parameterNames.nextElement());
//        }
        Enumeration<String> parameterNames = request.getParameterNames();
        String action = request.getParameter("submit");
        if (action != null) {
            switch (action) {
                case "loginPage":
                    url = base + "login.jsp";
                    break;
                case "login":
                    url = login(request, url);
                    break;
                case "logout":
                    logOut(request);
                    break;
                case "addLect"://Add Lecturer
                    if (request.getSession().getAttribute("user") == null) {
                        // Not logged in. Redirect to login page.
                        response.sendRedirect("index.jsp");
                        return;
                    }
                    addLecturer(request, response);
                    break;
                case "addhall":
                    if (request.getSession().getAttribute("user") == null) {
                        // Not logged in. Redirect to login page.
                        response.sendRedirect("index.jsp");
                        return;
                    }
                    addHall(request);
                    url = base + "sysadmin.jsp";
                    break;
                case "addFac":
                    if (request.getSession().getAttribute("user") == null) {
                        // Not logged in. Redirect to login page.
                        response.sendRedirect("index.jsp");
                        return;
                    }
                    addFaculty(request);
                    url = base + "sysadmin.jsp";
                    break;
                case "loadFaculties":
                    getFacultiesAndDepts(request, response);
                    Enumeration<String> attributeNames = request.getAttributeNames();
                    break;
                case "getFaculties":
                    populateFacultyList(request);
                    return;
//                    break;
                case "getLecturers":
                    getLecturers(request, response);
                    return;
                case "getHalls":
                    getLecturers(request, response);
                    return;
            }
//            System.out.println(request.getRequestURI());
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } else {
//            System.out.println(request.getRequestURL());
//            if (request.getRequestURI().equals("/TimeTableProject/index.jsp")) {
//                return;
//            }
            if (request.getSession().getAttribute("user") == null) {
                // Not logged in. Redirect to home page.
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }
        }
    }

    public String login(HttpServletRequest request, String url) {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        Lecturer lecturer = LecturerDAO.getLecturerLogin(dataManager, userName, password);
        if (lecturer == null) {
            Logger.getGlobal().log(Level.INFO, "Login credentials Username: {0}\n "
                    + "Password: {1} not found", new Object[]{userName, password});
        } else if (lecturer.getLectureRole().equals("HOD") || lecturer.getLectureRole().equals("Dean")) {
            url = base + "admin.jsp";
            request.getSession().setAttribute("user", userName);
        } else if ("Sysadmin".equals(lecturer.getLectureRole())) {
            url = base + "sysadmin.jsp";
            HttpSession session = request.getSession();
            session.setAttribute("user", userName);
            session.setAttribute("halls", ClassroomDAO.countHalls(dataManager));
            session.setAttribute("lecturers", LecturerDAO.countLecturer(dataManager));
        } else {
            url = base + "lecturer.jsp";
            request.getSession().setAttribute("user", userName);
        }
        return url;
    }

    public void logOut(HttpServletRequest request) {
        request.getSession().setAttribute("user", null);
    }

    public void addLecturer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Lecturer lecturer = new Lecturer();
        lecturer.setName(request.getParameter("fullname"));
        lecturer.setUserName(request.getParameter("username"));
        lecturer.setPassword(request.getParameter("password"));
        lecturer.setLectureRole(request.getParameter("role"));
        String message = LecturerDAO.addLecturer(dataManager, lecturer);
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<div class=\"alert alert-warning\">" + message + "</div>");
//        }
    }

    public void addHall(HttpServletRequest request) {
        Classroom hall = new Classroom();
        hall.setName(request.getParameter("hall"));
        hall.setCapacity(Integer.parseInt(request.getParameter("capacity")));
        String message = ClassroomDAO.addHall(dataManager, hall);
        request.setAttribute("message", message);
    }

    public void getHalls(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Classroom> classes = ClassroomDAO.getClasses(dataManager);
        JSONArray halls = new JSONArray();
        for (Classroom classroom : classes) {
            JSONObject de = new JSONObject();
            de.put("id", classroom.getId());
            de.put("name", classroom.getName());
            halls.add(de);
        }
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getOutputStream(), halls);
    }

    public void getLecturers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Lecturer> lecturers = LecturerDAO.getLecturers(dataManager);
        JSONObject obj = new JSONObject();
        JSONArray profs = new JSONArray();
        
        for (Lecturer lecturer : lecturers) {
            JSONObject de = new JSONObject();
            de.put("id", lecturer.getId());
            de.put("name", lecturer.getName());
            de.put("email", lecturer.getEmail());
            
            profs.add(de);
        }
        obj.put("lec", profs);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getOutputStream(), obj);
    }

    public void addFaculty(HttpServletRequest request) {
        Faculty faculty = new Faculty();
        faculty.setName(request.getParameter("name"));
        String message = FacultyDAO.addFaculty(dataManager, faculty);
        request.setAttribute("message", message);
    }

    public void getFacultiesAndDepts(HttpServletRequest request, HttpServletResponse httpresponse) throws IOException {
        List<Faculty> faculties = FacultyDAO.getFaculties(dataManager);
        List<Department> departments = DepartmentDAO.getDepartments(dataManager);
        request.setAttribute("facultyList", faculties);
        request.setAttribute("departmentList", departments);
        HttpSession session = request.getSession();
        session.setAttribute("faculties", faculties);
        JSONArray response = new JSONArray();

        for (Faculty faculty : faculties) {
            JSONObject fac = new JSONObject();
            fac.put("name", faculty.getName());
            JSONArray depart = new JSONArray();

            for (Department department : departments) {
                if (faculty.getId() == department.getFaculty()) {
                    JSONObject de = new JSONObject();
                    de.put("id", department.getId());
                    de.put("name", department.getName());

                    depart.add(de);

                }
            }

            fac.put("departments", depart);
            response.add(fac);
        }

//        System.out.print(response.toString());
        request.setAttribute("response", response);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(httpresponse.getOutputStream(), response);
    }

//    public void populateLectList(HttpServletRequest request) {
//        List<Lecturer> lecturers = LecturerDAO.getLecturers(dataManager);
//        request.getSession().setAttribute("lecturerList", lecturers);
//    }
//
//    public void populateClassList(HttpServletRequest request) {
//        List<Classroom> classrooms = ClassroomDAO.getClasses(dataManager);
//        request.getSession().setAttribute("hallList", classrooms);
//    }

    public void populateFacultyList(HttpServletRequest request) {
        List<Faculty> faculties = FacultyDAO.getFaculties(dataManager);
        request.getSession().setAttribute("facultyList", faculties);
    }
}
