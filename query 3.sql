-- GROUP BY
-- Jumlah penjualan per Geo ID 
select geoID, sum(Amount), avg(Amount), sum(Boxes)
from sales 
group by GeoID;

-- Jumlah penjualan per Geo ID Country 
select g.geo, sum(Amount), avg(Amount), sum(Boxes)
from sales s
join geo g on s.GeoID =g.GeoID
group by g.Geo;

-- Get the data from people ad product table
select pr.category, p.team, sum(boxes), sum(Amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
where p.team <> ''
group by pr.category, p.team
order by pr.category, p.team;

-- Total Amounts by top 10 products
select pr.Product, sum(s.amount) as 'Total Amount'
from sales s
join products pr on pr.pid = s.pid
group by pr.Product
order by 'Total Amount' desc
LIMIT 10;