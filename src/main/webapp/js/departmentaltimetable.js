/* 
 * This file is used to display the departmental time table
 */

function loadDepartmentTimeTable(){
      $.ajax({
            url: "TimeTableServlet",
            data: {"submit": "getDepartmentSchedule"},
            method: "POST"
        }).done(function (msg) {
            alert(msg);
        });
}


