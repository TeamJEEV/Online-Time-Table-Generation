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
                        <a href="#" data-toggle="modal" data-target="#addclassModal">Add Class
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

                    <div class="row" style="background-color: white">
                        <div class="col-md-12">
                            <h1></h1>
                            <div id="freelistdisplay">

                                <ul class="nav nav-tabs">
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

                                <h1>Courses &nbsp;<button>Add</button></h1>
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

                                                        <div class="huge">2</div>
                                                        <div>Faculties</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a href="#" id="task_fac">

                                                <div class="panel-footer">
                                                    <span class="pull-left">View Details</span>
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
                                                        <div>Lecturers</div>
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
                                                        <div>Halls</div>
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
                                    <select name="lecturer" required="required" class="form-control"  aria-describedby="lecturer-name-addon">
                                        <option selected="true" value="" disabled="true">Select Lecturer</option>
                                        <option value="1">Dr Teyou</option>
                                    </select >

                                </div>

                                <div class="input-group form-group">
                                    <span class="input-group-addon" id="course-addon">Course&nbsp;</span>
                                    <select name="course" required="required" class="form-control"  aria-describedby="course-addon">
                                        <option selected="true" value="" disabled="true">Select Course</option>
                                        <option value="1">CEF416: JavaEE</option>
                                    </select >


                                </div >

                                <div class="input-group form-group">
                                    <span class="input-group-addon" id="day-addon">Day&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <select name="day" required="required" class="form-control"  aria-describedby="day-addon">
                                        <option selected="true" value="" disabled="true">Select Day</option>
                                        <option value="1">MONDAY</option> 
                                        <option value="1">TUESDAY</option>
                                        <option value="1">WENESDAY</option>
                                        <option value="1">THURSDAY</option>
                                        <option value="1">FRIDAY</option>
                                        <option value="1">SATURDAY</option>                                 
                                    </select >
                                </div >

                                <div class="input-group form-group">
                                    <span class="input-group-addon" id="hall-addon">Hall&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <select name="hall" required="required" class="form-control"  aria-describedby="hall-addon">
                                        <option selected="true" value="" disabled="true">Select hall</option>
                                        <option value="1">UBlock A</option> 
                                        <option value="1">UBlock B</option>
                                        <option value="1">UBlock D</option>                                                                                 
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
                                <button class="btn btn-success" type="submit" name="submit" value="addLect">Save</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div> <!-- End of Add lecturer modal-->



            <!-- Jquery CDN which will be incoporated when hosting the app-->

            <!--  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
              <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->

            <!-- Bootstrap CDN which will be incoporated when hosting the app
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>-->
            <script>

                $(document).ready(function () {
                    var role = "${sessionScope.role}";

                    if (role === "HOD") {
                        $("#assignHodTask").hide();

                    }

                    $("#accountsetting").click(function () {
                        var docForm = document.getElementById("newLecForm");
                        docForm.fullname.value = "${sessionScope.name}";
                        docForm.username.value = "${sessionScope.user}";
                        docForm.email.value = "${sessionScope.email}";
                        docForm.password.value = "";
                        docForm.id.value =${sessionScope.id};


                    });
                    //Monday Tab click............
                    $("#day1").click(function () { //when tab is clicked 

                        var request = $.ajax({
                            url: "TimeTableServlet",
                            data: {"submit": "getMondayLectureHours"},
                            method: "POST"
                        }).done(function (msg) {
//                            alert(msg);
                            var response = JSON.parse(msg);
                            var content = '<table style = "width: 85%; text-align:center" ' +
                                    'class = "table table-bordered table-striped table-hover table-responsive table-condensed" >' +
                                    '<thead>' +
                                    '<tr>' +
                                    '<th> 7am </th>' +
                                    '<th> 8am </th>' +
                                    '<th> 9am </th>' +
                                    '<th> 10am </th>' +
                                    '<th> 11am </th>' +
                                    '<th> 12pm </th>' +
                                    '<th> 1pm </th>' +
                                    '<th> 2pm </th>' +
                                    '<th> 3pm </th>' +
                                    '<th> 4pm </th>' +
                                    '<th> 5pm </th>' +
                                    '<th> 6pm </th>' +
                                    '</tr>' +
                                    '</thead>' +
                                    '<tbody>';
//                            alert(response.blocked_lecturers.length );
                            for (var i = 0; i < response.blocked_lecturers[0].length; i++) {
                                content += "<tr>";
//                                alert(response.blocked_lecturers[i].length);
                                for (var j = 0; j < response.blocked_lecturers.length; j++) {
                                    content += "<td>" +
                                            response.blocked_lecturers[j][i].name +
                                            "</td>";
                                }
                                content += "</tr>";
                            }
                            content += '</tbody>' +
                                    '</table>';
//                            alert(content);
                            $("#timetable").html(content);
                        });


                    }); // end of monday Click
                    //
//tuesday click......................................
                    $("#day2").click(function () { //when tab is clicked 

                        var request = $.ajax({
                            url: "TimeTableServlet",
                            data: {"submit": "getTuesdayLectureHours"},
                            method: "POST"
                        }).done(function (msg) {
//                            alert(msg);
                            var response = JSON.parse(msg);
                            var content = '<table style = "width: 85%; text-align:center" ' +
                                    'class = "table table-bordered table-striped table-hover table-responsive table-condensed" >' +
                                    '<thead>' +
                                    '<tr>' +
                                    '<th> 7am </th>' +
                                    '<th> 8am </th>' +
                                    '<th> 9am </th>' +
                                    '<th> 10am </th>' +
                                    '<th> 11am </th>' +
                                    '<th> 12pm </th>' +
                                    '<th> 1pm </th>' +
                                    '<th> 2pm </th>' +
                                    '<th> 3pm </th>' +
                                    '<th> 4pm </th>' +
                                    '<th> 5pm </th>' +
                                    '<th> 6pm </th>' +
                                    '</tr>' +
                                    '</thead>' +
                                    '<tbody>';
//                            alert(response.blocked_lecturers.length );
                            for (var i = 0; i < response.blocked_lecturers[0].length; i++) {
                                content += "<tr>";
//                                alert(response.blocked_lecturers[i].length);
                                for (var j = 0; j < response.blocked_lecturers.length; j++) {
                                    content += "<td>" +
                                            response.blocked_lecturers[j][i].name +
                                            "</td>";
                                }
                                content += "</tr>";
                            }
                            content += '</tbody>' +
                                    '</table>';
//                            alert(content);
                            $("#timetable").html(content);
                        });


                    }
                    );
            
            //wednesday click......................................
                    $("#day3").click(function () { //when tab is clicked 

                        var request = $.ajax({
                            url: "TimeTableServlet",
                            data: {"submit": "getWednesdayLectureHours"},
                            method: "POST"
                        }).done(function (msg) {
//                            alert(msg);
                            var response = JSON.parse(msg);
                            var content = '<table style = "width: 85%; text-align:center" ' +
                                    'class = "table table-bordered table-striped table-hover table-responsive table-condensed" >' +
                                    '<thead>' +
                                    '<tr>' +
                                    '<th> 7am </th>' +
                                    '<th> 8am </th>' +
                                    '<th> 9am </th>' +
                                    '<th> 10am </th>' +
                                    '<th> 11am </th>' +
                                    '<th> 12pm </th>' +
                                    '<th> 1pm </th>' +
                                    '<th> 2pm </th>' +
                                    '<th> 3pm </th>' +
                                    '<th> 4pm </th>' +
                                    '<th> 5pm </th>' +
                                    '<th> 6pm </th>' +
                                    '</tr>' +
                                    '</thead>' +
                                    '<tbody>';
//                            alert(response.blocked_lecturers.length );
                            for (var i = 0; i < response.blocked_lecturers[0].length; i++) {
                                content += "<tr>";
//                                alert(response.blocked_lecturers[i].length);
                                for (var j = 0; j < response.blocked_lecturers.length; j++) {
                                    content += "<td>" +
                                            response.blocked_lecturers[j][i].name +
                                            "</td>";
                                }
                                content += "</tr>";
                            }
                            content += '</tbody>' +
                                    '</table>';
//                            alert(content);
                            $("#timetable").html(content);
                        });


                    }
                    );
//end wednesday click

//thursday click......................................
                    $("#day4").click(function () { //when tab is clicked 

                        var request = $.ajax({
                            url: "TimeTableServlet",
                            data: {"submit": "getThursdayLectureHours"},
                            method: "POST"
                        }).done(function (msg) {
//                            alert(msg);
                            var response = JSON.parse(msg);
                            var content = '<table style = "width: 85%; text-align:center" ' +
                                    'class = "table table-bordered table-striped table-hover table-responsive table-condensed" >' +
                                    '<thead>' +
                                    '<tr>' +
                                    '<th> 7am </th>' +
                                    '<th> 8am </th>' +
                                    '<th> 9am </th>' +
                                    '<th> 10am </th>' +
                                    '<th> 11am </th>' +
                                    '<th> 12pm </th>' +
                                    '<th> 1pm </th>' +
                                    '<th> 2pm </th>' +
                                    '<th> 3pm </th>' +
                                    '<th> 4pm </th>' +
                                    '<th> 5pm </th>' +
                                    '<th> 6pm </th>' +
                                    '</tr>' +
                                    '</thead>' +
                                    '<tbody>';
//                            alert(response.blocked_lecturers.length );
                            for (var i = 0; i < response.blocked_lecturers[0].length; i++) {
                                content += "<tr>";
//                                alert(response.blocked_lecturers[i].length);
                                for (var j = 0; j < response.blocked_lecturers.length; j++) {
                                    content += "<td>" +
                                            response.blocked_lecturers[j][i].name +
                                            "</td>";
                                }
                                content += "</tr>";
                            }
                            content += '</tbody>' +
                                    '</table>';
//                            alert(content);
                            $("#timetable").html(content);
                        });
                        
//                        end thursday click...................................

//friday click......................................
                    $("#day5").click(function () { //when tab is clicked 

                        var request = $.ajax({
                            url: "TimeTableServlet",
                            data: {"submit": "getFridayLectureHours"},
                            method: "POST"
                        }).done(function (msg) {
//                            alert(msg);
                            var response = JSON.parse(msg);
                            var content = '<table style = "width: 85%; text-align:center" ' +
                                    'class = "table table-bordered table-striped table-hover table-responsive table-condensed" >' +
                                    '<thead>' +
                                    '<tr>' +
                                    '<th> 7am </th>' +
                                    '<th> 8am </th>' +
                                    '<th> 9am </th>' +
                                    '<th> 10am </th>' +
                                    '<th> 11am </th>' +
                                    '<th> 12pm </th>' +
                                    '<th> 1pm </th>' +
                                    '<th> 2pm </th>' +
                                    '<th> 3pm </th>' +
                                    '<th> 4pm </th>' +
                                    '<th> 5pm </th>' +
                                    '<th> 6pm </th>' +
                                    '</tr>' +
                                    '</thead>' +
                                    '<tbody>';
//                            alert(response.blocked_lecturers.length );
                            for (var i = 0; i < response.blocked_lecturers[0].length; i++) {
                                content += "<tr>";
//                                alert(response.blocked_lecturers[i].length);
                                for (var j = 0; j < response.blocked_lecturers.length; j++) {
                                    content += "<td>" +
                                            response.blocked_lecturers[j][i].name +
                                            "</td>";
                                }
                                content += "</tr>";
                            }
                            content += '</tbody>' +
                                    '</table>';
//                            alert(content);
                            $("#timetable").html(content);
                        });


                    }
                    ); //end friday click
           
           //saturday click......................................
                    $("#day6").click(function () { //when tab is clicked 

                        var request = $.ajax({
                            url: "TimeTableServlet",
                            data: {"submit": "getSaturdayLectureHours"},
                            method: "POST"
                        }).done(function (msg) {
//                            alert(msg);
                            var response = JSON.parse(msg);
                            var content = '<table style = "width: 85%; text-align:center" ' +
                                    'class = "table table-bordered table-striped table-hover table-responsive table-condensed" >' +
                                    '<thead>' +
                                    '<tr>' +
                                    '<th> 7am </th>' +
                                    '<th> 8am </th>' +
                                    '<th> 9am </th>' +
                                    '<th> 10am </th>' +
                                    '<th> 11am </th>' +
                                    '<th> 12pm </th>' +
                                    '<th> 1pm </th>' +
                                    '<th> 2pm </th>' +
                                    '<th> 3pm </th>' +
                                    '<th> 4pm </th>' +
                                    '<th> 5pm </th>' +
                                    '<th> 6pm </th>' +
                                    '</tr>' +
                                    '</thead>' +
                                    '<tbody>';
//                            alert(response.blocked_lecturers.length );
                            for (var i = 0; i < response.blocked_lecturers[0].length; i++) {
                                content += "<tr>";
//                                alert(response.blocked_lecturers[i].length);
                                for (var j = 0; j < response.blocked_lecturers.length; j++) {
                                    content += "<td>" +
                                            response.blocked_lecturers[j][i].name +
                                            "</td>";
                                }
                                content += "</tr>";
                            }
                            content += '</tbody>' +
                                    '</table>';
//                            alert(content);
                            $("#timetable").html(content);
                        });


                    }
                    ); //end of saturday click


                    }
                    );
                    //Initialising the page content
                    $("#courselist").hide();
                    $("#freelistdisplay").hide();
                    $("#myscheduledisplay").show("slow");

                    $("#myschedule").click(function () { //when tab is clicked
                        $("#courselist").hide("slow");
                        $("#freelistdisplay").hide("slow");
                        $("#myscheduledisplay").show("slow");

                    });
                    $("#freelist").click(function () { //when tab is clicked
                        $("#courselist").hide("slow");
                        $("#myscheduledisplay").hide("slow");
                        $("#freelistdisplay").show("slow");

                    });

                    $("#courses").click(function () { //when tab is clicked
                        $("#myscheduledisplay").hide("slow");
                        $("#freelistdisplay").hide("slow");
                        $("#courselist").show("slow");

                    });


                });//end ready

            </script>

    </body>
</html>
