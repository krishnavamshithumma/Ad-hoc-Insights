10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order



with p_rank as (
SELECT 
	p.division,
    s.product_code,
    p.product,
    p.variant,
    sum(s.sold_quantity) as total_qty,
    rank() over(partition by p.division order by sum(s.sold_quantity) desc) as rank_order
FROM fact_sales_monthly s
join dim_product p
on p.product_code = s.product_code
where fiscal_year = 2021
group by p.product_code
order by rank_order 
)

select 
	*
from p_rank
where rank_order <= 3
order by division