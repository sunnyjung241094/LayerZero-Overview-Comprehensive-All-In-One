select (case when transaction_count >= 100 then '>=100 TX'
             when transaction_count >= 50 then '>=50 TX'
             when transaction_count >= 25 then '>=25 TX'
             when transaction_count >= 10 then '>=10 TX'
             when transaction_count >= 5 then '>=5 TX'
            else '<5 TX'
        end) as segment_type,
        count(*) as user_count
from query_2506535 -- query_2465489
group by 1
