
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
SELECT Warehouses.Code, Warehouses.Location
    FROM Warehouses
    WHERE Warehouses.Capacity <
        (
            SELECT COUNT(*) 
                FROM Boxes
                WHERE Warehouse = Warehouses.Code
        )

--10. Select the codes of all the boxes located in Chicago.
SELECT Boxes.Code as BoxCode, Warehouses.Location
    FROM Boxes
    JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code
    WHERE convert(NVARCHAR(10) , Warehouses.Location) = 'Chicago'

--11. Create a new warehouse in New York with a capacity for 3 boxes.
INSERT INTO Warehouses(Code, Location, Capacity) VALUES(6,'New York', 3);

--12. Create a new box, with code "H5RT", containing "Papers" with a value of $200, 
--    and located in warehouse 2.
INSERT INTO Boxes(Contents,Value,Warehouse) VALUES('Papers', 200 ,2);

--13. Reduce the value of all boxes by 15%.
SELECT  Code as BoxCode,
        ROUND([Value] - (Value * 0.15), 0) as ReducedValue,
        Value FROM Boxes
UPDATE Boxes

SET [Value] = ROUND([Value] - (Value * 0.15), 0)

--14. Apply a 20% value reduction to boxes with a value larger than the average value of all the boxes.
--14. Примените 20% -ное снижение стоимости к ящикам со значением, большим, чем среднее значение всех полей.
SELECT Code, Value, ROUND([Value] - (Value * 0.20), 0)
    FROM Boxes
    WHERE [Value] > 
        (
            SELECT AVG(Value) 
                FROM Boxes
        )

UPDATE Boxes
SET Value = ROUND([Value] - (Value * 0.20), 0)
    WHERE [Value] > 
            (
                SELECT AVG(Value) 
                    FROM Boxes
            )

--15. Remove all boxes with a value lower than $100.
DELETE Boxes
    WHERE [Value] > 100

--16**. Remove all boxes from saturated warehouses.
DELETE FROM Boxes 
    WHERE Warehouse IN
   (
     SELECT Code
       FROM Warehouses
       WHERE Capacity <
       (
         SELECT COUNT(*)
           FROM Boxes
           WHERE Warehouse = Warehouses.Code
       )
   );