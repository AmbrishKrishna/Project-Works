---SQL CODERUN---

SELECT *
FROM mcb.Passenger

SELECT *
FROM mcb.PgrContactNo

SELECT *
FROM mcb.Booking

SELECT *
FROM mcb.EventSession

SELECT *
FROM mcb.Event

SELECT *
FROM mcb.EventType

SELECT *
FROM mcb.Reservation

SELECT *
FROM mcb.Eatery

SELECT *
FROM mcb.CSOrder

SELECT *
FROM mcb.CSDish

SELECT *
FROM mcb.Dish

SELECT *
FROM mcb.Contain

SELECT *
FROM mcb.Ingredient

SELECT *
FROM mcb.Cuisine

SELECT *
FROM MCB.CategorisedIn

SELECT *
FROM mcb.FoodCategory


---SQL QUERIES---
--CX--
SELECT d.DishName
FROM mcb.Dish d
INNER JOIN mcb.CategorisedIn ci on d.DishID = ci.DishID
INNER JOIN mcb.Cuisine c on d.CuisineID = c.CuisineID
INNER JOIN mcb.FoodCategory fc on ci.FcID = fc.FcID
where c.CuisineName = 'Indian' and fc.FcName = 'Vegetarian'

select e.EatyID, e.EatyName, c.CuisineName,(avg(DATEDIFF(minute, OrderDateTime, DelDateTime))) as 'Average Delivery Time (Minutes)' 
from mcb.CSOrder cs
inner join mcb.Dish d on d.DishID = cs.DishID
inner join mcb.Eatery e on e.EatyID = d.EatyID
inner join mcb.Cuisine c on c.CuisineID = d.CuisineID
where c.CuisineName = 'Western'
Group by e.EatyName, e.EatyID, c.CuisineName

select b.SessionNo, e.EventName, sum (b.NoOfAdultTicket) AS 'Number of Adults', sum (b.NoOfChildTicket) as 'Number of Children', E.EventCapacity
from mcb.Booking b 
INNER JOIN mcb.Event e on e.EventID = b.EventID
inner join mcb.EventSession es on es.EventID = b.EventID and es.SessionNo = b.SessionNo
Group by e.EventCapacity, E.EventName, b.SessionNo
order by e.EventCapacity desc 


--Amb--
select p.PgrID, (sum (cs.OrderQty * cs.OrderPrice)) as 'Total Price paid'
from mcb.CSOrder cs
inner join mcb.Passenger p on p.PgrID = cs.PgrID
group by p.PgrID

select p.PgrID, p.PgrName, b.EventID, (datediff(year, p.PgrDOB, getdate())) as 'Age'
from mcb.Passenger p
inner join mcb.Booking b on b.PgrID = p.PgrID
where (datediff(year, p.PgrDOB, getdate())) < 13
order by p.PgrID

select e.EventID, e.EventName,(sum(b.NoOfAdultTicket) + sum(b.NoOfChildTicket)) as 'Total Amount of Tickets'
from mcb.Booking b
inner join mcb.Event e on e.EventID = b.EventID
where b.BookDateTime > '2022-02-04 00:00:00'
group by e.EventID, e.EventName



--TRIAL-
select EatyName, Count(cs.OrderQty) as 'Number of Cabin Service Orders', sum((cs.OrderQty * cs.OrderPrice)) as 'Total Sales Revenue'
from mcb.Eatery e
inner join mcb.Dish d on d.EatyID = e.EatyID
inner join mcb.CSOrder cs on cs.DishID = d.DishID
group by e.EatyName

