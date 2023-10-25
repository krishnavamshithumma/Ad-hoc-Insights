2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg


with unique_product_20 as (
SELECT count(distinct product_code) as unique_product_2020
from fact_gross_price
where fiscal_year = 2020
),
unique_product_21 as (
SELECT count(distinct product_code) as unique_product_2021
from fact_gross_price
where fiscal_year = 2021
)
select 
	*,
    round((unique_product_2021-unique_product_2020)/(unique_product_2020)*100,2) as percentage_change
from unique_product_21, unique_product_20
