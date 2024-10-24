select (case when amount_usd >= 250000 then '>=$250,000'
             when amount_usd >= 50000 then '>=$50,000'
             when amount_usd >= 10000 then '>=$10,000'
             when amount_usd >= 1000 then '>=$1,000'
             when amount_usd >= 100 then '>=$100'
             when amount_usd >= 50 then '>=$50'
             when amount_usd > 0 then '<$100'
            else 'None'
        end) as segment_type,
        count(*) as user_count
from query_2506535 -- query_2465489
group by 1
