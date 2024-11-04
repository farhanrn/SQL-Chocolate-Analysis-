select * from sales;
select SaleDate, Amount, Customers from sales;
select Amount, Customers, GeoID from sales;
select SaleDate, Amount, Boxes, Amount / Boxes from sales;
select SaleDate, Amount, Boxes, Amount / Boxes as 'Amount per box'from sales;
SELECT * from sales
WHERE amount > 10000;
-- Order By sales amount > 10000 analysis
select* FROM sales
WHERE amount > 10000
ORDER BY Amount desc;
-- Order By PID and Amount of 
select* FROM sales
WHERE GeoID = 'G1'
ORDER BY PID, Amount desc;
-- updated sales
SELECT * FROM sales
WHERE amount > 10000 AND SaleDate >= '2022-01-01';

-- 2023 and 2024
SELECT SaleDate, Amount from sales
WHERE amount > 10000 and year(SaleDate) = 2022
order by amount desc;

-- Boxes from 0 - 50 
select * from sales
where boxes > 0 and boxes <=50;
select * from sales 
where boxes between 0 and 50;

-- Shipments in friday
select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of Week'from sales 
where weekday(SaleDate) = 4;

-- Bekerja dengan beberapa table

-- Tabel 1 : people
select * from people;
-- Melihat yang Team nya Delish atau Jucies
select * from people 
where Team = 'Delish' or team = 'Jucies';
-- sama aja
select * from people 
where team in('Delish','Jucies');

-- Pattern Matching
-- Misal mau menampilkan data pada Salesperson dengan nama tertentu huruf 'B'
select * from people 
where Salesperson like '%B%';

-- Operator CASE
-- amount category as column and amount upto $1000 having level of under 1000
-- amount between $1000 to $5000 having level of under 5000
select * from sales;

Select SaleDate, Amount,
	case	when amount< 1000 then 'under 1k'
			when amount < 5000 then 'under 5k'
			when amount < 10000 then 'under 10k'
		else	'10k or more'
	end as 'Amount Category'
from sales;


