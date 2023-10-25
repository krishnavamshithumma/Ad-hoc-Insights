5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost

SELECT 
	m.product_code,
    p.product,
    m.cost_year,	
    sum(m.manufacturing_cost) as manufacturing_cost
FROM fact_manufacturing_cost m
join dim_product p
on m.product_code = p.product_code
where manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost) or
manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost)
group by m.product_code
order by manufacturing_cost desc
