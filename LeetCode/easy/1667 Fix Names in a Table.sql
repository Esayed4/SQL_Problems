select 
    user_id ,
    UPPER(substr(name,1,1))||''||LOWER(substr(name,2)) AS NAME
from 
    Users 
order by user_id 