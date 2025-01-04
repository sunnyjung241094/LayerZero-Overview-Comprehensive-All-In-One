with lz_send_summary as (
    select date_trunc('day', block_time) as block_date,
        count(*) as transaction_count
    from layerzero.send
    group by 1
    order by 1
)

select block_date,
    transaction_count,
    sum(transaction_count) over (order by block_date) as accumulate_transaction_count,
    avg(transaction_count) over (rows between 7 preceding and current row) as ma_7_day_transaction_count
from lz_send_summary
order by block_date
