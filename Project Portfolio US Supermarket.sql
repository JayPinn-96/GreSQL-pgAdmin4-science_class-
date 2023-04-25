/* Project based on the dataset of a Supermarket based in the US*/

Select * from sales;
Select * from customer;
Select * from product;

/* I got a list of all cities where the region is South or East without any duplicates,
I retreived the list of all ordes where the 'sales' value is between 100 and 500,
I retrieved the list of customers whose last name contains only 4 characters,*/

SELECT DISTINCT	 city FROM customer WHERE region in ('South','East');
Select * from sales where sales between 100 and 500;
Select * from customer where customer_name like '% ____';

/* I retrieved the top 10 orders where the discount is greatest,*/

SELECT * FROM sales WHERE discount > 0 order by discount desc limit 10;

/* I found the sum of all the sales values,
I found the amount of customers in the north region and their ages,
I found the mean of the age of customers from the East region
I found the range of ages of customers from Philadelphia*/

Select sum(sales) from sales;
Select count(*) from customer where age between 20 and 30;
Select avg(age) from customer where region ='East';
Select min(age) as min_age, max(age) as max_age from customer where city='Philadelphia';

/* I made a dashboard showing these figures for each product ID:
1. Total sales (in $)
2. Total sales quantity
3. Number of orders
4. Maximum sales value
5. Minimum sales value
6. Average sales value,

I retrieved the list of product ID's where the quantity of proudct sold was greater than 10*/

SELECT product_id, 
sum(sales) as Total_sales, 
sum(quantity) as total_quantity, 
count(order_id) as total_order, 
max(sales) as max_sales, 
min(sales) as min_sales, 
avg(sales) as avg_sales
FROM sales GROUP BY product_id order by total_sales desc;

/*I retrieved the data containing product_id, product name, the product category, the total sales value of that product and the total quantity sold by joining different tables*/

SELECT a.*, sum(b.sales) as total_sales, sum(quantity) as total_quantity
FROM product as a LEFT JOIN sales as b
on a.product_id = b.product_id
GROUP BY a.product_id;

/* I retrieved the data wwith all the colums of the sales table, customer name, customer age, product name and category in the same table,
I needed to use a join within a subquery to collect this data,*/

SELECT c.customer_name, c.age, sp.* FROM customer as c
right join (select s.*, p.product_name, p.category FROM sales as s
		   LEFT JOIN product as p on s.product_id=p.product_id) as sp
		   on c.customer_id=sp.customer_id;
		   
/* I created a View which contained order_line, product_id, sales and the discount value of the first order date in the sales table*/

CREATE VIEW Daily_Billing as 
SELECT order_line, product_id, sales, discount FROM sales WHERE order_date 
in (select max(order_date) from sales);

/*I found the maximum length of characters of the name of a product in the store,
I retrieved the product name, sub_category and category and an additional column named "product_details" which contains a concatenated string of product name, sub-category and category,
I split up the three components of the product_id column into separate columns,
I listed down the comma-separated product name where the sub-category is either chairs or tables,*/

Select max(length(product_name)) FROM product;
SELECT product_name, sub_category, category, (product_name||','||sub_category||','||category) as product_details
FROM product;
SELECT product_id, substring(product_id for 3) as category_brief,
substring(product_id from 5 for 2) as sub_brief, substring(product_id from 8) as id from product;
SELECT string_agg(product_name,',') from product where sub_category in ('Chairs','Tables');

/* I randomly selected 5 customers from the customer table,
Customers can not be charged in decimal points, so a sales value needs to be either rounded up or down, with this I found
the total sales revenue if rounding down, the sales revenue if rounding up and the total sales revenue when rounding-off the sales,*/

SELECT customer_id, random() as rand_no FROM customer ORDER BY rand_no limit 5;
SELECT sum(ceil(sales)) as higher_int_sales,
sum(floor(sales)) as lower_int_sales,
sum(round(sales)) as round_int_sales FROM sales;

/* I found the age of a customer born on April 6, 1939.
I analysed and found out the monthly sales of chairs and how it changed throughout the seasons*/

SELECT age(current_date,'1939-04-06')
SELECT extract(month from order_date) as month_n, sum(sales) as total_sales from sales
WHERE product_id in (SELECT product_id FROM product where sub_category='Chairs')
GROUP BY month_n
ORDER BY month_n;

/* I created a line chart of total sales and the month, and found the most sales taking place in Autumn, more precisely from September to December,*/

/* I found out all the customers who have their first name and last name of 5 characters each and last name starts with "a/b/c/d",
I created a table called "zipcode" and insert data into it,
I then found the valid postcodes from the table,*/

SELECT * FROM customer WHERE customer_name ~*'^[a-z]{5}\s(a|b|c|d)[a-z]{4}$';

CREATE TABLE Zipcode (zip varchar);
INSERT INTO Zipcode values ('234432');
INSERT INTO Zipcode values ('23345');
INSERT INTO Zipcode values ('sdfe4');
INSERT INTO Zipcode values ('123&3');
INSERT INTO Zipcode values ('67424');
INSERT INTO Zipcode values ('7895432');
INSERT INTO Zipcode values ('12312');

SELECT * FROM zipcode WHERE zip~*'6[0-9]{5,6}$';