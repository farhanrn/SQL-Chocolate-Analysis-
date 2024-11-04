-- JOINS
select * from sales;
-- siapa namanya
select * from people;

select s.saleDate, s.amount, p.Salesperson, s.SPID, p.spid
from sales as s
-- kayak vlookup
join people p on p.SPID = s.SPID;

-- LEFT Join
-- Product name that we are selling in this shipment
select s.SaleDate, s.amount, s.pid, pr.product
from sales s
left join products pr on pr.pid = s.pid;

-- JOIN MULTIPLE TABLE 
-- Product name and person name in one view
select s.saleDate, s.amount, p.Salesperson, pr.product, p.team
from sales s 
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid;

-- CONDITION WITH JOIN
select s.saleDate, s.amount, p.Salesperson, pr.product, p.team
from sales s 
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid
where s.amount < 500 and p.Team = 'Delish';

-- Kondisi people not belong to any team 
select s.saleDate, s.amount, p.Salesperson, pr.product, p.team
from sales s 
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid
where s.amount < 500 and p.Team = '';

-- Kondisi people from india atau New Zealand
select s.saleDate, s.amount, p.Salesperson, pr.product, p.team, g.Geo
from sales s 
join people p on p.SPID = s.SPID
join products pr on pr.pid = s.pid
join geo g on g.geoid = s.GeoID
and p.Team=''
and g.Geo in ('Inida', 'New Zealand')
order by SaleDate;







