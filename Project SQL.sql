create database sql_project;
use sql_project;
create table Retail_sales(
	transactions_id	int,
    sale_date date,	
    sale_time time,	
    customer_id	int,
    gender varchar(20),	
    age int,	
    category varchar(20), 	
    quantiy	int,
    price_per_unit float,	
    cogs float,	
    total_sale float);
select * from  Retail_sales
limit 10;
select count(*) from Retail_sales;
select * from Retail_sales
where 
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy	is null
or
price_per_unit is null	
or
cogs is null	
or 
total_sale is null;
select count(*) as total_sale from Retail_sales;
select count(distinct customer_id) from Retail_sales;

select * from Retail_sales
where sale_date='2022-11-05';


select * from Retail_sales
where
category='Clothing'
and
quantiy>=3
and
date_format(sale_date,'%y-%m')='2022-11';

select category,sum(total_sale)
from Retail_sales
group by 1;

select avg(age) from Retail_sales
where category='beauty';

select * from Retail_sales
where total_sale>1000;

select category,gender, count(*) from Retail_sales
group by category,gender
order by 1;

select * from
(select
Year(sale_date),
month(sale_date),
avg(total_sale),
rank() over(partition by year(sale_date) order by avg(total_sale) desc)
from Retail_sales
group by 1,2) as t1;

select customer_id, sum(total_sale) from Retail_sales
group by 1
order by 2 asc;

select category, count(distinct customer_id) from Retail_sales
group by 1;

with hourly_sale as(
select *,
case 
	when hour(sale_time)<12 then 'morning'
    when hour(sale_time) between 12 and 17 then 'afternoon'
    else 'evening'
end as shift
from Retail_sales)
select shift, count(*)
from hourly_sale
group by shift;






  





