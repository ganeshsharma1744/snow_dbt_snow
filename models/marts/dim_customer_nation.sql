with cte1 as 
(
select * from {{ ref('stg_customer') }}
),
cte2 as
(
select * from {{ ref('stg_nation') }}
),
final_cte as
(
select
n.N_NAME,c.C_MKTSEGMENT,
MAX(c.C_ACCTBAL),MIN(c.c_acctbal),COUNT(c.c_acctbal)
from cte1 C
join cte2 N
ON c.c_nationkey=n.n_nationkey
group by ALL
) 
select * from final_cte
    