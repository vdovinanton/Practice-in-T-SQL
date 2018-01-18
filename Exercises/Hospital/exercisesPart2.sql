
USE TheHospital

--1. Write a query in SQL to find all the information of the nurses who are yet to be registered.
SELECT * FROM Nurse
	WHERE Registered = 0
GO

--2. Write a query in SQL to find the name of the nurse who are the head of their department.
SELECT * FROM Nurse
	WHERE Position LIKE '%Head%'
GO

--3. Write a query in SQL to obtain the name of the physicians who are the head of each department.
SELECT ph.Name as PhysicianName FROM Physician as ph
	JOIN Department as dp ON dp.Head = ph.EmployeeID
GO

--4. Write a query in SQL to count the number of patients who taken appointment with at least one physician.
SELECT Date FROM Patient AS PAT -- not correct
	JOIN Prescribes AS pre ON PRE.Patient = PAT.SSN
	WHERE pre.Appointment IS NOT NULL
GO
SELECT count(DISTINCT patient) AS "No. of patients taken at least one appointment"
FROM appointment;

--5. Write a query in SQL to find the floor and block where the room number 212 belongs to.
SELECT bl.BlockCode, bl.BlockFloor FROM Block as bl
	JOIN Room AS rm ON rm.BlockCode = bl.BlockCode AND rm.BlockFloor = bl.BlockFloor
	WHERE rm.RoomNumber = 212
GO
SELECT blockfloor AS "Floor", -- second resolve
       blockcode AS "Block"
FROM room
WHERE roomnumber = 212;

--6. Write a query in SQL to count the number available rooms.
SELECT COUNT(*) FROM Room
	WHERE Room.Unavailable = 0
GO

--7. Write a query in SQL to count the number of unavailable rooms.
SELECT COUNT(*) FROM Room
	WHERE Room.Unavailable = 1
GO

--8**. Write a query in SQL to obtain the name of the physician and the departments they are affiliated with.
SELECT ph.Name as PhysitionName, dp.Name as DepartmentName 
	FROM Physician as ph, Department as dp, Affiliated_With as afw
	WHERE afw.Department = dp.DepartmentID AND afw.Physician = ph.EmployeeID
GO

--9. Write a query in SQL to obtain the name of the physicians who are trained for a special treatement.
SELECT ph.Name as PhysicianName, pro.Name as ProcedureName FROM Trained_In as tr -- first solution
	JOIN Physician as ph ON ph.EmployeeID = tr.Physician
	JOIN Procedures as pro ON pro.Code = tr.Treatment
GO

--10. Write a query in SQL to obtain the name of the physicians with department who are yet to be affiliated.
--Напишите запрос в SQL, чтобы получить имя врачей с отделом, которые еще не подключены.
SELECT ph.Name as PhysitionName--, dp.Name as DepartmenName
	FROM Physician as ph
	JOIN Affiliated_With as afw ON afw.Physician = ph.EmployeeID
	JOIN Department as dp ON afw.Department = dp.DepartmentID
	WHERE PrimaryAffiliation = 0
GO

--11. Write a query in SQL to obtain the name of the physicians who are not a specialized physician. 
SELECT ph.Name, ph.Position
	FROM Physician as ph
	WHERE ph.EmployeeID NOT IN 
		(
			SELECT Physician FROM Trained_In
		)
GO

--12. Write a query in SQL to obtain the name of the patients with their physicians by whom they got their preliminary treatement.
SELECT phy.Name as PhysicionName, pat.Name as PatientName -- frist solution
	FROM Undergoes as un
	JOIN Physician as phy ON phy.EmployeeID = un.Physician
	JOIN Patient as pat ON pat.SSN = un.Patient

SELECT phy.Name as PhysicionName, pat.Name as PatientName -- second solution
	FROM Physician as phy, Patient as pat, Undergoes as un
	WHERE un.Physician = phy.EmployeeID AND un.Patient = pat.SSN

--13*. Write a query in SQL to find the name of the patients and the number of physicians they have taken appointment.
SELECT pat.Name, COUNT(*) as 'Count of appointments'
	FROM Appointment as app
	JOIN Patient as pat ON pat.SSN = app.Patient
	GROUP BY pat.Name

--14. Write a query in SQL to count number of unique patients who got an appointment for examination room C.
SELECT p.Name , COUNT(*)
	FROM dbo.Patient p
	JOIN dbo.Appointment a ON p.SSN = a.Patient
	WHERE CONVERT(varchar(10), a.ExaminationRoom) = 'C'
	GROUP BY p.Name

SELECT count(DISTINCT patient) AS 'No. of patients got appointment for room C'
	FROM appointment a
	WHERE CONVERT(varchar(10), a.ExaminationRoom) = 'C'

--15. Write a query in SQL to find the name of the patients and the number of the room where they have to go for their treatment.
--Напишите запрос в SQL, чтобы найти имя пациента и номер комнаты, куда они должны пойти для лечения.
SELECT p.Name, r.RoomNumber -- my solution
	FROM dbo.Stay s
	JOIN dbo.Patient p ON s.Patient = p.SSN
	JOIN dbo.Room r ON s.Room = r.RoomNumber

SELECT p.name AS '"Patient"', -- theyr solution
    a.examinationroom AS '"Room No."',
    a.[Start] AS '"Date and Time of appointment"'
FROM patient p
JOIN appointment a ON p.ssn = a.patient;

--16. Write a query in SQL to find the name of the nurses and the room scheduled, where they will assist the physicians.
SELECT n.Name, a.ExaminationRoom FROM dbo.Appointment a
    JOIN dbo.Nurse n ON a.PrepNurse = n.EmployeeID
GO

--17. Write a query in SQL to find the name of the patients who taken the appointment on the 25th of April at 10 am, and also display their physician, assisting nurses and room no.
SELECT a.[Start] FROM dbo.Appointment a

SELECT p.Name, p2.Name, n.Name
	FROM dbo.Patient p
	JOIN dbo.Appointment a ON p.SSN = a.Patient AND a.[Start] = '2008-04-25 10:00'
	JOIN dbo.Physician p2 ON a.Physician = p2.EmployeeID
	JOIN dbo.Nurse n ON a.PrepNurse = n.EmployeeID

--18. Write a query in SQL to find the name of patients and their physicians who does not require any assistance of a nurse.
--	  найти имя пациентов и их врачей, которые не нуждаются в помощи медсестры.
SELECT p.Name AS PatientName, p2.Name AS PhysicionName FROM	dbo.Appointment a -- a long query
	JOIN dbo.Physician p ON a.Physician = p.EmployeeID
	JOIN dbo.Patient p2 ON p2.SSN = a.Patient
	WHERE a.PrepNurse IS NULL

SELECT p.Name AS PatientName, p2.Name AS PhysicionName FROM dbo.Patient p -- fastier query
	JOIN dbo.Appointment a ON p.SSN = a.Patient AND a.PrepNurse IS NULL
	JOIN dbo.Physician p2 ON p2.EmployeeID = a.Physician

--19. Write a query in SQL to find the name of the patients, their treating physicians and medication.
--найти имя пациентов, их лечащих врачей и медикаментов.
SELECT pat.Name AS PatientName, phy.Name AS PhysicianName, m.Name AS MedicalName 
	FROM dbo.Prescribes pre
	JOIN dbo.Physician phy ON pre.Physician = phy.EmployeeID
	JOIN dbo.Patient pat ON pre.Patient = pat.SSN
	JOIN dbo.Medication m ON pre.Medication = m.Code

--20. Write a query in SQL to find the name of the patients who taken an advanced appointment, and also display their physicians and medication.
SELECT pat.Name AS PatientName, p2.Name AS PhysicoianName, m.Name AS MedicalName FROM dbo.Patient pat
	JOIN dbo.Prescribes p ON p.Patient = pat.SSN AND p.Appointment IS NOT NULL	
	JOIN dbo.Physician p2 ON p.Physician = p2.EmployeeID
	JOIN dbo.Medication m ON p.Medication = m.Code
;

--21. Write a query in SQL to find the name and medication for those patients who did not take any appointment.
SELECT m.Name FROM	dbo.Prescribes p
	JOIN dbo.Patient p2 ON p.Patient = p2.SSN AND p.Appointment IS NULL	
	JOIN dbo.Medication m ON p.Medication = m.Code
;

--22. Write a query in SQL to count the number of available rooms in each block.
SELECT b.BlockCode, COUNT(*) AS 'Avalible rooms' FROM dbo.Block b
	JOIN dbo.Room r ON (b.BlockFloor = r.BlockFloor AND b.BlockCode = r.BlockCode) AND r.Unavailable = 0
	GROUP BY b.BlockCode

--23. Write a query in SQL to count the number of available rooms in each floor. Go to the editor
SELECT b.BlockFloor, COUNT(*) AS 'Avalible rooms' FROM dbo.Block b
	JOIN dbo.Room r ON (b.BlockFloor = r.BlockFloor AND b.BlockCode = r.BlockCode) AND r.Unavailable = 0
	GROUP BY b.BlockFloor

SELECT blockfloor AS "Floor", -- better solution
	count(*) "Number of available rooms"
	FROM room
	WHERE unavailable='false'
	GROUP BY blockfloor
	ORDER BY blockfloor;

--24*. Write a query in SQL to count the number of available rooms for each block in each floor.
SELECT (CONVERT(varchar(5), b.BlockCode) + '-' + CONVERT(varchar(5), b.BlockFloor)) as BlockId, COUNT(*)
	FROM dbo.Block b
	JOIN dbo.Room r ON (b.BlockFloor = r.BlockFloor AND b.BlockCode = r.BlockCode) AND r.Unavailable = 0
	GROUP BY b.BlockCode, b.BlockFloor
;

--25. Write a query in SQL to count the number of unavailable rooms for each block in each floor.
SELECT (CONVERT(varchar(5), b.BlockCode) + '-' + CONVERT(varchar(5), b.BlockFloor)) as BlockId, COUNT(*)
	FROM dbo.Block b
	JOIN dbo.Room r ON (b.BlockFloor = r.BlockFloor AND b.BlockCode = r.BlockCode) AND r.Unavailable = 1
	GROUP BY b.BlockCode, b.BlockFloor
;

--26**. Write a query in SQL to find out the floor where the maximum no of rooms are available.
--Напишите запрос в SQL, чтобы узнать пол, где нет максимального количества номеров.
SELECT blockfloor as "Floor",
       count(*) AS  "No of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor
HAVING count(*) =
  (SELECT max(zz) AS highest_total
   FROM
     ( SELECT blockfloor ,
              count(*) AS zz
      FROM room
      WHERE unavailable='false'
      GROUP BY blockfloor ) AS t );

--27**. Write a query in SQL to find out the floor where the minimum no of rooms are available.
SELECT blockfloor as "Floor",
       count(*) AS  "No of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY blockfloor
HAVING count(*) =
  (SELECT min(zz) AS highest_total
   FROM
     ( SELECT blockfloor ,
              count(*) AS zz
      FROM room
      WHERE unavailable='false'
      GROUP BY blockfloor ) AS t );

--28. Write a query in SQL to obtain the name of the patients, their block, floor, and room number where they are admitted.
SELECT p.Name, b.BlockCode, b.BlockFloor, r.RoomNumber FROM	dbo.Block b	
	JOIN dbo.Room r ON b.BlockFloor = r.BlockFloor AND b.BlockCode = r.BlockCode
	JOIN dbo.Stay s ON r.RoomNumber = s.Room
	JOIN dbo.Patient p ON s.Patient = p.SSN
;

--29. Write a query in SQL to obtain the nurses and the block where they are booked for attending the patients on call.
--29. Напишите запрос в SQL, чтобы получить медсестер и блок, где они забронированы для посещения пациентов по вызову.
SELECT n.*, b.BlockCode, b.BlockFloor FROM dbo.Stay s	
	JOIN dbo.Room r ON s.Room = r.RoomNumber
	JOIN dbo.Block b ON r.BlockFloor = b.BlockFloor AND r.BlockCode = b.BlockCode
	JOIN dbo.On_Call oc ON b.BlockFloor = oc.BlockFloor AND b.BlockCode = oc.BlockCode
	JOIN dbo.Nurse n ON oc.Nurse = n.EmployeeID

SELECT n.name AS "Nurse", -- better solution
       o.blockcode AS "Block"
FROM nurse n
JOIN on_call o ON o.nurse=n.employeeid;

/*30. Write a query in SQL to make a report which will show -
	a) name of the patient, 
	b) name of the physician who is treating him or her,
	c) name of the nurse who is attending him or her,
	d) which treatement is going on to the patient,
	e) the date of release,
	f) in which room the patient has admitted 
	g) which floor and block the room belongs to respectively.*/
SELECT	p.Name AS PatientName, 
		p2.Name AS PhysicianName,
		n.Name AS NurseName,
		pro.Name AS ProcedureName,
		s.StayEnd AS 'Date of realse',
		r.RoomNumber AS 'Was admitt to',
		b.BlockCode,
		b.BlockFloor
	FROM dbo.Patient p
	JOIN dbo.Physician p2 ON p.PCP = p2.EmployeeID
	JOIN dbo.Appointment a ON p.SSN = a.Patient
		JOIN dbo.Nurse n ON a.PrepNurse = n.EmployeeID
		JOIN dbo.Undergoes u ON p.SSN = u.Patient
	JOIN Procedures pro ON pro.Code = u.Procedures
	JOIN dbo.Stay s ON p.SSN = s.Patient
	JOIN Room r ON	r.RoomNumber = s.Room
	JOIN dbo.Block b ON r.BlockFloor = b.BlockFloor AND r.BlockCode = b.BlockCode

	SELECT * FROM dbo.Patient p



