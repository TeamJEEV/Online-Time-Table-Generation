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
                     <form action="TimeTableServlet" class="navbar-form navbar-right" method="POST">
                     <div class="form-group">
                       <input type="text" name="username" placeholder="Username" class="form-control">
                     </div>
                     <div class="form-group">
                       <input type="password" name="password" placeholder="Password" class="form-control">
                     </div>
                         <button type="submit" name="submit" class="btn btn-success" value="login">Login</button>
                   </form>
                 </div><!--/.navbar-collapse -->
               </div>
       </nav>
    </header>        
        
        
        <div class="pagecontent">
            <div class="pagecontent_left">
                <div class="panel-group" id="accordion">
                    
                
                <ul class="sidebar-nav">
                     <li class="sidebar-brand">
                         <span >Faculties </span>
                    </li>
                
                <li class="panel panel-default">
                    
                    <a href="#FET" data-toggle="collapse" data-parent="#accordion">
                        Engineering <i class="glyphicon glyphicon-menu-down glyphicon-align-right"></i></a>
                         <ul id="FET" class="panel-collapse collapse inner-list">
                             <li>
                                 <a href="#">Computer</a>
                             </li>
                             <li>
                                 <a href="#">Electrical</a>
                             </li>
                            </ul>
                </li>
                
                <li class="panel panel-default">
                    <a href="#SC" data-toggle="collapse" data-parent="#accordion">Science
                    <i class="glyphicon glyphicon-menu-down glyphicon-align-right"></i></a>
                     <ul id="SC" class="panel-collapse collapse inner-list">
                             <li>
                                 <a href="#">Chemistry</a>
                             </li>
                             <li>
                                 <a href="#">Geography</a>
                             </li>
                    </ul>
                
                </li>
                
                <li class="panel panel-default">
                    <a href="#ART" data-toggle="collapse" data-parent="#accordion">Art
                    <i class="glyphicon glyphicon-menu-down glyphicon-align-right"></i></a>
                     <ul id="ART" class="panel-collapse collapse inner-list">
                             <li>
                                 <a href="#">History</a>
                             </li>
                             <li>
                                 <a href="#">Literature</a>
                             </li>
                     </ul>
                </li>
                
                <li class="panel panel-default">
                    <a href="#CT" data-toggle="collapse" data-parent="#accordion">College of Technology
                    <i class="glyphicon glyphicon-menu-down glyphicon-align-right"></i></a>
                     <ul id="CT" class="panel-collapse collapse inner-list">
                             <li>
                                 <a href="#">Computer</a>
                             </li>
                             <li>
                                 <a href="#">Electrical</a>
                             </li>
                    </ul>
                </li>
                
                <li class="panel panel-default">
                    <a href="#SMS" data-toggle="collapse" data-parent="#accordion">SMS
                    <i class="glyphicon glyphicon-menu-down glyphicon-align-right"></i></a>
                     <ul id="SMS" class="panel-collapse collapse inner-list">
                             <li>
                                 <a href="#">Accounting</a>
                             </li>
                             <li>
                                 <a href="#">Economics</a>
                             </li>
                    </ul>
                </li>
                
                <li class="panel panel-default">
                    <a href="#ASTI" data-toggle="collapse" data-parent="#accordion">ASTI
                      <i class="glyphicon glyphicon-menu-down glyphicon-align-right"></i></a>
                     <ul id="ASTI" class="panel-collapse collapse inner-list">
                             <li>
                                 <a href="#">French</a>
                             </li>
                             <li>
                                 <a href="#">English</a>
                             </li>
                    </ul>
                </li>
                
                <li class="panel panel-default">
                    <a href="#AGR" data-toggle="collapse" data-parent="#accordion">Agriculture
                    <i class="glyphicon glyphicon-menu-down glyphicon-align-right"></i></a>
                     <ul id="AGR" class="panel-collapse collapse inner-list">
                             <li>
                                 <a href="#">Animals</a>
                             </li>
                             <li>
                                 <a href="#">Crop production</a>
                             </li>
                    </ul>
                </li>
                
                </ul>
                </div>
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
            
            
           
        </div>
        
        
        
        
        
        
        
        
        <!-- Jquery CDN which will be incoporated when hosting the app-->
      <!--  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
      
      <!-- Bootstrap CDN which will be incoporated when hosting the app
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>-->
      <script>
         // This script will be executed when the page loads
         
         $(document).ready(function (){
             loadFaculties();
         });
         
         //This function is used to load the faculties and departement
         function loadFaculties(){
            var request =  $.ajax({
                    //url: "index.jsp",
                    method: "POST"
                });
                request.done(function( msg ) {
                    var response = 
                            {faculties : [
                                {name:"FET", 
                                 departement:[{name:"Computer", id:1},
                                     {name:"Electrical", id:2}]
                                },
                                {name:"ART",
                                departement:[{name:"History", id:3},
                                               {name:"Performing Art", id:4}]
                                }
                            ]};
                        
                        //response = eval ("(" + response + ")");
                    
                    
                    var contents = '<ul class="sidebar-nav">' +
                                    '<li class="sidebar-brand">' +
                                        '<span >Faculties </span>' +
                                    '</li>';
                    
                    for(var i=0; i< response.faculties.length; i++){
                        contents += '<li class="panel panel-default">' +
                    
                                '<a href="#FET" data-toggle="collapse" data-parent="#accordion">'+
                                     response.faculties[i].name + ' <i class="glyphicon glyphicon-menu-down glyphicon-align-right"></i></a>'+
                                    '<ul id="' + response.faculties[i].name + '" class="panel-collapse collapse inner-list">';
                            
                            for (var j=0; j<response.faculties[i].departement.length; j++){
                                contents += '<li>'+
                                                '<a href="#">'+ response.faculties[i].departement[j].name + '</a>'+
                                            '</li>';
                            }
                                        
                                contents +=    '</ul>'+
                                            '</li>';
                        
                    }
                    
                    contents += '</ul>';
                    
                     //alert(contents);
                    $("#accordion").html(contents);
                    
                        alert("OK toure");
                });
                
                request.fail(function( jqXHR, textStatus ) {
                    alert("failed");
                    //alert( "Request failed: " + textStatus );
                    });
                 
         }
      </script>
    </body>
</html>
