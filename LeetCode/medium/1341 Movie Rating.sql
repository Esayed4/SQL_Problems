-- MS sql server sql
with topNameCount as (

        select 
            top 1
                name,count(*)   as numberOfMovies
        from MovieRating m inner join  Users u  on  m.user_id=u.user_id
        group by name
        order by numberOfMovies desc , name asc
)

,



 topMovie  as (

        select top 1
                 title, avg(1.0*rating)   as avgRating
        from MovieRating m inner join  Movies  u  on  m.movie_id    =u.movie_id  
        where   month(m.created_at) = 2
                and year(m.created_at) = 2020
        group by title
        order by avgRating desc , title   asc
)

select name as  results    from topNameCount
union all
select title from topMovie