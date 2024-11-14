select (case when lz_age_days >= 500 then '>=100 Days'
             when lz_age_days >= 400 then '>=400 Days'
             when lz_age_days >= 300 then '>=300 Days'
             when lz_age_days >= 200 then '>=200 Days'
             when lz_age_days >= 100 then '>=100 Days'
             when lz_age_days >= 50 then '>=50 Days'
            else '<50 Days'
        end) as segment_type,
        count(*) as user_count
from query_2506535 -- query_2465489
group by 1
