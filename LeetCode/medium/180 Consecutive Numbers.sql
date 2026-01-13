/* Write your PL/SQL query statement below */
     select distinct num as ConsecutiveNums 
    from Logs l
    where id-1 in (select id from logs where num=l.num) and 
          id-2 in (select id from logs where num=l.num)

 