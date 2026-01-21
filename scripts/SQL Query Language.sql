select * from customer limit 100

-- Q1. What is the toal revenue generate by male vs femal customer?
select 
	gender,
	sum(purchase_amount) as total_revenue
from customer
group by gender

-- Q2 Which customers used a discount but still more than avage purchase amount?
select
	customer_id,
	purchase_amount
from customer
where discount_applied = 'Yes' 
	and purchase_amount >= (
		select avg(purchase_amount) 
		from customer
	)
order by purchase_amount

-- =================================================
-- Using Subquery
select
	customer_id,
	discount_applied,
	purchase_amount,
	(select avg (purchase_amount) from customer) 
from customer
where discount_applied = 'Yes' and purchase_amount >= (select avg (purchase_amount) from customer)
order by purchase_amount asc

-- =================================================
-- Using CTE
with avg_purchase as (
	select avg(purchase_amount) as avg_amount
	from customer
)

-- Main Query
select
	c.customer_id,
	c.discount_applied,
	c.purchase_amount
from customer c
join avg_purchase a
	on c.purchase_amount >= a.avg_amount
where c.discount_applied = 'Yes'
order by c.purchase_amount asc

-- ================================================
-- Using window function
select
	customer_id,
	purchase_amount
from (
	select
		customer_id,
		purchase_amount,
		discount_applied,
		avg(purchase_amount) over () as av_amount
	from customer
)t
where discount_applied= 'Yes'
	and purchase_amount >= av_amount
order by purchase_amount;

-- Q3. Which are the top 5 product with the highest average reivew rating
select
	item_purchased,
	ROUND(AVG(review_rating::numeric),2) as agv_product_rating
from customer
group by item_purchased
order by agv_product_rating desc
limit 5

-- Using CTE
with product_avg_rating as (
	select
		item_purchased,
		avg(review_rating) as avg_review_rating
	from customer
	group by item_purchased
)
select 
	item_purchased,
	round(avg_review_rating::numeric, 2) as avg_review_rating
from product_avg_rating
order by avg_review_rating desc
limit 5


-- Q4. Compare the average Purchase Amount between Standart and Express Shipping
select 
	shipping_type,
	round(avg(purchase_amount), 2) avg_purchase
from customer
where shipping_type in ('Standard', 'Express')
group by shipping_type

-- Q5. Subscribed customer spend more? compare average spend and total revenue
-- between subcriber and none-subscribers.

select 
	subscription_status,
	count(*) as total_customer,
	round(avg(purchase_amount), 2)as avg_spend,
	round(sum(purchase_amount), 2) as total_revenue
from customer
group by subscription_status
order by total_revenue, avg_spend desc

-- Q6. Which 5 products have the hightest percentage of purchase with discount applied?
select 
	item_purchased,
	100 * sum(case when discount_applied = 'Yes' then 1 else 0 end) / count(*) as discount_percentage
from customer
group by item_purchased
order by discount_percentage desc
limit 5

-- Q7. Segment customers into New, Returing, and loyal based on thire total
--number of previous purchased, and show the count of each segment.
-- Using CTE

with customer_type as (
	select
		customer_id, previous_purchases,
		case
			when previous_purchases = 1 then 'New'
			when previous_purchases between 2 and 10 then 'Returning'
			else 'Loyal'
		end as customer_segment
	from customer
)

select 
	customer_segment,
	count(*) as number_customer,
	round(100 * count(*) / sum(count(*)) over (),2) as customer_percentage
from customer_type
group by customer_segment
order by number_customer desc

-- Q8. What are the top 3 most purchase products within each category

with item_counts as (
	select
		category,
		item_purchased,
		count(customer_id) as total_order,
		row_number() over (partition by category order by count(customer_id) desc) as item_rank
	from customer
	group by category, item_purchased
)

select 
	item_rank,
	category,
	item_purchased,
	total_order
from item_counts
where item_rank <= 3

-- Q9. Are customer who are repeat buyer (more than 5 previous phurchases) also likly to subscribe?

select
	subscription_status,
	count(customer_id) as repeat_buyer
from customer
where previous_purchases > 5
group by subscription_status

--Q 10. What is the revenue contribution of each age group
select
	age_group,
	sum(purchase_amount) as revenue
from customer
group by age_group
order by revenue desc









