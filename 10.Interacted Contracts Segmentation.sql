select (case when active_transaction_contract_count >= 100 then '>=100 Contracts'
             when active_transaction_contract_count >= 50 then '>=50 Contracts'
             when active_transaction_contract_count >= 25 then '>=25 Contracts'
             when active_transaction_contract_count >= 10 then '>=10 Contracts'
             when active_transaction_contract_count >= 5 then '>=5 Contracts'
             when active_transaction_contract_count >= 2 then '>=2 Contracts'
            else '1 Contract'
        end) as segment_type,
        count(*) as user_count
from query_2506535 -- query_2465489
group by 1
