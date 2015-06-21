<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>UB Time Table Systems</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet"/>
        <!-- Dashboard Custom CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">
        <script src="js/respond.min.js"></script><!-- Used to add support for IE 8 -->

        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/tablelist.js" type="text/javascript" ></script>
        <script src="js/individuallist.js" type="text/javascript"></script>
    </head>
    <body>
        <header class="page-header">
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <span class="navbar-brand">Time Table Systems</span>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <form class="navbar-form navbar-right" action="TimeTableServlet">
                            <div class="form-group">
                                <input type="hidden" name="username"  class="form-control">
                            </div>

                            <button type="submit" name="submit" value="logout" class="btn btn-success">LogOut</button>
                        </form>
                    </div><!--/.navbar-collapse -->
                </div>
            </nav>
        </header>


        <div class="pagecontent">
            <div class="pagecontent_left">        


                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <i class="glyphicon glyphicon-user" style="color: #FFF"></i><span> ${sessionScope.user} </span>
                    </li>

                    <li>

                        <a href="#" data-toggle="modal" data-target="#addlecturerModal" id="accountsetting">
                            Account Setting <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#"  id="myschedule">My Schedule
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a  href="#" data-toggle="modal" 
                            data-target="#addclassModal" onclick="loadCourseLectHalls()">Add Class
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" id="courses">Courses
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" data-toggle="modal" data-target="#addlecturerModal" id="visitinglecturer">Visiting Lecturer 
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" id="blockedlist">Blocked List
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" id="freelist" >Free list
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li id="assignHodTask">
                        <a href="#" >Assign HOD
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                </ul>

            </div>
            <div class="pagecontent_right">
                <div class="container-fluid">

                    <div class="row" style="background-color: white" id="row">
                        <div class="col-md-12">
                            <h1></h1>
                            <div id="listdisplay">
                                <div class="panel panel-default" style="width: 85%">
                                    <div class="panel-heading">
                                        <h1 class="panel-title" style="text-align: center"><b>Block list</b></h1>
                                    </div>
                                </div>
                                <ul class="nav nav-tabs" style="width: 85%">
                                    <!----tab interface........................................................................-->




                                    <li class="active"><a href="#"
                                                          type="submit" id="day1" data-toggle="tab">Monday</a></li>

                                    <li class="active"><a href="#" 
                                                          type="submit" id="day2"  data-toggle="tab">Tuesday</a></li>

                                    <li class="active"><a href="#" 
                                                          type="submit" id="day3" data-toggle="tab">Wednesday</a></li>

                                    <li class="active"><a href="#" 
                                                          type="submit" id="day4" data-toggle="tab">Thursday</a></li>

                                    <li class="active"><a href="#"
                                                          type="submit" id="day5"data-toggle="tab">Friday</a></li>

                                    <li class="active"><a href="#"
                                                          type="submit" id="day6" data-toggle="tab">Saturday</a></li>
                                </ul>
                                <!----end tab interface...........................................................................................-->

                                <div class="tab-content">

                                    <div class="tab-pane active" id="timetable">

                                    </div><!-- @end #hello -->
                                </div>
                            </div>



                            <div id="freelistdisplay">

                                <div class="panel panel-default" style="width: 85%">
                                    <div class="panel-heading">
                                        <h1 class="panel-title" style="text-align: center"><b>Free list</b></h1>
                                    </div>
                                </div>
                                <ul class="nav nav-tabs">
                                    <!----tab interface........................................................................-->




                                    <li class="active"><a href="#"
                                                          type="submit" id="freeday1" data-toggle="tab">Monday</a></li>

                                    <li class="active"><a href="#" 
                                                          type="submit" id="freeday2"  data-toggle="tab">Tuesday</a></li>

                                    <li class="active"><a href="#" 
                                                          type="submit" id="freeday3" data-toggle="tab">Wednesday</a></li>

                                    <li class="active"><a href="#" 
                                                          type="submit" id="freeday4" data-toggle="tab">Thursday</a></li>

                                    <li class="active"><a href="#"
                                                          type="submit" id="freeday5"data-toggle="tab">Friday</a></li>

                                    <li class="active"><a href="#"
                                                          type="submit" id="freeday6" data-toggle="tab">Saturday</a></li>
                                </ul>
                                <!----end tab interface...........................................................................................-->

                                <div class="tab-content">

                                    <div class="tab-pane active" id="freelisttable">

                                    </div><!-- @end #hello -->
                                </div>
                            </div>
                            <!-- start of personal schedule -->

                            <div class="panel panel-default" style="width: 85%" id="myscheduledisplay">

                            </div>

                            <div id="courselist" class="alert-info">


                                <h1>Courses &nbsp;<button id="addcoursebutton" data-toggle="modal" data-target="#addcourseModal" class="btn btn-default">Add</button></h1>


                                <div class="row" id="departments-cards">

                                    <div class="col-lg-3 col-md-6">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <i class="fa fa-comments fa-5x"></i>
                                                    </div>
                                                    <div class="col-xs-9 text-right">
                                                        <span class="pull-left text-center less_huge">Electrical Engineering</span>


                                                        <div class="huge">2</div>
                                                        <div>Courses</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="#" id="task_fac">

                                                <div class="panel-footer">
                                                    <span class="pull-left">&nbsp;</span>
                                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>


                                    <!--department panel..........................................--> 

                                    <div class="col-lg-3 col-md-6">
                                        <div class="panel panel-green">
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <i class="fa fa-tasks fa-5x"></i>
                                                    </div>
                                                    <div class="col-xs-9 text-right">

                                                        <div class="huge">3</div>
                                                        <div>Courses</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="#" id="task_lec">

                                                <div class="panel-footer">
                                                    <span class="pull-left">View Details</span>
                                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>


                                    <div class="col-lg-3 col-md-6">
                                        <div class="panel panel-yellow">
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                                    </div>
                                                    <div class="col-xs-9 text-right">

                                                        <div class="huge">3</div>
                                                        <div>department name</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="#" id="task_hall">

                                                <div class="panel-footer">
                                                    <span class="pull-left">View Details</span>
                                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>


                                </div>

                                <div class="panel panel-default" style="width: 85%">
                                    <div class="panel-heading">
                                        <h1 class="panel-title" style="text-align: center"><b>Course List</b></h1>
                                    </div>

                                    <div class="panel-body" id="courselistcontent">


                                    </div>



                                </div>
                            </div>

                            <div class="push"></div>
                            <footer class="footer">
                                <p>&COPY;Team5 2015</p>
                            </footer>
                        </div>

                        <!-- Modal -->
                        <!-- Add lecturer modal -->
                        <div id="addlecturerModal" class="modal fade" data-backdrop="static" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Add Lecturer</h4>
                                    </div>
                                    <form action="TimeTableServlet" method="POST" id="newLecForm">
                                        <div class="modal-body">
                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="full-name-addon">Full Name</span>
                                                <input name="fullname" type="text" class="form-control" required="required" 
                                                       placeholder="Fullname" aria-describedby="full-name-addon">

                                            </div>
                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="username-addon">Username</span>
                                                <input name="username" type="text" class="form-control" required="required" placeholder="Username" aria-describedby="username-addon">

                                            </div >

                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="username-addon">Email   </span>
                                                <input name="email" type="email" class="form-control" required="required" placeholder="Email" aria-describedby="emailname-addon">

                                            </div >

                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="password-addon">password</span>
                                                <input name="password" type="password" class="form-control" required="required" placeholder="Password" aria-describedby="password-addon">
                                            </div>

                                            <input name="id" type="hidden" id="lecid">

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            <button class="btn btn-success" type="submit" name="submit" value="adminaddLect">Save</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div> 
                        <!-- End of Add lecturer modal 
                               
                        
                   
                        <!-- Add Class modal -->
                        <div id="addclassModal" class="modal fade" data-backdrop="static" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Add Class</h4>
                                    </div>
                                    <form action="TimeTableServlet" method="POST" id="newLecForm">
                                        <div class="modal-body">
                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="lecturer-name-addon">Lecturer</span>
                                                <select name="lecturer" id="lecturers" required="required" class="form-control"  
                                                        aria-describedby="lecturer-name-addon">
                                                </select >
                                            </div>
                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="course-addon">Course&nbsp;</span>
                                                <select name="course" id="course" required="required" class="form-control"  aria-describedby="course-addon">
                                                </select >
                                            </div >
                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="day-addon">Day&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                <select name="day" required="required" class="form-control"  aria-describedby="day-addon">
                                                    <option selected="true"  disabled="true">Select Day</option>
                                                    <option value="1">MONDAY</option> 
                                                    <option value="2">TUESDAY</option>
                                                    <option value="3">WEDNESDAY</option>
                                                    <option value="4">THURSDAY</option>
                                                    <option value="5">FRIDAY</option>
                                                    <option value="6">SATURDAY</option>                                 
                                                </select >
                                            </div >
                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="hall-addon">Hall&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                                <select id="hall" name="hall" required="required" class="form-control"  aria-describedby="hall-addon">

                                                </select >
                                            </div >
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <label>Start Time</label>
                                                    <select name="starthour" required="required" class="form-control">
                                                        <option selected="true"  disabled="true" value="">Hour</option>
                                                        <option value="7">07</option>


                                                        <option value="8">08</option>
                                                        <option value="9">09</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <br/>
                                            <div class="form-inline">
                                                <div class="form-group">
                                                    <label>End Time &nbsp;</label>
                                                    <select name="endhour" required="required" class="form-control">
                                                        <option selected="true"  disabled="true" value="">Hour</option>
                                                        <option value="7">07</option>
                                                        <option value="8">08</option>
                                                        <option value="9">09</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            <button class="btn btn-success" type="submit" name="submit" value="addClass">Save</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div> <!-- End of Add class modal-->

                        <!-- Add course modal -->
                        <div id="addcourseModal" class="modal fade" data-backdrop="static" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Add Course</h4>
                                    </div>
                                    <form action="TimeTableServlet" method="POST" id="newcourseform">
                                        <div class="modal-body">
                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="full-name-addon">Code</span>
                                                <input name="code" type="text" class="form-control" required="required" 
                                                       placeholder="course code" aria-describedby="full-name-addon">

                                            </div>
                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="username-addon">Title</span>
                                                <input name="title" type="text" class="form-control" required="required" placeholder="Course title" aria-describedby="username-addon">

                                            </div >

                                            <div class="input-group form-group">
                                                <span class="input-group-addon" id="username-addon">Semester   </span>
                                                <select name="semester" required="required" class="form-control" aria-describedby="emailname-addon">
                                                    <option value="" disabled="true" selected="true">Select Semester</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                </select>

                                            </div >
                                            <input name="depart_id" required="required" type="hidden">

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            <button class="btn btn-success" type="submit" name="submit" value="addCourse">Save</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div> <!-- End of Add course modal-->
                        
                        <div style="background-color: transparent" class="modal fade" data-backdrop="static" id="loading">
                            <div class="modal-dialog">                                
                                <div class="modal-content">
                                    <div class="modal-body" style="text-align: center">
                                        <img src="fonts/715.GIF">  Loading...
                                        <!--<span class="glyphicon glyphicon-refresh glyphicon-refresh-animate"></span>Loading-->
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
            
                        <!--  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
                                     <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->


                        <!-- Bootstrap CDN which will be incoporated when hosting the app
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>-->




                        <script>
                            //                Loads lecturers from the database for the lecurers drop down
                            //                courses for the courses drop down


                            function loadCourseLectHalls() {
                                var request = $.ajax({
                                    url: "TimeTableServlet",
                                    data: {"submit": "loadLectsAndCourses"},
                                    method: "POST"
                                }).done(function (msg) {
                                    
                                    var response = JSON.parse(msg);
                                    var lecturerList = document.getElementById("lecturers");
                                    var courseList = document.getElementById("course");

                                    var hallList = document.getElementById("hall");
                                    for (var m = lecturerList.options.length - 1; m >= 0; m--) {
                                        lecturerList.options[m] = null;
                                    }
                                    for (var m = courseList.options.length - 1; m >= 0; m--) {
                                        courseList.options[m] = null;
                                    }
                                    for (var m = hallList.options.length - 1; m >= 0; m--) {
                                        hallList.options[m] = null;
                                    }

                                    lecturerList.options[0] = new Option("Select Lecturer", "", true);
                                    lecturerList.options[0].disabled = true;
                                    courseList.options[0] = new Option("Select Course", "", true);
                                    courseList.options[0].disabled = true;
                                    hallList.options[0] = new Option("Select Lecture Hall", "", true);
                                    hallList.options[0].disabled = true;

                                    for (var i = 0; i < response.courses.length; i++) {
                                        courseList.options[i + 1] = new Option(response.courses[i].title, response.courses[i].id);
                                    }//end for
                                    for (var i = 0; i < response.lecturers.length; i++) {
                                        lecturerList.options[i + 1] = new Option(response.lecturers[i].name, response.lecturers[i].id);
                                    }
                                    for (var i = 0; i < response.halls.length; i++) {
                                        hallList.options[i + 1] = new Option(response.halls[i].name, response.halls[i].id);
                                    }
                                });
                            }

                            $(document).ready(function () {
                                var role = "${sessionScope.role}";
                                if (role === "HOD") {
                                    $("#assignHodTask").hide();
                                } else {
                                    //hide the add courses button from the dean, only HOD can do that
                                    $("#addcoursebutton").hide();
                                }

                                $("#accountsetting").click(function () {
                                    var docForm = document.getElementById("newLecForm");
                                    docForm.fullname.value = "${sessionScope.name}";
                                    docForm.username.value = "${sessionScope.user}";
                                    docForm.email.value = "${sessionScope.email}";
                                    docForm.password.value = "";
                                    docForm.id.value =${sessionScope.id};
                                });
                                
                                //Initialising the page content
                                $("#courselist").hide();
                                $("#listdisplay").hide();
                                $("#freelistdisplay").hide();
                                loadLecturerschedule();

                                $("#visitinglecturer").click(function () {
                                    $("#visitinglecturer").focus();
                                    var docForm = document.getElementById("newLecForm");
                                    docForm.email.value = "";
                                    docForm.password.value = "";
                                    $("#lecid").remove();
                                });
                                $("#myschedule").click(function () { //when tab is clicked
                                    loadLecturerschedule();
                                    $("#courselist").hide("slow");
                                    $("#listdisplay").hide("slow");
                                    $("#myscheduledisplay").show("slow");
                                    $("#freelistdisplay").hide();
                                    $("#myschedule").focus();
                                    $("#row").css({"background-color": "white"});
                                });
                                $("#blockedlist").click(function () { //when tab is clicked
                                    $("#courselist").hide("slow");
                                    $("#myscheduledisplay").hide("slow");
                                    $("#listdisplay").show("slow");
                                    $("#freelistdisplay").hide();
                                    $("#blockedlist").focus();
                                    $("#row").css({"background-color": "white"});
                                });
                                $("#freelist").click(function () { //when tab is clicked
                                    $("#courselist").hide("slow");
                                    $("#myscheduledisplay").hide("slow");
                                    $("#freelistdisplay").show("slow");
                                    $("#listdisplay").hide();
                                    $("#freelist").focus();
                                    $("#row").css({"background-color": "white"});
                                });
                                $("#courses").click(function () { //when tab is clicked
                                    $("#myscheduledisplay").hide("slow");
                                    $("#freelistdisplay").hide("slow");
                                    $("#listdisplay").hide();
                                    $("#courses").focus();
                                    var docForm = document.getElementById("newcourseform");
                                    docForm.depart_id.value = ${sessionScope.id};
                                    var role = "${sessionScope.role}";
                                    if (role === "HOD") {
                                        //Query for the HOD courses and display
                                        $.ajax({
                                            url: "TimeTableServlet",
                                            async: false,
                                            data: {"submit": "getDepartCourseswithHodId", "hod_id": "${sessionScope.id}"}

                                        }).done(function (msg) {

                                            var response = JSON.parse(msg);
                                            var content = "";
                                            content += '<table style="text-align: center"class="table table-bordered table-striped table-hover table-responsive table-condensed">' +
                                                    '<thead>' +
                                                    '<tr>' +
                                                    '<th>Level 200</th>' +
                                                    '<th>Level 300</th>' +
                                                    '<th>Level 400</th>' +
                                                    '<th>Level 500</th>' +
                                                    '</tr>' +
                                                    '</thead>' +
                                                    '<tbody>';
                                            for (var i = 0; i < response.level200.length; i++) {
                                                content += '<tr>' +
                                                        '<td>' + response.level200[i].title + '</td>' +
                                                        '<td>' + response.level300[i].title + '</td>' +
                                                        '<td>' + response.level400[i].title + '</td>' +
                                                        '<td>' + response.level500[i].title + '</td>' +
                                                        '</tr>';
                                            }
                                            content += '</tbody></table>';
                                            $("#courselistcontent").html(content);
                                            var depart_card = '<div class="col-lg-3 col-md-6">' +
                                                    '<div class="panel panel-primary">' +
                                                    '<div class="panel-heading">' +
                                                    '<div class="row">' +
                                                    '<div class="col-xs-3">' +
                                                    '<i class="fa fa-comments fa-5x"></i>' +
                                                    '</div>' +
                                                    '<div class="col-xs-9 text-right">' +
                                                    '<span class="pull-left text-center less_huge">' + response.depart_name + '</span>' +
                                                    '<div class="huge">' + response.len + '</div>' +
                                                    '<div>Courses</div>' +
                                                    '</div>' +
                                                    '</div>' +
                                                    '</div>' +
                                                    '<a href="#" id="task_fac">' +
                                                    '<div class="panel-footer">' +
                                                    '<span class="pull-left">&nbsp;</span>' +
                                                    '<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>' +
                                                    '<div class="clearfix"></div>' +
                                                    '</div>' +
                                                    '</a>' +
                                                    '</div>' +
                                                    '</div>';
                                            $("#departments-cards").html(depart_card);
                                        });
                                    }
                                    else if (role === "Dean") {
                                        //Query for the dean courses
                                        //                                        $.ajax({
                                        //                                            url: "TimeTableServlet",
                                        //                                            async: false,
                                        //                                            data: {"submit": "getFacultyDepartments", "dean_id": "${sessionScope.id}"}
                                        //                                            
                                        //                                        }).done(function (msg) {
                                        //                                            
                                        //                                        });
                                    }
                                    $("#row").css({"background-color": "transparent"});
                                    $("#courselist").show("slow");
                                });
                            }); //end ready


                        </script>

                        </body>
                        </html>

