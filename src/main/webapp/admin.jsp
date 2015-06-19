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
                        <a href="#" >My Schedule
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" >Add Class
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" >Courses
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" data-toggle="modal" data-target="#addlecturerModal">Visiting Lecturer 
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" >Free List
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
                    <div class="row">
                        <div class="col-md-12">
                             <h1></h1>
                             <div class="panel panel-default" style="width: 85%">
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
                                        <td>CEF 502<br> Ublock A</td>
                                        <td></td>
                                        <td></td>
                                        <td>CEF 506<br> ClBLK II 50D</td>
                                        <td>CEF XXX</td>
                                        <td>CEF XXX</td>

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
                                        <td>CEF 502<br> Ublock A</td>
                                        <td></td>
                                        <td></td>
                                        <td>CEF 506<br> ClBLK II 50D</td>
                                        <td>CEF XXX</td>
                                        <td>CEF XXX</td>

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
                            
                           
                        </div>
                    </div>
                </div>
                <div class="push"></div>
                <footer class="footer">
                    <p>&COPY;Team5 2015</p>
                </footer>
            </div>
        </div>

        <!-- Modal 
        <!-- Add lecturer modal -->
        <div id="addlecturerModal" class="modal fade" role="dialog">
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
        </div>








        <!-- Jquery CDN which will be incoporated when hosting the app-->
        <!--  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
          <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->

        <!-- Bootstrap CDN which will be incoporated when hosting the app
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>-->
        <script>
            
            $(document).ready(function (){
                var role = "${sessionScope.role}";
               
                if(role === "HOD"){
                    $("#assignHodTask").hide();
                    
                }
                
                $("#accountsetting").click(function (){
                    var docForm = document.getElementById("newLecForm");
                    docForm.fullname.value="${sessionScope.name}";
                    docForm.username.value="${sessionScope.user}";
                    docForm.email.value="${sessionScope.email}";
                    docForm.password.value="";
                    docForm.id.value=${sessionScope.id};                    
                    
                   
                });
            });

        </script>
    </body>
</html>
