/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    function loadLecturerschedule() {
        $.ajax({
            url: "TimeTableServlet",
            data: {"submit": "getIndividualSchedule"},
            method: "POST"
        }).done(function (msg) {

            var response = JSON.parse(msg);
            var content = '<div class="panel-heading">' +
                    '<h1 class="panel-title" style="text-align: center">My Schedule</h1>' +
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
            $("#myscheduledisplay").html(content);
        });
    }


