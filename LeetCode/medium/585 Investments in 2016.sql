/* Write your PL/SQL query statement below */
with 
unique_lat_lon as(
 select lat , lon 
 from Insurance 
 group by lat , lon 
 having count(*)=1

)
, 
get_TIV_2016 as(
    select distinct i1.TIV_2016 ,i1.Lat ,i1.LON
    from Insurance i1 inner join Insurance i2 on i1.tiv_2015=i2.tiv_2015
    where i1.TIV_2015 =i2.TIV_2015  and not (i1.LON =i2.LON and  i1.LAT  =i2.LAT )
)

select round(sum(TIV_2016),2) as tiv_2016 
from get_TIV_2016
where Lat||' '|| Lon in (select Lat||' '||  Lon from unique_lat_lon)
 