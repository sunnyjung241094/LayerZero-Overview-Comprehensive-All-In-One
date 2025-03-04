with daily_summary as (
    select date_trunc('day', block_time) as block_date,
        count(*) as transaction_count,
        count(distinct user_address) as active_user_count
    from layerzero.send t
    where block_time >= date('2023-03-01')
        and block_time < current_date
    group by 1
    order by 1
),

daily_summary_lead as (
    select block_date,
        transaction_count,
        active_user_count,
        lag(transaction_count) over (order by block_date) as previous_transaction_count,
        lag(active_user_count) over (order by block_date) as previous_active_user_count
    from daily_summary
    order by block_date
)

select block_date,
    transaction_count,
    active_user_count,
    previous_transaction_count,
    previous_active_user_count,
    cast(transaction_count - coalesce(previous_transaction_count, 0) as double) / previous_transaction_count as transaction_count_change_rage,
    cast(active_user_count - coalesce(previous_active_user_count, 0) as double) / previous_active_user_count as user_countchange_rage
from daily_summary_lead
order by block_date
