-- with chain_list(chain_name, chain_id, endpoint_address) as (
--     values
--     ('Ethereum', 101,0x66A71Dcef29A0fFBDBE3c6a460a3B5BC225Cd675),
--     ('BNB Chain', 102,0x3c2269811836af69497E5F486A85D7316753cf62),
--     ('Avalanche', 106,0x3c2269811836af69497E5F486A85D7316753cf62),
--     ('Polygon', 109,0x3c2269811836af69497E5F486A85D7316753cf62),
--     ('Arbitrum', 110,0x3c2269811836af69497E5F486A85D7316753cf62),
--     ('Optimism', 111,0x3c2269811836af69497E5F486A85D7316753cf62),
--     ('Fantom', 112,0xb6319cC6c8c27A8F5dAF0dD3DF91EA35C4720dd7),
--     ('Gnosis', 145,0x9740FF91F1985D8d2B71494aE1A2f723bb3Ed9E4)
-- )

select date_trunc('day', t.block_time) as block_date,
    blockchain as chain_name,
    count(*) as transaction_count,
    count(distinct user_address) as active_user_count
from layerzero.send t
-- inner join chain_list c on t.source_chain_id = c.chain_id
group by 1, 2
order by 1, 2
