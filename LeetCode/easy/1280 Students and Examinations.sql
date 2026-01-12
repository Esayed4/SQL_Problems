/* Write your PL/SQL query statement below */


with students_subjects
as(
    select s.*,sub.*
    from Students s,Subjects sub )



select ss.STUDENT_ID ,ss.STUDENT_NAME ,ss.SUBJECT_NAME  
        ,
        sum(
        case
        when e.SUBJECT_NAME is null then 0
        else 1 
        end )as attended_exams  

from 
        students_subjects ss left join Examinations  e on
                        ss. STUDENT_ID=e. STUDENT_ID 
                        and 
                        ss.SUBJECT_NAME =e.SUBJECT_NAME 

group by ss.STUDENT_ID ,ss.STUDENT_NAME ,ss.SUBJECT_NAME
order by ss.STUDENT_ID  ,ss.SUBJECT_NAME