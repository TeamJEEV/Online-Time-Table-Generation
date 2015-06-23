/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author Harvey Sama
 */
import Bean.Classroom;
import Bean.Course;
import Bean.Department;
import Bean.Faculty;
import Bean.Lecturer;
import Bean.LecturerHasCourse;
import Model.ClassroomDAO;
import Model.CourseDAO;
import Model.DepartmentDAO;
import Model.FacultyDAO;
import Utilities.DataManager;
import Model.LecturerDAO;
import Model.LecturerHasCourseDAO;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
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
 * @author Harvey, Eyog Yvon Léonce
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
        /**
         * Check for the current session user Serve the required page if user is
         * logged in else redirect to index page
         */
        if (action != null) {

            if ((request.getSession().getAttribute("user") == null && (!action.equals("login")))
                    && (request.getSession().getAttribute("user") == null && !action.equals("loadFaculties") &&
                    !action.equals("getDepartmentSchedule"))) {
                // Not logged in. Redirect to login page.
                response.sendRedirect("index.jsp");
                return;
            }

            int day;

            try {
                switch (action) {
                    case "login":
                        url = login(request, url);
                        break;
                    case "logout":
                        logOut(request);
                        break;
                    case "addLect"://Add Lecturer
                        addLecturer(request, response);
                        url = base + "sysadmin.jsp";
                        break;
                    case "addhall":
                        addHall(request);
                        url = base + "sysadmin.jsp";
                        break;
                    case "addFac":
                        addFaculty(request);
                        url = base + "sysadmin.jsp";
                        break;
                    case "loadFaculties": //gets Faculties and correspondind departments from request
                        getFacultiesAndDepts(request, response);
                        Enumeration<String> attributeNames = request.getAttributeNames(); //gets attributes available in request
                        break;

                    case "getFaculties":
                        populateFacultyList(request);
                        url = base + "sysadmin.jsp";
                        break;
                    case "getLecturers":
                        getLecturers(request, response);
                        url = base + "sysadmin.jsp";
                        break;
                    case "getHalls":
                        getHalls(request, response);
                        url = base + "sysadmin.jsp";
                        break;
                    case "getLectsForCombo":
                        getLectsForDropDown(request, response);
                        url = base + "sysadmin.jsp";
                        break;
                    case "addDept"://add Department
                        addDepartment(request);
                        url = base + "sysadmin.jsp";
                        break;
                    case "loadLectsAndCourses"://load lecturers and courses
                        if (request.getSession().getAttribute("role").equals("Dean")) {
                            loadScheduleData(request, response);
                        } else {//is the hod
                            loadScheduleData(request, response);
                        }
                        url = base + "admin.jsp";
                        break;
                    case "addClass":
                        scheduleClass(request);
                        url = base + "admin.jsp";
                        break;
                    case "getIndividualSchedule":
                        getScheduleData(request, response, action);
                        break;
                    case "getDepartmentSchedule":
                        getScheduleData(request, response, action);
                        break;
                    case "getMondayLectureHours":
                        day = 2;
//                        System.out.println("MONDAY!!");
                        getBlockedLecturerInfo(request, response, day);
                        url = base + "admin.jsp";
                        break;

                    case "getTuesdayLectureHours":
                        day = 3;
//                        System.out.println("TUESDAY!!");
                        getBlockedLecturerInfo(request, response, day);
                        break;
                    case "getWednesdayLectureHours":

                        day = 4;
//                        System.out.println("WEDNESDAY!!");
                        getBlockedLecturerInfo(request, response, day);
                        break;
                    case "getThursdayLectureHours":

                        day = 5;
//                        System.out.println("THURSDAY!!");
                        getBlockedLecturerInfo(request, response, day);
                        break;
                    case "getFridayLectureHours":

                        day = 6;
//                        System.out.println("FRIDAY!!");
                        getBlockedLecturerInfo(request, response, day);
                        break;
                    case "getSaturdayLectureHours":
                        day = 7;
//                        System.out.println("SATURDAY!!");
                        getBlockedLecturerInfo(request, response, day);
                        break;

                    case "getFreeMondayLectureHours":

                        day = 2;

                        System.out.println("MONDAY!!");

                        getFreeLecturerInfo(request, response, day);
                        url = base + "admin.jsp";

                        break;

                    case "getFreeTuesdayLectureHours":

                        day = 3;
                        System.out.println("TUESDAY!!");
                        getFreeLecturerInfo(request, response, day);
                        break;
                    case "getFreeWednesdayLectureHours":

                        day = 4;
                        System.out.println("WEDNESDAY!!");
                        getFreeLecturerInfo(request, response, day);
                        break;
                    case "getFreeThursdayLectureHours":

                        day = 5;
                        System.out.println("THURSDAY!!");
                        getFreeLecturerInfo(request, response, day);
                        break;
                    case "getFreeFridayLectureHours":

                        day = 6;
                        System.out.println("FRIDAY!!");
                        getFreeLecturerInfo(request, response, day);
                        break;
                    case "getFreeSaturdayLectureHours":

                        day = 7;
                        System.out.println("SATURDAY!!");
                        getFreeLecturerInfo(request, response, day);
                        break;
                    case "addCourse":
                        addCourse(request);//Adds a course to the DB
                        url = base + "admin.jsp";
                        break;

                    case "getDepartCourseswithHodId": //Get all the department courses group by level
                        getDepartmentCoursewithHodId(request, response);
                        break;

                    case "getFacultyDepartments":
                        //This get departments and thier number of courses using the dean id
                        getdepartswithDeanId(request, response);
                        break;

                    case "adminaddLect"://Add Lecturer
                        addLecturer(request, response);
                        url = base + "admin.jsp";
                        break;

                    case "lectSetting"://Ordinary lecturer account setting
                        addLecturer(request, response);
                        url = base + "lecturer.jsp";
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

        request.getSession().setAttribute("name", lecturer.getName());
        request.getSession().setAttribute("user", lecturer.getUserName());
        request.getSession().setAttribute("id", lecturer.getId());
        request.getSession().setAttribute("role", lecturer.getLectureRole());
        request.getSession().setAttribute("email", lecturer.getEmail());
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

    public void getLecturers(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Lecturer> lecturers = LecturerDAO.getLecturers(dataManager);
        JSONObject obj = new JSONObject();
        JSONArray profs = returnLecturerArray(lecturers);
        obj.put("lec", profs);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getOutputStream(), obj);
    }

    private JSONArray returnLecturerArray(List<Lecturer> lecturers) {
        JSONArray profs = new JSONArray();
        for (Lecturer lecturer : lecturers) {
            JSONObject de = new JSONObject();
            de.put("id", lecturer.getId());
            de.put("name", lecturer.getName());
            de.put("email", lecturer.getEmail());
            profs.add(de);
        }
        return profs;
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
     *
     * @param request
     * @param httpresponse
     * @throws java.io.IOException
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
     * Add to request blocked lecturer names and corresponding hours in well
     * formed JSON syntax
     *
     * @param request
     * @param response
     * @param day
     * @throws java.io.IOException
     * @throws java.sql.SQLException
     */
    public void getBlockedLecturerInfo(HttpServletRequest request, HttpServletResponse response, int day) throws IOException, SQLException {
        List<Lecturer> lecturers = LecturerDAO.getBlockedLecturers(dataManager, day);

        JSONObject obj = new JSONObject();

//        contains a list of json arrays, each array representing
//        an hour of the day
        JSONArray hoursObject = new JSONArray();
        for (int i = 0; i < 12; i++) {
            //create an array for each hour
            hoursObject.add(new JSONArray());
        }

        for (Lecturer lecturer : lecturers) {
            JSONObject de = new JSONObject();
            de.put("name", lecturer.getName());
            de.put("hour", lecturer.getHour());
            switch (lecturer.getHour()) {
                case 7:
                    ((JSONArray) hoursObject.get(0)).add(de);
                    break;
                case 8:
                    ((JSONArray) hoursObject.get(1)).add(de);
                    break;
                case 9:
                    ((JSONArray) hoursObject.get(2)).add(de);
                    break;
                case 10:
                    ((JSONArray) hoursObject.get(3)).add(de);
                    break;
                case 11:
                    ((JSONArray) hoursObject.get(4)).add(de);
                    break;
                case 12:
                    ((JSONArray) hoursObject.get(5)).add(de);
                    break;
                case 13:
                    ((JSONArray) hoursObject.get(6)).add(de);
                    break;
                case 14:
                    ((JSONArray) hoursObject.get(7)).add(de);
                    break;
                case 15:
                    ((JSONArray) hoursObject.get(8)).add(de);
                    break;
                case 16:
                    ((JSONArray) hoursObject.get(9)).add(de);
                    break;
                case 17:
                    ((JSONArray) hoursObject.get(10)).add(de);
                    break;
                case 18:
                    ((JSONArray) hoursObject.get(11)).add(de);
                    break;
            }

        }

//        System.out.println(hoursObject.toString());
        int longestArray = 0; //get arraylist of lecturers with greatest len
        for (int i = 0; i < 12; i++) { //parse inner and get longest list of lecturer
            JSONArray array = (JSONArray) hoursObject.get(i);
            if (array.size() > longestArray) {
                longestArray = array.size();
            }
        }
        for (int i = 0; i < 12; i++) { //parse all hour arrays
            JSONArray array = (JSONArray) hoursObject.get(i);
            //fill up arrays with length< longestArray with empty string to give them the same length
            for (int j = array.size(); j < longestArray; j++) {

                JSONObject de = new JSONObject();
                de.put("name", " ");
                de.put("hour", " ");
                array.add(de);
            }
        }
//        System.out.println("\n" + hoursObject.toString());
        obj.put("blocked_lecturers", hoursObject);

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getOutputStream(), obj);
    }

    /**
     * Add to request free lecturer names and corresponding hours in well formed
     * JSON syntax
     *
     * @param request
     * @param response
     * @param day
     * @throws java.io.IOException
     * @throws java.sql.SQLException
     */
    public void getFreeLecturerInfo(HttpServletRequest request, HttpServletResponse response, int day) throws IOException, SQLException {
        List<Lecturer> lecturers = LecturerDAO.getFreeLecturers(dataManager, day);
        JSONObject obj = new JSONObject();
//        contains a list of json arrays, each array representing
//        an hour of the day
        JSONArray hoursObject = new JSONArray();
        for (int i = 0; i < 12; i++) {
            //create an array for each hour
            hoursObject.add(new JSONArray());
        }
        for (Lecturer lecturer : lecturers) {
            JSONObject de = new JSONObject();
            de.put("name", lecturer.getName());
            de.put("hour", lecturer.getHour());
            switch (lecturer.getHour()) {
                case 7:
                    ((JSONArray) hoursObject.get(0)).add(de);
                    break;
                case 8:
                    ((JSONArray) hoursObject.get(1)).add(de);
                    break;
                case 9:
                    ((JSONArray) hoursObject.get(2)).add(de);
                    break;
                case 10:
                    ((JSONArray) hoursObject.get(3)).add(de);
                    break;
                case 11:
                    ((JSONArray) hoursObject.get(4)).add(de);
                    break;
                case 12:
                    ((JSONArray) hoursObject.get(5)).add(de);
                    break;
                case 13:
                    ((JSONArray) hoursObject.get(6)).add(de);
                    break;
                case 14:
                    ((JSONArray) hoursObject.get(7)).add(de);
                    break;
                case 15:
                    ((JSONArray) hoursObject.get(8)).add(de);
                    break;
                case 16:
                    ((JSONArray) hoursObject.get(9)).add(de);
                    break;
                case 17:
                    ((JSONArray) hoursObject.get(10)).add(de);
                    break;
                case 18:
                    ((JSONArray) hoursObject.get(11)).add(de);
                    break;
            }

        }
        System.out.println(hoursObject.toString());
        int longestArray = 0; //get arraylist of lecturers with greatest len
        for (int i = 0; i < 12; i++) { //parse inner and get longest list of lecturer
            JSONArray array = (JSONArray) hoursObject.get(i);
            if (array.size() > longestArray) {
                longestArray = array.size();
            }
        }
        for (int i = 0; i < 12; i++) { //parse all hour arrays
            JSONArray array = (JSONArray) hoursObject.get(i);
            //fill up arrays with length< longestArray with empty string to give them the same length
            for (int j = array.size(); j < longestArray; j++) {

                JSONObject de = new JSONObject();
                de.put("name", " ");
                de.put("hour", " ");
                array.add(de);
            }
        }
//        System.out.println("\n" + hoursObject.toString());
        obj.put("blocked_lecturers", hoursObject);
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
        JSONArray profs = returnLecturerArray(lecturers);
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
     * Called when a Lecturer with the Dean or HOD role wants to schedule a
     * Course
     *
     * @param request
     * @param response
     * @throws java.io.IOException
     */
    public void loadScheduleData(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Course> dbCourses;
        if (request.getSession().getAttribute("role").equals("Dean")) {
            int deanId = (Integer) request.getSession().getAttribute("id");
            dbCourses = CourseDAO.getCourseByFaculty(dataManager, deanId);
        } else {
            dbCourses = CourseDAO.getCourseByHodId(dataManager,
                    Integer.parseInt(request.getSession().getAttribute("id").toString()));
        }

            JSONObject lectAndCourses = new JSONObject();
            JSONArray coursesArray = new JSONArray();
            for (Course course : dbCourses) {
                JSONObject object = new JSONObject();
                object.put("id", course.getId());
                object.put("title", course.getName());
                object.put("semester", course.getSemester());
                coursesArray.add(object);
            }
            lectAndCourses.put("courses", coursesArray);

            JSONArray lectArray = returnLecturerArray(LecturerDAO.getLecturers(dataManager));
            lectAndCourses.put("lecturers", lectArray);

            List<Classroom> classrooms = ClassroomDAO.getClasses(dataManager);
            JSONObject dbHalls = new JSONObject();
            JSONArray hallArray = new JSONArray();
            for (Classroom classroom : classrooms) {
                JSONObject hall = new JSONObject();
                hall.put("id", classroom.getId());
                hall.put("name", classroom.getName());
                hallArray.add(hall);
            }
            lectAndCourses.put("halls", hallArray);

            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(response.getOutputStream(), lectAndCourses);
        }

    public void getScheduleData(HttpServletRequest request, HttpServletResponse response, String action) throws SQLException, IOException {
        ResultSet resultSet;
        if (action.equals("getIndividualSchedule")) {
            int lecturerId = Integer.parseInt(request.getSession().getAttribute("id").toString());
            resultSet = LecturerDAO.getLecturerSchedule(dataManager, lecturerId);
        }else{
            resultSet = CourseDAO.getScheduleDepartCourse(dataManager, Integer.parseInt(request.getParameter("id")));
            Department department = DepartmentDAO.getDepartmentById(dataManager, Integer.parseInt(request.getParameter("id")));
            request.setAttribute("department", department.getName());
            Faculty faculty = FacultyDAO.getFacultyById(dataManager, department.getFaculty());
            request.setAttribute("faculty", faculty.getName());
        }

        JSONArray schedule = new JSONArray();
        JSONArray tempSchedule = new JSONArray();
        JSONObject nullObject = new JSONObject();
        nullObject.put("course_id", " ");
        nullObject.put("class", " ");
        nullObject.put("hour", " ");
        nullObject.put("day", " ");
        for (int i = 0; i < 6; i++) {
            schedule.add(new JSONArray());
            tempSchedule.add(new JSONArray());
        }

        //get all rows of day i
        while (resultSet.next()) {
            JSONObject object = new JSONObject();
            object.put("course_id", resultSet.getString(1));
            object.put("class", resultSet.getString(2));
            object.put("hour", resultSet.getString(3));
            object.put("day", resultSet.getString(4));

            switch (resultSet.getString(4)) {
                case "2":
                    ((JSONArray) tempSchedule.get(0)).add(object);
                    break;
                case "3":
                    ((JSONArray) tempSchedule.get(1)).add(object);
                    break;
                case "4":
                    ((JSONArray) tempSchedule.get(2)).add(object);
                    break;
                case "5":
                    ((JSONArray) tempSchedule.get(3)).add(object);
                    break;
                case "6":
                    ((JSONArray) tempSchedule.get(4)).add(object);
                    break;
                case "7":
                    ((JSONArray) tempSchedule.get(5)).add(object);
                    break;
            }
        }

        for (int i = 0; i < 6; i++) {
            JSONArray tempArray = (JSONArray) tempSchedule.get(i);
            JSONArray array = (JSONArray) schedule.get(i);
            for (int j = 0, k = 7; j < 12 && k < 19; j++, k++) {
//                if (i < tempArray.size()) {//check whether there are elements in the
//                    inner array(contains lectures schedule objects)
//                    JSONObject tempObject = (JSONObject) tempArray.get(i);
//                }
//                if the array is empty, fill it with null objects and exit
                //tempArray contains hours indices from 0 to 11
                System.out.println("i " + i + " j " + j);
                if (j < tempArray.size()) {
                    JSONObject tempObject = (JSONObject) tempArray.get(j);
                    System.out.println(tempObject);
                    int hour = Integer.parseInt((String) tempObject.get("hour"));

                    if (hour == k) {
//                    Add the object to the corresponding array
                        ((JSONArray) schedule.get(i)).add(tempObject);
                        System.out.println(schedule.get(i));
                    } else {//add a null object
                        ((JSONArray) schedule.get(i)).add(nullObject);
                    }
                } else {
                    ((JSONArray) schedule.get(i)).add(nullObject);
                }

            }
        }

        System.out.println(schedule);
        JSONObject object = new JSONObject();
        object.put("schedule", schedule);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getOutputStream(), object);
    }

    public void scheduleClass(HttpServletRequest request) {
        LecturerHasCourse hasCourse = new LecturerHasCourse();
        hasCourse.setLecturer(Integer.parseInt(request.getParameter("lecturer")));
        hasCourse.setCourse(request.getParameter("course"));
        hasCourse.setClassroom(Integer.parseInt(request.getParameter("hall")));
        int startHour = Integer.parseInt(request.getParameter("starthour"));
        int endHour = Integer.parseInt(request.getParameter("endhour"));

        Calendar start = Calendar.getInstance();
        Calendar end = Calendar.getInstance();
        start.set(Calendar.HOUR_OF_DAY, startHour);
        java.sql.Timestamp timestamp = new java.sql.Timestamp((new Date()).getTime());

        if (endHour > startHour + 1) {
            endHour -= 1;
        }
        end.set(Calendar.HOUR_OF_DAY, endHour);
        int day = Integer.parseInt(request.getParameter("day"));
        switch (day) {
            case 1:
                start.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
                end.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
                break;
            case 2:
                start.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
                end.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
                break;
            case 3:
                start.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
                end.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
                break;
            case 4:
                start.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
                end.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
                break;
            case 5:
                start.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
                end.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
                break;
            case 6:
                start.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
                end.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
                break;
        }
        timestamp.setTime(start.getTimeInMillis());
        System.out.println(timestamp);
        LecturerHasCourseDAO.addTaughtCourse(dataManager, hasCourse, start);
        for (int i = startHour + 1; i <= endHour; i++) {
            end.set(Calendar.HOUR_OF_DAY, i);
            end.set(Calendar.DAY_OF_WEEK, start.get(Calendar.DAY_OF_WEEK));
            LecturerHasCourseDAO.addTaughtCourse(dataManager, hasCourse, end);

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

        Department department = DepartmentDAO.getDepartmentById(dataManager, depart_id);

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
        int numofCourses = Level200.size() + Level300.size() + Level400.size() + Level500.size();

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
                    for (int j = longestLength; j > Level500.size(); j--) {
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
        obj.put("len", numofCourses);
        obj.put("depart_name", department.getName());

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getOutputStream(), obj);

    }

    private void getdepartswithDeanId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int dean_id = Integer.parseInt(request.getParameter("dean_id"));
        Faculty fac = FacultyDAO.getFacultyByDeanId(dataManager, dean_id);

        int faculty_id = fac.getId();
        List<Department> departs = DepartmentDAO.getDepartmentsByFacultyId(dataManager, faculty_id);

        JSONArray departArray = new JSONArray();

        for (Department depart : departs) {
            JSONObject dep = new JSONObject();
            dep.put("id", depart.getId());
            dep.put("name", depart.getName());
            int numOfCourses = CourseDAO.getCourseByDepartment(dataManager, depart.getId()).size();
            dep.put("numOfCourses", numOfCourses);
            departArray.add(dep);
        }

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getOutputStream(), departArray);
    }

}
