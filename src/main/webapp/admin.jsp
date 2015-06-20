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
                            data-target="#addclassModal" onclick="loadCourses()">Add Class
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" id="courses">Courses
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" data-toggle="modal" data-target="#addlecturerModal">Visiting Lecturer 
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" id="freelist">Free List
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" >BLock List
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
                            <div id="freelistdisplay">

                                <ul class="nav nav-tabs">
                                    <!----tab interface-->




                                    <li class="active"><a href="#" action="TimeTableServlet" 
                                                          type="submit" id="day1" data-toggle="tab">Monday</a></li>

                                    <li><a href="#tuesday" id="day2" data-toggle="tab">Tuesday</a></li>
                                    <li><a href="#wednesday" id="day3" data-toggle="tab">Wednesday</a></li>
                                    <li><a href="#thursday" id="day4" data-toggle="tab">Thursday</a></li>
                                    <li><a href="#friday" id="day5"data-toggle="tab">Friday</a></li>
                                    <li><a href="#saturday" id="day6" data-toggle="tab">Saturday</a></li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="tuesday">
                                    </div>
                                    <div class="tab-pane active" id="monday">
                                        <table style="width: 85%; text-align: center"class="table table-bordered table-striped table-hover table-responsive table-condensed">
                                            <thead>
                                                <tr>

                                                    <th>7am</th>
                                                    <th>8am</th>
                                                    <th>9am</th>
                                                    <th>10am</th>
                                                    <th>11am</th>
                                                    <th>12pm</th>
                                                    <th>1pm</th>
                                                    <th>2pm</th>
                                                    <th>3pm</th>
                                                    <th>4pm</th>
                                                    <th>5pm</th>
                                                    <th>6pm</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>

                                                    <td>CEF 502<br> Ublock A</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>CEF 506<br> ClBLK II 50D</td>
                                                    <td>CEF XXX</td>
                                                    <td>CEF XXX</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>

                                                    <td>CEF XXX</td>
                                                    <td>CEF XXX</td>
                                                    <td>CEF XXX</td>
                                                    <td>CEF XXX</td>
                                                    <td>CEF XXX</td>
                                                    <td>CEF XXX</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>

                                                </tr>
                                                <tr>


                                                    <td>CEF 502<br> Ublock A</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>CEF 506<br> ClBLK II 50D</td>
                                                    <td>CEF XXX</td>
                                                    <td>CEF XXX</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>

                                                </tr>


                                                <tr>
                                                    <td>9AM</td>

                                                    <td>CEF 502<br> Ublock A</td>
                                                    <td>CEF 510<br> Ublock C</td>
                                                    <td></td>
                                                    <td>CEF 506<br> ClBLK I 50A</td>
                                                    <td></td>
                                                    <td>CEF 504<br> Ublock D</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>


                                                </tr>


                                            </tbody>

                                        </table>
                                    </div><!-- @end #hello -->
                                </div>
                            </div>
                            <!-- start of personal schedule -->

                            <div class="panel panel-default" style="width: 85%" id="myscheduledisplay">
                                <div class="panel-heading">
                                    <h1 class="panel-title" style="text-align: center">My Schedule</h1>
                                </div>
                                <div class="panel-body">
                                    <table style="text-align: center"class="table table-bordered table-striped table-hover table-responsive table-condensed">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>07:00 - 09:00</th>
                                                <th>09:00 - 11:00</th>
                                                <th>11:00 - 13:00</th>
                                                <th>13:00 - 15:00</th>
                                                <th>15:00 - 17:00</th>
                                                <th>17:00 - 19:00</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>MON</td>
                                            </tr>


                                            <tr>
                                                <td>TUE</td>
                                                <td>CEF 502<br> Ublock A</td>
                                                <td>CEF 510<br> Ublock C</td>
                                                <td></td>
                                                <td>CEF 506<br> ClBLK I 50A</td>
                                                <td></td>
                                                <td>CEF 504<br> Ublock D</td>

                                            </tr>
                                            <tr>
                                                <td>WED</td>
                                                <td></td>
                                                <td></td>
                                                <td>CEF 514<br> ClBLK I 50A</td>
                                                <td></td>
                                                <td>CEF 506<br> Restau 2</td>
                                                <td></td>

                                            </tr>
                                            <tr>
                                                <td>THURS</td>
                                            </tr>
                                            <tr>
                                                <td>FRI</td>
                                                <td>CEF 502<br> Ublock A</td>
                                                <td>CEF 510<br> Ublock C</td>
                                                <td></td>
                                                <td>CEF 506<br> ClBLK I 50A</td>
                                                <td></td>
                                                <td>CEF 504<br> Ublock D</td>
                                            </tr>
                                            <tr>
                                                <td>SAT</td>
                                                <td></td>
                                                <td></td>
                                                <td>CEF 514<br> ClBLK I 50A</td>
                                                <td></td>
                                                <td>CEF 506<br> Restau 2</td>
                                                <td></td>

                                            </tr>
                                        </tbody>
                                    </table>
                                </div>



                            </div>

                            <div id="courselist" class="alert-info">

                                <h1>Courses &nbsp;<button id="addcoursebutton" data-toggle="modal" data-target="#addcourseModal" class="btn btn-default">Add</button></h1>
                                <div class="row">
                                    <!--faculty panel..........................--> 
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

                                <div class="panel panel-default" style="width: 85%" id="myscheduledisplay">
                                    <div class="panel-heading">
                                        <h1 class="panel-title" style="text-align: center"><b>Course List</b></h1>
                                    </div>
                                    <div class="panel-body">
                                        <table style="text-align: center"class="table table-bordered table-striped table-hover table-responsive table-condensed">
                                            <thead>
                                                <tr>

                                                    <th>Level 200</th>
                                                    <th>Level 300</th>
                                                    <th>Level 400</th>
                                                    <th>Level 500</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>CEF201: Linear Algebra</td>
                                                    <td>CEF306: OO Programming</td>
                                                    <td>CEF406: Database Administration</td>
                                                    <td>CEF502: Java EE</td>
                                                </tr>


                                                <tr>
                                                    <td>CEF201: Linear Algebra</td>
                                                    <td>CEF306: OO Programming</td>
                                                    <td>CEF406: Database Administration</td>
                                                    <td>CEF502: Java EE</td>
                                                </tr>
                                                <tr>
                                                    <td>CEF201: Linear Algebra</td>
                                                    <td>CEF306: OO Programming</td>
                                                    <td>CEF406: Database Administration</td>
                                                    <td>CEF502: Java EE</td>

                                                </tr>
                                                <tr>
                                                    <td>CEF201: Linear Algebra</td>
                                                    <td>CEF306: OO Programming</td>
                                                    <td>CEF406: Database Administration</td>
                                                    <td>CEF502: Java EE</td>
                                                </tr>
                                                <tr>
                                                    <td>CEF201: Linear Algebra</td>
                                                    <td>CEF306: OO Programming</td>
                                                    <td>CEF406: Database Administration</td>
                                                    <td>CEF502: Java EE</td>
                                                </tr>
                                                <tr>
                                                    <td>CEF201: Linear Algebra</td>
                                                    <td>CEF306: OO Programming</td>
                                                    <td>CEF406: Database Administration</td>
                                                    <td>CEF502: Java EE</td>

                                                </tr>
                                                <tr>
                                                    <td>CEF201: Linear Algebra</td>
                                                    <td>CEF306: OO Programming</td>
                                                    <td>CEF406: Database Administration</td>
                                                    <td>CEF502: Java EE</td>

                                                </tr>
                                                <tr>
                                                    <td>CEF201: Linear Algebra</td>
                                                    <td>CEF306: OO Programming</td>
                                                    <td>CEF406: Database Administration</td>
                                                    <td>CEF502: Java EE</td>

                                                </tr>
                                                <tr>
                                                    <td>CEF201: Linear Algebra</td>
                                                    <td>CEF306: OO Programming</td>
                                                    <td>CEF406: Database Administration</td>
                                                    <td>CEF502: Java EE</td>

                                                </tr>
                                                <tr>
                                                    <td>CEF201: Linear Algebra</td>
                                                    <td>CEF306: OO Programming</td>
                                                    <td>CEF406: Database Administration</td>
                                                    <td>CEF502: Java EE</td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>



                                </div>
                            </div>

                            <div class="push"></div>
                            <footer class="footer">
                                <p>&COPY;Team5 2015</p>
                            </footer>
                        </div>

                    </div>
                </div>
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

                                <input name="id" type="hidden">

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                <button class="btn btn-success" type="submit" name="submit" value="addLect">Save</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div> <!-- End of Add lecturer modal 
                   
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
                                        <option>MONDAY</option> 
                                        <option>TUESDAY</option>
                                        <option>WEDNESDAY</option>
                                        <option>THURSDAY</option>
                                        <option>FRIDAY</option>
                                        <option>SATURDAY</option>                                 
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
                                            <option value="9">09</option>
                                        </select>
                                        <select name="startminute" required="required" class="form-control">
                                            <option selected="true" disabled="true" value="">Minute</option>
                                            <option value="0">00</option>
                                            <option value="1">01</option>
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
                                            <option value="9">09</option>
                                        </select>
                                        <select name="endminute" required="required" class="form-control">
                                            <option selected="true" disabled="true" value="">Minute</option>
                                            <option value="0">00</option>
                                            <option value="1">01</option>
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
            </div> <!-- End of Add course modal 

            <!-- Jquery CDN which will be incoporated when hosting the app-->

            <!--  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
              <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->

            <!-- Bootstrap CDN which will be incoporated when hosting the app
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>-->
            <script>
//                Loads lecturers from the database for the lecurers drop down
//                courses for the courses drop down
                function loadCourses() {
                    var request = $.ajax({
                        url: "TimeTableServlet",
                        data: {"submit": "loadLectsAndCourses"},
                        method: "POST"
                    }).done(function (msg) {
                        alert(msg);
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
                    $("#day1").click(function () { //when tab is clicked 

                        var request = $.ajax({
                            url: "TimeTableServlet",
                            data: {"submit": "getMondayLectureHours"},
                            method: "POST"
                        }).done(function (msg) {
//                                    var response = JSON.parse(msg);
                            alert(msg);
                        });
                        //                                $("#panel_list").html("Faculties");
                        //                                $("#panel_list_items").html(content);

                    });

                    //Initialising the page content
                    $("#courselist").hide();
                    $("#freelistdisplay").hide();
                    $("#myscheduledisplay").show("slow");

                    $("#myschedule").click(function () { //when tab is clicked
                        $("#courselist").hide("slow");
                        $("#freelistdisplay").hide("slow");
                        $("#myscheduledisplay").show("slow");
                        $("#row").css({"background-color": "white"});

                    });
                    $("#freelist").click(function () { //when tab is clicked
                        $("#courselist").hide("slow");
                        $("#myscheduledisplay").hide("slow");
                        $("#freelistdisplay").show("slow");
                        $("#row").css({"background-color": "white"});

                    });

                    $("#courses").click(function () { //when tab is clicked
                        $("#myscheduledisplay").hide("slow");
                        $("#freelistdisplay").hide();

                        var docForm = document.getElementById("newcourseform");
                        docForm.depart_id.value = ${sessionScope.id};


                        var role = "${sessionScope.role}";
                        if (role === "HOD") {
                            //Query for the HOD courses and display
//                                    $.ajax({function(){
//                                        url:"TimeTableServlet",
//                                        data:{"submit":"getMondayLectureHours"},
//                                        method:"POST" 
//                                    }).done(function(msg){
//                                        alert(msg);
//                                        
//                                    });
                        } else if (role === "Dean") {
                            //Query for the dean courses
                        }

                        $("#row").css({"background-color": "transparent"});
                        $("#courselist").show("slow");
                    });



                });//end ready

            </script>

    </body>
</html>
