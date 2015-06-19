select lecturer.name, lecturer_has_courses.date from `lecturer` LEFT JOIN `lecturer_has_courses` on lecturer_has_courses.date



select DISTINCT lecturer.name from `lecturer` LEFT JOIN `lecturer_has_courses` on lecturer_has_courses.date  where DAYWEEK(lecturer_has_courses.date)=4;

--Get block list
select name from lecturer join lecturer_has_courses on lecturer.id=lecturer_has_courses.lecturer_id   where (DAYOFWEEK(lecturer_has_courses.date)=5 AND HOUR(lecturer_has_courses.date)=23) ;
