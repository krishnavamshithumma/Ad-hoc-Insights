6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage

SELECT 
	c.customer,
    c.customer_code,
    round(avg(d.pre_invoice_discount_pct)*100 ,4) as avg_discount_pct
FROM fact_pre_invoice_deductions d
join dim_customer c
on d.customer_code = c.customer_code
where fiscal_year = 2021 and c.market = "india"
group by c.customer_code
order by avg_discount_pct desc limit 5