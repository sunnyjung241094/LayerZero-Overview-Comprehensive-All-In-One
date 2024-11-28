select (case when active_days_count >= 500 then '>=100 Days'
             when active_days_count >= 400 then '>=400 Days'
             when active_days_count >= 300 then '>=300 Days'
             when active_days_count >= 200 then '>=200 Days'
             when active_days_count >= 100 then '>=100 Days'
             when active_days_count >= 50 then '>=50 Days'
             when active_days_count >= 25 then '>=25 Days'
             when active_days_count >= 10 then '>=10 Days'
             when active_days_count >= 5 then '>=5 Days'
            else '<5 Days'
        end) as segment_type,
        count(*) as user_count
from query_2506535 -- query_2465489
group by 1
