<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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
        <script src="js/respond.min.js"></script><!-- Used to add support for IE 8 -->

        <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/departmentaltimetable.js" type="text/javascript"></script>

    </head>
    <body>


        <header class="page-header">
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"  aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <span class="navbar-brand">Time Table Systems</span>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <form action="TimeTableServlet" method="POST" class="navbar-form navbar-right">
                            <div class="form-group">
                                <input type="hidden" name="username"  class="form-control">
                            </div>
                            <a href="login.jsp" class="btn btn-success">Login</a>
                            <!--<button type="submit" name="submit" value="loginPage"  class="btn btn-success">Login</button>-->

                        </form>
                    </div><!--/.navbar-collapse -->
                </div>
            </nav>
        </header>        


        <div class="pagecontent">
            <div class="pagecontent_left">
                <div class="panel-group" id="accordion">

                    <!--
                                        <ul class="sidebar-nav">
                                            <li class="sidebar-brand">
                                                <span >Faculties  </span>
                                            </li>
                    <c:forEach var="faculty" items="${sessionScope.faculties}">
                        <li class="panel panel-default">
                            <a href="#FET" data-toggle="collapse" data-parent="#accordion">
                        ${faculty.getName()} <i class="glyphicon glyphicon-menu-down glyphicon-align-right"></i></a>
                </li>

                    </c:forEach> 

                </ul> -->
                </div>
            </div>

            <div class="pagecontent_right">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default" style="width: 85%" id="depart-table">

                            </div>
                        </div>
                    </div>
                </div>


                <footer class="footer">
                    <p>&COPY;Team5 2015</p>
                </footer>
            </div>



        </div>








        <!-- Jquery CDN which will be incoporated when hosting the app-->
        <!--  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
          <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->

        <!-- Bootstrap CDN which will be incoporated when hosting the app
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>-->
        <script>
            // This script will be executed when the page loads
            $(document).ready(function () {
                loadFaculties();
            });

            //This function is used to load the faculties and departement
            function loadFaculties() {

                var request = $.ajax({
                    url: "TimeTableServlet",
                    data: {"submit": "loadFaculties"},
                    method: "POST"
                });
                request.done(function (msg) {
                    var response = JSON.parse(msg);

                    var contents = '<ul class="sidebar-nav">' +
                            '<li class="sidebar-brand">' +
                            '<span >Faculties </span>' +
                            '</li>';

                    for (var i = 0; i < response.length; i++) {
                        contents += '<li class="panel panel-default">' +
                                '<a href="#' + response[i].name + '" data-toggle="collapse" data-parent="#accordion">' +
                                response[i].name + ' <i class="glyphicon glyphicon-menu-down glyphicon-align-right"></i></a>' +
                                '<ul id="' + response[i].name + '" class="panel-collapse collapse inner-list">';

                        for (var j = 0; j < response[i].departments.length; j++) {
                            contents += '<li>' +
                                    '<a href="#"  onclick="loadDepartmentSchedule(' + response[i].departments[j].id + ')">'
                                    + response[i].departments[j].name + '</a>' +
                                    '</li>';
                        }

                        contents += '</ul>' +
                                '</li>';
                    }
                    contents += '</ul>';


                    $("#accordion").html(contents);
                });

                request.fail(function (jqXHR, textStatus) {
                    alert("failed");
                    //alert( "Request failed: " + textStatus );
                });

            }

            function loadDepartmentSchedule(id) {
                $.ajax({
                    url: "TimeTableServlet",
                    data: {"submit": "getDepartmentSchedule", "id": id},
                    method: "POST"
                }).done(function (msg) {
                    var content = loadTimeTable(msg);
                    $("#depart-table").html(content);
                });
            }
            function loadTimeTable(msg) {
                var response = JSON.parse(msg);
                var content = '<div class="panel-heading">' +
                        '<h1 class="panel-title" style="text-align: center">'+ '</h1>' +
                        '</div>' +
                        '<div class="panel-body">' +
                        '<table style="text-align: center"class="table table-bordered table-striped' +
                        'table-hover table-responsive table-condensed">' +
                        '<thead>' +
                        '<tr>' +
                        '<th></th>' +
                        '<th>07:00</th>' +
                        '<th> 08:00</th>' +
                        '<th>9:00</th>' +
                        '<th>10:00</th>' +
                        '<th> 11:00 </th> <th> 12:00</th>' +
                        '<th> 13:00 </th> <th> 14:00</th>' +
                        '<th> 15:00 </th> <th> 16:00</th>' +
                        '<th> 17:00 </th> <th> 18:00</th>' +
                        '</tr>' +
                        '</thead>' +
                        '<tbody>';
                for (var i = 0; i < response.schedule.length; i++) {
                    switch (i) {
                        case 0:
                            content += '<tr>' +
                                    '<td> MON </td>';
                            break;
                        case 1:
                            content += '<tr>' +
                                    '<td> TUE </td>';
                            break;
                        case 2:
                            content += '<tr>' +
                                    '<td> WED </td>';
                            break;
                        case 3:
                            content += '<tr>' +
                                    '<td> THURS </td>';
                            break;
                        case 4:
                            content += '<tr>' +
                                    '<td> FRI </td>';
                            break;
                        case 5:
                            content += '<tr>' +
                                    '<td> SAT </td>';
                            break;
                    }
                    for (var j = 0; j < response.schedule[i].length; j++) {
                        content += '<td>' + response.schedule[i][j].course_id + '<br>' +
                                response.schedule[i][j].class + '</td>';
                    }
                    content += '</tr>';
                }
                content += '</tbody>' +
                        '</table>' +
                        '</div>';
                return content;
            }
        </script>
    </body>
</html>
