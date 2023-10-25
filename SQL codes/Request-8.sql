8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity

SELECT 
	concat('Q',quarter(date(date_add(date, interval 4 month)))) as quarter,
	concat(round(sum(sold_quantity)/1000000,2),'M') as total_quantity
FROM fact_sales_monthly
where fiscal_year = 2020
group by quarter;