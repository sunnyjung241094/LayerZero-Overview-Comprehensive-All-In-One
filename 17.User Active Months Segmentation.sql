select cast(active_months_count as varchar) || ' Months' as segment_type,
        count(*) as user_count
from query_2506535 -- query_2465489
group by 1
