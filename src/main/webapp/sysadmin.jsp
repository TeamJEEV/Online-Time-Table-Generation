<%@page import="Model.DepartmentDAO"%>
<%@page import="Model.FacultyDAO"%>
<%@page import="Utilities.DataManager"%>
<%@page import="Model.LecturerDAO"%>
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
<% 
//     class declarations
                            DataManager dataManager = new DataManager();
        dataManager.setDbUrl("jdbc:mysql://localhost:3306/timetable");
        dataManager.setUserName("root");
        dataManager.setPassword("root");
        
        LecturerDAO teach= new LecturerDAO();
        Integer count_teach;
        count_teach = teach.countLecturer(dataManager);
        FacultyDAO fac = new FacultyDAO();
        Integer count_fac=fac.countFaculty(dataManager);
        DepartmentDAO dep= new DepartmentDAO();
        Integer count_dep=dep.countDepartment(dataManager);
        
                                        
                                        %>
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
                        <form method="POST" class="navbar-form navbar-right">
                            <div class="form-group">
                                <input type="hidden" name="username"  class="form-control">
                            </div>

                            <button type="submit" name="submit" value="logout"  class="btn btn-success">LogOut</button>
                        </form>
                    </div><!--/.navbar-collapse -->
                </div>
            </nav>
        </header>

        <div class="pagecontent">
            <div class="pagecontent_left">        


                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <i class="glyphicon glyphicon-user" style="color: #FFF"></i><span> Admin </span>
                    </li>

                    <li>

                        <a href="#" data-toggle="modal" data-target="#addfacultyModal">Create Faculty 
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" >Create department
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" data-toggle="modal" data-target="#addlecturerModal">Add Lecturer
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>

                    <li >
                        <a href="#" data-toggle="modal" data-target="#addlecturehallModal">Add Lecture Hall
                            <i class="glyphicon glyphicon-menu-right glyphicon-align-right"></i></a>
                    </li>



                </ul>

            </div>
            
            <!--            <div class="pagecontent_right">
                            <div class="alert alert-warning alert-dismissable">
                                <button type="button" class="close" data-dismiss="alert" 
                                        aria-hidden="true">
                                    &times;
                                </button>
            ${param.name}
        </div>-->
            <div class="pagecontent_right">
            <div class="container-fluid">
                <div class="alert-info">
                    <div class="col-md-12">
<<<<<<< HEAD
                        <!--Dashbord.................................................--> 
                        <h1>Dashboard</h1>
                       <div class="row">
                           <!--faculty panel..........................--> 
=======
                        <!--Dashbord--> 
                        <h1>Dashboard</h1>
                       <div class="row">
>>>>>>> FETCH_HEAD
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
<<<<<<< HEAD
                                        <div class="huge"><%out.print(count_fac); %></div>
                                        <div>Number of Faculties!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#" id="task_fac">
=======
                                        <div class="huge">26</div>
                                        <div>New Faculty!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
>>>>>>> FETCH_HEAD
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
<<<<<<< HEAD
                                        
                                        <!--department panel..........................................--> 
=======
>>>>>>> FETCH_HEAD
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
<<<<<<< HEAD
                                        <div class="huge"><%out.print(count_dep); %></div>
                                        <div>Number of Department!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#" id="task_dep">
=======
                                        <div class="huge">12</div>
                                        <div>New Department!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
>>>>>>> FETCH_HEAD
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

                                        <div class="huge">124</div>
                                        <div>New teachers! </div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">

                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>

 <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-support fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">13</div>

                                        <div>New ****!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">

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
                </div>
            </div>
<!--Task panel--.................................................-->

<div id="task"  style="margin-left:2.5%;width:21%" >
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Tasks Panel</h3>
                            </div>
                            <div class="panel-body">
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        <span class="badge">just now</span>
                                        <i class="fa fa-fw fa-calendar"></i> Calendar updated
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">4 minutes ago</span>
                                        <i class="fa fa-fw fa-comment"></i> Commented on a post
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">23 minutes ago</span>
                                        <i class="fa fa-fw fa-truck"></i> Order 392 shipped
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">46 minutes ago</span>
                                        <i class="fa fa-fw fa-money"></i> Invoice 653 has been paid
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">1 hour ago</span>
                                        <i class="fa fa-fw fa-user"></i> A new user has been added
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">2 hours ago</span>
                                        <i class="fa fa-fw fa-check"></i> Completed task: "pick up dry cleaning"
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">yesterday</span>
                                        <i class="fa fa-fw fa-globe"></i> Saved the world
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">two days ago</span>
                                        <i class="fa fa-fw fa-check"></i> Completed task: "fix error on sales page"
                                    </a>
                                </div>
                                <div class="text-right">
                                    <a href="#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
<!--task Panel........-->
            <div class="push"></div>
            <footer class="footer">
                <p>&COPY;Team5 2015</p>
            </footer>
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
                    <form action="TimeTableServlet" method="POST">
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
                                <span class="input-group-addon" id="password-addon">password</span>
                                <input name="password" type="password" class="form-control" required="required" placeholder="Password" aria-describedby="password-addon">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button class="btn btn-success" type="submit" name="submit" value="addLect">Save</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>

        <!-- Add lecture Hall modal -->
        <div id="addlecturehallModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add Lecture Hall</h4>
                    </div>
                    <form method="POST">
                        <div class="modal-body">
                            <div class="input-group form-group">
                                <span class="input-group-addon" id="full-name-addon">Name</span>
                                <input type="text" name="hall" class="form-control" required="required" placeholder="hall name" aria-describedby="full-name-addon">

                            </div>
                            <div class="input-group form-group">
                                <span class="input-group-addon" id="username-addon">Capacity</span>
                                <input type="text" name="capacity" class="form-control" required="required" placeholder="capacity" aria-describedby="username-addon">

                            </div >


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="submit" name="submit" value="addhall" class="btn btn-success" >Save</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    <!-- Add Faculty modal -->
    <div id="addfacultyModal" class="modal fade" role="dialog" data-backdrop="static">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Faculty</h4>
                </div>
                
                <!--Create Faculty form-->
                <form action="TimeTableServlet" method="POST" id="addfaculty">
                    <div class="modal-body">
                        <div class="input-group form-group">
                            <span class="input-group-addon" id="name-addon">Name</span>
                            <input name="name" type="text" class="form-control" required="required" 
                                   placeholder="Name" aria-describedby="name-addon">

                        </div>
                        
                        
                         <div class="input-group form-group">
                                                        
                                <span class="input-group-addon" id="username-addon">Dean</span>
                                <select class="form-control" name="dean" placeholder="Dean" required="required" id="dean" onChange="setDeanEmail(this.options.selectedIndex)" >
                                   
                                </select>
                               
                            </div>
             
                        
                        <div class="input-group form-group">
                            <span class="input-group-addon" id="email-addon">Email</span>
                            <input name="deanemail" type="email" class="form-control" required="required" 
                                   readonly="true" placeholder="Email" aria-describedby="email-addon" id="deanemail">
                        </div>
                        
                        <div class="input-group form-group">
                            <span class="input-group-addon" id="department-addon">Department</span>
                   
                                    <button  data-toggle="modal" data-target="#adddepartmentModal" class="btn btn-primary form-control" type="button">
                                        <span class="glyphicon glyphicon-plus"></span>
                                         <span >Add Department</span>
                                    </button>
                               
                            </div>
                    </div>
                    
                    <div class="modal-footer">
                        
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button class="btn btn-success" type="submit" name="submit" value="addFac">Save</button>
                    </div>
                </form>
            </div>
<!--end of create Faculty form-->
        </div>
    </div>

    
    <!-- Add Department modal -->
    <div id="adddepartmentModal" class="modal fade" role="dialog" style="margin-top: 4%" data-backdrop="static">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Department</h4>
                </div>
                <form action="TimeTableServlet" method="POST">
                    <div class="modal-body">
                        <div class="input-group form-group">
                            <span class="input-group-addon" id="dept-name-addon">Name</span>
                            <input name="deptname" type="text" class="form-control" required="required" 
                                   placeholder="Department Name" aria-describedby="dept-name-addon">

                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon" id="hod-addon">HOD</span>
                           
                            <select class="form-control" name="hod" id="hod" placeholder="Head of Department" required="required"
                                    onChange="setHodEmail(this.options.selectedIndex)" >
                                    
                                </select>
                        </div>
                        <div class="input-group form-group">
                            <span class="input-group-addon" id="email-addon">Email</span>
                            <input name="hodemail" type="text" class="form-control" required="required" 
                                   readonly="true" placeholder="Email" aria-describedby="email-addon" id="hodemail">
                        </div>
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

    
    
    <script type="text/javascript">
        var lecturerList = {lec:[{id:1, name:"Proff Tanyi", email:"tanhyi@ubuea.cm"},{id:2, name:"Dr Nguti", email:"ngutii@ubuea.cm"},
                        {id:3,name:"Dr Akana", email:"akana@ubuea.cm"}, {id:4,name:"Dr Tsafack" , email:"tsafack@ubuea.cm"}]};
                
        $(document).ready(function (){   
                
           
                var deanList = document.getElementById("dean");
                var hodList = document.getElementById("hod");
                
                for (var m = deanList.options.length - 1; m >= 0; m--)
                    deanList.options[m] = null;
                
                for (var m = hodList.options.length - 1; m >= 0; m--)
                    hodList.options[m] = null;
            
                deanList.options[0] = new Option("Select dean", "", true);
                deanList.options[0].disabled = true;
                hodList.options[0] = new Option("Select HOD", "", true);
                 hodList.options[0].disabled = true;
               
               //Initialise the list of Deans
                for(var i=0; i<lecturerList.lec.length; i++){
                   deanList.options[i+1] = new Option(lecturerList.lec[i].name, lecturerList.lec[i].id);
                   
                   
               } 
               
               //Initailise list of HODs
                for(var i=0; i<lecturerList.lec.length; i++){
                   hodList.options[i+1] = new Option(lecturerList.lec[i].name, lecturerList.lec[i].id);
                   
               }
               
                
            //This method respond to the submit event of the add department modal
        $( "#adddepartmentModal" ).submit(function( event ) {
            alert( "Handler for .submit() called." );
            
             $(this).modal('toggle');
             event.preventDefault();
        });
        
        //This method respond to the submit event of the add faculty method
      $( "#addfacultyModal" ).submit(function( event ) {
            alert( "Handler for .submit() called." );
            
            $(this).modal('toggle');
            event.preventDefault();
        });
        
         
        });
        //This function set the Selected Dean Email
        function setDeanEmail(SelectedIndex){          
            $("#deanemail").val(lecturerList.lec[SelectedIndex-1].email);
        }
       
        //This fucntion set the selected HOD Email
        function setHodEmail(SelectedIndex){
            $("#hodemail").val(lecturerList.lec[SelectedIndex-1].email);
        }
        
        
//        Display task panel
    
    $(document).ready(
    function(){
    $("#task").hide();
    
    $("#task_fac").click(function (){
//    alert("FFFFF");"

$.ajax({ //only showed when result is displayed
    url:"TimeTableServlet",
    async:false,
    data:{"id":"task_fac"}
}).done(function (results){
    alert(results);
    
});
     $("#task").css({
            "margin-left":"3%"
            
        });
        $("#task").show("slow");
        
    });

    
    
    $("#task").hide("slow");
    
    $("#task_dep").click(function (){
//    alert("FFFFF");"


 $("#task").css({
            "margin-left":"27%"
            
        });
        $("#task").show("slow");
       
    });

    
     
     $("#task").hide("slow");
    $("#task_teach").click(function (){
//    alert("FFFFF");"
      $("#task").css({
            "margin-left":"52%"
            
        });
        $("#task").show("slow");
        
    });

     $("#task").hide("slow");
 $("#task_class").click(function (){
//    alert("FFFFF");"
      $("#task").css({
            "margin-left":"77%"
            
        });
        $("#task").show("slow");
        
    });
    });
</script>

</body>
</html>
