select active_weeks_count,
    cast(active_weeks_count as varchar) || ' Weeks' as segment_type,
    count(*) as user_count
from query_2506535 -- query_2465489
group by 1, 2
order by 1 desc
