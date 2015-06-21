<!DOCTYPE html>
<!--
This is the a simple lecturer view of the app after login
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
                        <form action="TimeTableServlet" method="POST" class="navbar-form navbar-right">
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

                        <a href="#" data-toggle="modal" data-target="#myModal" id="accountsetting">
                            Account Setting <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" >My Schedule
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>



                </ul>

            </div>
            <div class="pagecontent_right">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <h1>Page content</h1>
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

            <!-- modal content -->
            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Account Settings</h4>
                        </div>
                        <form action="TimeTableServlet" method="POST" id="newLecForm">
                            <div class="modal-body">
                                <div class="input-group form-group">
                                    <span class="input-group-addon" id="full-name-addon">Full Name</span>
                                    <input name="fullname" type="text" class="form-control" required="required" placeholder="Fullname" aria-describedby="full-name-addon">

                                </div>
                                <div class="input-group form-group">
                                    <span class="input-group-addon" id="username-addon">Username</span>
                                    <input name="username" type="text" class="form-control" required="required" placeholder="Username" aria-describedby="username-addon">

                                </div >

                                <div class="input-group form-group">
                                    <span class="input-group-addon" id="username-addon">Email   </span>
                                    <input name="email" type="email" class="form-control" required="required" placeholder="Email" aria-describedby="emailname-addon">

                                </div>

                                <div class="input-group form-group">
                                    <span class="input-group-addon" id="password-addon">password</span>
                                    <input name="password" type="password" class="form-control" required="required" placeholder="Password" aria-describedby="password-addon">

                                </div>

                                 <input name="id" type="hidden">
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                <button class="btn btn-success" type="submit" name="submit" value="lectSetting">Save</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>

        </div>








        <!-- Jquery CDN which will be incoporated when hosting the app-->
        <!--  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->

        <!-- Bootstrap CDN which will be incoporated when hosting the app
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>-->
        <script>

            $(document).ready(function () {
                $("#accountsetting").click(function () {
                    var docForm = document.getElementById("newLecForm");
                    docForm.fullname.value = "${sessionScope.name}";
                    docForm.username.value = "${sessionScope.user}";
                    docForm.email.value = "${sessionScope.email}";
                    docForm.password.value = "";
                    docForm.id.value =${sessionScope.id};


                });
            });
        </script>
    </body>
</html>
