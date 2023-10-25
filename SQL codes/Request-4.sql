4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference

with unique_product_21 as (
SELECT 
	segment,
    count(distinct dp.product_code) as unique_product_2021
FROM dim_product dp
join fact_gross_price p 
on dp.product_code = p.product_code
where fiscal_year = 2021
group by segment
),
unique_product_20 as (
SELECT 
	segment,
    count(distinct dp.product_code) as unique_product_2020
FROM dim_product dp
join fact_gross_price p 
on dp.product_code = p.product_code
where fiscal_year = 2020
group by segment
)
select 
	up_20.*,
    up_21.unique_product_2021,
    (unique_product_2021 - unique_product_2020) as difference
from unique_product_21 up_21
join unique_product_20 up_20
on up_20.segment = up_21.segment
order by difference desc