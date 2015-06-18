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
                            <button type="submit" name="submit" value="loginPage"  class="btn btn-success">Login</button>

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

                            <h3 style="width: 85%; text-align: center">Faculty name : Department name</h3>
                            <!-- Time Table to be displayed -->
                            <table style="width: 85%; text-align: center"class="table table-bordered table-striped table-hover table-responsive table-condensed">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Mon</th>
                                        <th>Tues</th>
                                        <th>Wed</th>
                                        <th>Thurs</th>
                                        <th>Fri</th>
                                        <th>Sat</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>7AM</td>
                                        <td>CEF 502<br> Ublock A</td>
                                        <td></td>
                                        <td></td>
                                        <td>CEF 506<br> ClBLK II 50D</td>
                                        <td>CEF XXX</td>
                                        <td>CEF XXX</td>

                                    </tr>

                                    <tr>
                                        <td>9AM</td>
                                        <td>CEF 502<br> Ublock A</td>
                                        <td>CEF 510<br> Ublock C</td>
                                        <td></td>
                                        <td>CEF 506<br> ClBLK I 50A</td>
                                        <td></td>
                                        <td>CEF 504<br> Ublock D</td>

                                    </tr>
                                    <tr>
                                        <td>11AM</td>
                                        <td></td>
                                        <td></td>
                                        <td>CEF 514<br> ClBLK I 50A</td>
                                        <td></td>
                                        <td>CEF 506<br> Restau 2</td>
                                        <td></td>

                                    </tr>
                                </tbody>

                            </table>
                            <p>This part of the page will contain the structured time tables for the various departments </p>
                            <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>.</p>

                        </div>
                    </div>
                </div>
                <div class="push"></div>
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
                alert("calling load fac");
                var request = $.ajax({
                    url: "TimeTableServlet",
                    data: {"submit": "loadFaculties"},
                    method: "POST"
                });
                request.done(function (msg) {
                   //                   alert(msg);
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
                                            '<a href="#">' + response[i].departments[j].name + '</a>' +
                                        '</li>';
                        }

                        contents += '</ul>' +
                                '</li>';
                    }
                    contents += '</ul>';

                    
                    $("#accordion").html(contents);alert(contents);
                });

                request.fail(function (jqXHR, textStatus) {
                    alert("failed");
                    //alert( "Request failed: " + textStatus );
                });

            }
        </script>
    </body>
</html>
