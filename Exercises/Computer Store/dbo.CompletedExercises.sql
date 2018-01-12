use ComputerStore
go

--1. Select the names of all the products in the store.
select Name from Products

--2. Select the names and the prices of all the products in the store.
select Name, Price from Products

--3. Select the name of the products with a price less than or equal to $200.
select Name, Price from Products
where Price <= 200

--4. Select all the products with a price between $60 and $120.
select Name, Price from Products
where Price >= 60 and Price <= 120

--5. Select the name and price in cents (i.e., the price must be multiplied by 100).
select Name, (Price * 100) as PriceCents from Products

--6. Compute the average price of all the products.
select avg(Price) as AvaragePrice from Products

--7. Compute the average price of all products with manufacturer code equal to 2.
select avg(Price) as AvaragePrice from Products
where Manufacturer = 2

--8. Compute the number of products with a price larger than or equal to $180.
select count(*) from Products
where Price >= 180

--9*. Select the name and price of all products with a price larger than or equal to $180, 
--   and sort first by price (in descending order), and then by name (in ascending order).
select Name, Price from Products 
where Price >= 180
order by Price, Name

--10. Select all the data from the products, including all the data for each product's manufacturer.
select Products.Name, Price from Products
join Manufacturers on Manufacturers.Code = Products.Manufacturer

--11. Select the product name, price, and manufacturer name of all the products.
select Products.Name, Price, Manufacturers.Name as ManufacturerName  from Products
join Manufacturers on Manufacturers.Code = Products.Manufacturer

--12. Select the average price of each manufacturer's products, showing only the manufacturer's code.
select Manufacturer, avg(Price) from Products
group by Manufacturer

--13*. Select the average price of each manufacturer's products, showing the manufacturer's name.
select Manufacturers.Name as ManufacturerName, avg(Products.Price) as AvaragePrice from Products
join Manufacturers on Manufacturers.Code = Products.Manufacturer
group by Manufacturers.Name

--14*(-). Select the names of manufacturer whose products have an average price larger than or equal to $150.
-- Nedd to repeat Heaving
select AVG(Products.Price), Manufacturers.Name as ManufacturerName from  Products
join Manufacturers on Products.Manufacturer = Manufacturers.Code
group by Manufacturers.Name
Having AVG(Products.Price) >= 150

--15. Select the name and price of the cheapest product.
select Name, Price from Products
where Price = (select min(price) from Products)

--16. Select the name of each manufacturer along with the name and price of its most expensive product.
select	Manufacturers.Name as ManufacturersName, 
		Products.Name as ProductsName, 
		Products.Price 
from Products
join Manufacturers on Products.Manufacturer = Manufacturers.Code
where Price = (select max(price) from Products)

--17. Add a new product: Loudspeakers, $70, manufacturer 2.
insert into Products values ((select max(Code) from Products) + 1 ,'Loudspeakers', 70, 2)

--18. Update the name of product 8 to "Laser Printer".
update Products
set Name = 'Laser Printer'
where Code = 8

--19. Apply a 10% discount to all products.
update Products
set Price = Price - (Price * 0.1)

--20. Apply a 10% discount to all products with a price larger than or equal to $120.
update Products
set Price = Price - (Price * 0.1)
where Price >= 120


