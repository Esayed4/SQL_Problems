with songs as (
  select user_id,song_id,song_plays
  from songs_history 
  UNION ALL
  
  select user_id,song_id,1
  from songs_weekly  
  where listen_time<'08/05/2022'
  
)

SELECT user_id,song_id,sum(song_plays) as song_plays
from songs
group by user_id,song_id
order by song_plays desc