/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Bean.Classroom;
import Bean.Course;
import Bean.Department;
import Bean.Faculty;
import Bean.Lecturer;
import Model.ClassroomDAO;
import Model.CourseDAO;
import Model.DepartmentDAO;
import Model.FacultyDAO;
import Utilities.DataManager;
import Model.LecturerDAO;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.sql.SQLException;
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
            try {
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
                        url = base + "sysadmin.jsp";
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
                    case "loadFaculties": //gets Faculties and correspondind departments from request
                        getFacultiesAndDepts(request, response);
                        Enumeration<String> attributeNames = request.getAttributeNames(); //gets attributes available in request
                        break;
                    case "getFaculties":
                        populateFacultyList(request);
                        return;
//                    break;
                    case "getLecturers":
                        getLecturers(request, response);
                        return;
                    case "getHalls":
                        getHalls(request, response);
                        return;
                    case "getLectsForCombo":
                        getLectsForDropDown(request, response);
                        break;
                    case "addDept"://add Department
                        addDepartment(request);
                        url = base + "sysadmin.jsp";
                        break;
                    case "getMondayLectureHours":
                        int day = 2;
                        System.out.println("MONDAY!!");
                        getLecturesHours(request, response, day);
                        break;

                    case "addCourse":
                        addCourse(request);//Adds a course to the DB
                        url = base + "admin.jsp";
                        break;
                    case "getDepartCourseswithHodId": //Get all the department courses group by level
                        getDepartmentCoursewithHodId(request, response);
                        break;

                }
//            System.out.println(request.getRequestURI());
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(TimeTableServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
        } else if ("Sysadmin".equals(lecturer.getLectureRole())) {
            url = base + "sysadmin.jsp";
            HttpSession session = request.getSession();

            session.setAttribute("halls", ClassroomDAO.countHalls(dataManager));
            session.setAttribute("lecturers", LecturerDAO.countLecturer(dataManager));
        } else {
            url = base + "lecturer.jsp";
        }
        if (lecturer != null) {
            request.getSession().setAttribute("name", lecturer.getName());
            request.getSession().setAttribute("user", userName);
            request.getSession().setAttribute("id", lecturer.getId());
            request.getSession().setAttribute("role", lecturer.getLectureRole());
            request.getSession().setAttribute("email", lecturer.getEmail());
        }

        return url;
    }

    public void logOut(HttpServletRequest request) {
        request.getSession().setAttribute("user", null);
    }

    public void addLecturer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Lecturer lecturer = new Lecturer();
        if (request.getParameter("id") != null) {
            lecturer.setId(Integer.parseInt(request.getParameter("id")));
        }
        lecturer.setName(request.getParameter("fullname"));
        lecturer.setUserName(request.getParameter("username"));
        lecturer.setPassword(request.getParameter("password"));
        lecturer.setEmail(request.getParameter("email"));
        String message;
        message = LecturerDAO.addEditLecturer(dataManager, lecturer, "add");
        message = LecturerDAO.addEditLecturer(dataManager, lecturer, "edit");
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
        JSONObject obj = new JSONObject();
        JSONArray halls = new JSONArray();
        for (Classroom classroom : classes) {
            JSONObject de = new JSONObject();
            de.put("id", classroom.getId());
            de.put("name", classroom.getName());
            halls.add(de);
        }
        obj.put("halls", halls);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getOutputStream(), obj);
    }

    public JSONObject getLecturers(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
        return obj;
    }

    public void addFaculty(HttpServletRequest request) {
        Faculty faculty = new Faculty();
        int deanId = Integer.parseInt(request.getParameter("dean"));
        LecturerDAO.setDean(dataManager, deanId);
        faculty.setName(request.getParameter("name"));
        faculty.setDean(deanId);
        String message = FacultyDAO.addFaculty(dataManager, faculty);
        request.getSession().setAttribute("message", message);
    }

    /**
     * Adds to request Faculties and corresponding departments in well formed
     * JSON syntax
     */
    public void getFacultiesAndDepts(HttpServletRequest request, HttpServletResponse httpresponse) throws IOException {
        List<Faculty> faculties = FacultyDAO.getFaculties(dataManager);
        List<Department> departments = DepartmentDAO.getDepartments(dataManager);
//        HttpSession session = request.getSession();
//        session.setAttribute("faculties", faculties);
        JSONArray response = new JSONArray();// This outputs as the ordered json list

        for (Faculty faculty : faculties) { //Iterate through the faulty list retriving each faculty for output in JSON Format
            JSONObject fac = new JSONObject();
            fac.put("name", faculty.getName());//adds key value pair to the list
            fac.put("id", faculty.getId());//adds key value pair to the list
            JSONArray depart = new JSONArray();

            for (Department department : departments) {
                if (faculty.getId() == department.getFaculty()) {//if faculty id 'Primary key' and department's foreign key match
                    JSONObject de = new JSONObject();
                    de.put("id", department.getId());
                    de.put("name", department.getName());

                    depart.add(de);//Nests department and names in JSON text format

                }
            }

            fac.put("departments", depart); //Nests faculties and departments in JSON text format
            response.add(fac); //Add "faculties->departments" to response
        }

//        System.out.print(response.toString());
        request.setAttribute("response", response);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(httpresponse.getOutputStream(), response);
    }

    /**
     * Add to request lecturer names and corresponding hours in well formed JSON
     * syntax
     *
     * @param request
     * @param response
     * @param day
     * @throws java.io.IOException
     * @throws java.sql.SQLException
     */
    public void getLecturesHours(HttpServletRequest request, HttpServletResponse response, int day) throws IOException, SQLException {
        List<Lecturer> lecturers = LecturerDAO.getDistinctLecturers(dataManager, day);
        JSONObject obj = new JSONObject();
        JSONArray profs = new JSONArray();
        for (Lecturer lecturer : lecturers) {
            JSONObject de = new JSONObject();
            de.put("name", lecturer.getName());
            de.put("hour", lecturer.getHour());
            profs.add(de);
            System.out.println(profs.toString());
        }
        obj.put("blocked_lecturers", profs);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getOutputStream(), obj);
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

    private void getLectsForDropDown(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Lecturer> lecturers = LecturerDAO.getLectsForDrop(dataManager);
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

    private void addDepartment(HttpServletRequest request) {
        Department department = new Department();
        department.setFaculty(Integer.parseInt(request.getParameter("depart-fac")));
        department.setHOD(Integer.parseInt(request.getParameter("hod")));
        department.setName(request.getParameter("dept"));
        LecturerDAO.setHod(dataManager, Integer.parseInt(request.getParameter("hod")));

        String message = DepartmentDAO.addDepartment(dataManager, department);
        request.getSession().setAttribute("message", message);
    }

    /**
     * Called when a Lecturer with the HOD role wants to schedule a course
     *
     * @param request
     * @param response
     * @throws java.io.IOException
     */
    public void hodSchedule(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        if (request.getSession().getAttribute("role").equals("HOD")) {
        JSONObject lectAndCourses = new JSONObject();
//            object containing a jsonarray of lecturer(id, name)
        JSONObject lecturers = getLecturers(request, response);
        JSONObject jsonObjCourses = new JSONObject();
        List<Course> courses = CourseDAO.getCourseByDepartment(dataManager,
                DepartmentDAO.getDepartmentIdByHOD(dataManager,
                        Integer.parseInt((String) request.getParameter("id"))));
        JSONArray jsonCourses = new JSONArray();
        for (Course course : courses) {
            JSONObject jsonCourse = new JSONObject();
            jsonCourse.put("id", course.getId());
            jsonCourse.put("name", course.getName());
            jsonCourses.add(jsonCourse);
        }
//            object containing an jsonarray of course(id, name)
        jsonObjCourses.put("courses", jsonCourses);
//            JSONObject conataining json two objects: object of courses and object of lecturers
        lectAndCourses.put("lecturers", lecturers);
        lectAndCourses.put("courses", jsonObjCourses);
        System.out.println(lectAndCourses);
//        }
    }

    /**
     * Called when a Lecturer with the Dean role wants to schedule a Course
     *
     * @param request
     * @param response
     */
    public void deanSchedule(HttpServletRequest request, HttpServletResponse response) {
        if (request.getSession().getAttribute("role").equals("Dean")) {
            int departments = DepartmentDAO.countDepartment(dataManager);

        }
    }

    //Called when needed to add a course
    private void addCourse(HttpServletRequest request) {
        Course course = new Course();
        course.setId(request.getParameter("code"));
        course.setName(request.getParameter("title"));
        course.setSemester(Integer.parseInt(request.getParameter("semester")));
        int depart_id = Integer.parseInt(request.getParameter("depart_id"));

        String msg = CourseDAO.addCourse(dataManager, course, depart_id);
        request.getSession().setAttribute("message", msg);

    }

    private void getDepartmentCoursewithHodId(HttpServletRequest request, HttpServletResponse response) throws IOException {

        int HOD_id = Integer.parseInt(request.getParameter("hod_id"));
        int depart_id = DepartmentDAO.getDepartmentIdByHOD(dataManager, HOD_id);
        List<Course> courses = CourseDAO.getCourseByDepartment(dataManager, depart_id);
        JSONObject obj = new JSONObject();
        JSONArray Level200 = new JSONArray();
        JSONArray Level300 = new JSONArray();
        JSONArray Level400 = new JSONArray();
        JSONArray Level500 = new JSONArray();

        for (Course course : courses) {
            if (course.getId().startsWith("2", 3) || course.getId().startsWith(" 2", 3)) {
                //is a level 200 course
                JSONObject cou = new JSONObject();
                cou.put("code", course.getId());
                cou.put("title", course.getName());
                Level200.add(cou);
            }
            if (course.getId().startsWith("3", 3) || course.getId().startsWith(" 3", 3)) {
                //is a level 300 course
                JSONObject cou = new JSONObject();
                cou.put("code", course.getId());
                cou.put("title", course.getName());
                Level300.add(cou);
            }
            if (course.getId().startsWith("4", 3) || course.getId().startsWith(" 4", 3)) {
                //is a level 400 course
                JSONObject cou = new JSONObject();
                cou.put("code", course.getId());
                cou.put("title", course.getName());
                Level400.add(cou);
            }
            if (course.getId().startsWith("5", 3) || course.getId().startsWith(" 5", 3)) {
                //is a level 500 course
                JSONObject cou = new JSONObject();
                cou.put("code", course.getId());
                cou.put("title", course.getName());
                Level500.add(cou);
            }

        }

        int longestLength = Level200.size();
        if (Level300.size() > longestLength) {
            longestLength = Level300.size();
        }
        if (Level400.size() > longestLength) {
            longestLength = Level400.size();
        }
        if (Level500.size() > longestLength) {
            longestLength = Level500.size();
        }
        for (int i = 1; i <= 4; i++) {
            switch (i) {
                case 1:
                    for (int j = longestLength; j > Level200.size(); j--) {
                        JSONObject cou = new JSONObject();
                        cou.put("code", "");
                        cou.put("title", "");
                        Level200.add(cou);
                    }
                    break;
                case 2:
                    for (int j = longestLength; j > Level300.size(); j--) {
                        JSONObject cou = new JSONObject();
                        cou.put("code", "");
                        cou.put("title", "");
                        Level300.add(cou);
                    }
                    break;
                case 3:
                    for (int j = longestLength; j > Level400.size(); j--) {
                        JSONObject cou = new JSONObject();
                        cou.put("code", "");
                        cou.put("title", "");
                        Level400.add(cou);
                    }
                    break;
                     case 4:
                   for(int j=longestLength; j>Level500.size(); j--){
                       JSONObject cou = new JSONObject();
                       cou.put("code", "");
                       cou.put("title", "");
                       Level500.add(cou);
                   }
           break;
            }
        }
        obj.put("level200", Level200);
        obj.put("level300", Level300);
        obj.put("level400", Level400);
        obj.put("level500", Level500);

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getOutputStream(), obj);

    }
}
