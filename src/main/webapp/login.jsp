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
    <body style="background-color: #495755;">

        <!--login modal-->
        <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h1 class="text-center">Login</h1>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="TimeTableServlet" class="form col-md-12 center-block">
                            <div class="form-group">
                                <input type="text"  name="username" class="form-control input-lg" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" class="form-control input-lg" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <button name="submit" value="login" class="btn btn-success btn-lg btn-block">Sign In</button>
                                <span class="pull-right"><a href="index.jsp">Home</a></span><span><a href="#">Need help?</a></span>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <div class="col-md-12">
                            <a href="index.jsp" class="btn btn-danger">Cancel</a>
                        </div>	
                    </div>
                </div>
            </div>
        </div>
        <!-- script references -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </body>
</html>
