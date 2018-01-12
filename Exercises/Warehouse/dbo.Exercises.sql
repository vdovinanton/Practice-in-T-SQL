
--1. Select all warehouses.
SELECT * FROM Warehouses

--2. Select all boxes with a value larger than $150.
SELECT * FROM Boxes
    WHERE Value > 150

--3. Select all distinct contents in all the boxes.
SELECT DISTINCT CONVERT([varchar], Contents) FROM Boxes

--4. Select the average value of all the boxes.
SELECT AVG(Value) FROM Boxes

--5. Select the warehouse code and the average value of the boxes in each warehouse.
SELECT Warehouse, Avg(Value)
    FROM Boxes
    GROUP BY Warehouse

--6. Same as previous exercise, but select only those warehouses 
--   where the average value of the boxes is greater than 150.
SELECT Warehouse, Avg(Value)
    FROM Boxes
    GROUP BY Warehouse
    HAVING AVG([Value]) > 150

--7. Select the code of each box, along with the name of the city the box is located in.
SELECT Boxes.Code, Warehouses.[Location]
    FROM Boxes
    JOIN Warehouses ON Warehouses.Code = Boxes.Warehouse

--8. Select the warehouse codes, along with the number of boxes in each warehouse. 
--   Optionally, take into account that some warehouses are empty 
--   (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
SELECT Code, COUNT(*)
    FROM Boxes
    GROUP BY Code

/* Taking into account empty warehouses */
 SELECT Warehouses.Code, COUNT(Boxes.Code)
   FROM Warehouses LEFT JOIN Boxes
   ON Warehouses.Code = Boxes.Warehouse
   GROUP BY Warehouses.Code;

--9. Select the codes of all warehouses that are saturated 
--   (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
SELECT Warehouses.Code, Warehouses.[Location]
    FROM Warehouses
    WHERE Warehouses.Capacity <
        (
            SELECT COUNT(*) 
                FROM Boxes
                WHERE Warehouse = Warehouses.Code
        )




