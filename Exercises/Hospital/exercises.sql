
--1. Obtain the names of all physicians that have performed a medical procedure they have never been certified to perform.
--Получите имена всех врачей, которые выполнили медицинскую процедуру, которую они никогда не сертифицировали для выполнения.
SELECT EmployeeID, Name -- not correct example
    FROM Physician
    WHERE EmployeeID IN 
        (
            SELECT Physician FROM Undergoes
            WHERE Physician = EmployeeID
        )
            AND EmployeeID NOT IN
            (
                SELECT Physician FROM Trained_In
                WHERE Physician = EmployeeID
            )

SELECT EmployeeID, Name 
    FROM Physician
    WHERE EmployeeID IN 
        (
            SELECT Physician FROM Undergoes U
            WHERE NOT EXISTS 
                (
                    SELECT * 
                        FROM Trained_In
                        WHERE Treatment = Procedures
                            AND Physician = U.Physician
                )
        )
;

SELECT Name -- correct example with join
  FROM Physician
    WHERE EmployeeID IN
    (
        SELECT Undergoes.Physician
            FROM Undergoes 
                LEFT JOIN Trained_In ON Undergoes.Physician = Trained_In.Physician
                        AND Undergoes.Procedures = Trained_In.Treatment
        WHERE Treatment IS NULL
    )
;

--2.Same as the previous query, but include the following information in the results: 
--  Physician name, name of procedure, date when the procedure was carried out, 
--  name of the patient the procedure was carried out on.
SELECT  Physician.Name AS PhysicianName, -- not correct
        Procedures.Name AS ProceduresName,
        Undergoes.DateUndergoes AS UndergoesDateUndergoes,
        Patient.Name AS PatientName
  FROM Physician
    JOIN Undergoes ON Undergoes.Physician = Physician.EmployeeID
    JOIN Procedures ON Procedures.Code = Procedures
    JOIN Patient ON Patient.SSN = Undergoes.Patient
    WHERE EmployeeID IN
    (
        SELECT Undergoes.Physician
            FROM Undergoes 
                LEFT JOIN Trained_In ON Undergoes.Physician = Trained_In.Physician
                        AND Undergoes.Procedures = Trained_In.Treatment
        WHERE Treatment IS NULL
    )
;

SELECT P.Name AS Physician, Pr.Name AS Procedures, U.DateUndergoes, Pt.Name AS Patient 
  FROM Physician P, Undergoes U, Patient Pt, Procedures Pr
  WHERE U.Patient = Pt.SSN
    AND U.Procedures = Pr.Code
    AND U.Physician = P.EmployeeID
    AND NOT EXISTS 
              (
                SELECT * FROM Trained_In T
                WHERE T.Treatment = U.Procedures
                AND T.Physician = U.Physician
              )
;

--3. Obtain the names of all physicians that have performed a medical procedure that they 
--are certified to perform, but such that the procedure was done at a date (Undergoes.Date) 
--after the physician's certification expired (Trained_In.CertificationExpires).
/*Получите имена всех врачей, которые выполнили медицинскую процедуру, 
которую они сертифицировали для выполнения, но чтобы процедура была выполнена на дату 
(Undergoes.Date) по истечении срока действия врача (Trained_In.CertificationExpires).*/
SELECT Name -- without join
    FROM Physician p, Undergoes u, Trained_In t
    WHERE p.EmployeeID = u.Physician
        AND t.Physician = p.EmployeeID
        AND u.DateUndergoes > t.CertificationExpires

SELECT Name -- with join
    FROM Physician as p
    JOIN Undergoes as u ON u.Physician = p.EmployeeID
    JOIN Trained_In as t ON t.Physician = p.EmployeeID
    WHERE u.DateUndergoes > t.CertificationExpires

 /* 4. Same as the previous query, but include the following information in the results: 
    Physician name, name of procedure, date when the procedure was carried out, 
    name of the patient the procedure was carried out on, and date when the certification expired.
*/
SELECT  p.Name as PhysicianName,
        pr.Name as ProcedureName,
        u.DateUndergoes as ProcedureDate,
        pat.Name as PatientName,
        t.CertificationExpires as CertificationExpires
    FROM Physician as p

    JOIN Undergoes as u ON u.Physician = p.EmployeeID
    JOIN Trained_In as t ON t.Physician = p.EmployeeID
         AND u.DateUndergoes > t.CertificationExpires
    JOIN Procedures as pr ON pr.Code = u.Procedures
    JOIN Patient as pat ON pat.SSN = u.Patient

/*5. Obtain the information for appointments where a patient met with a physician other than 
his/her primary care physician. Show the following information: Patient name, physician name, 
nurse name (if any), start and end time of appointment, examination room, and the name of the 
patient's primary care physician.
Получите информацию о встречах, когда пациент встретился с врачом, кроме
его / ее врач первичной помощи. Покажите следующую информацию: имя пациента, имя врача,
имя медсестры (если есть), время начала и окончания приема, экзаменационная комната и имя
врач первичной помощи пациента.
*/
SELECT  pat.Name as PatientName, -- not correct
        phy.Name as PhysicianName,
        nur.Name as NurseName,
        app.Start as StartDate,
        app.EndAt as EndDate,
        app.ExaminationRoom as ExaminationRoom
    FROM Prescribes as pr

    JOIN Patient as pat ON pat.SSN = pr.Patient
    JOIN Physician as phy ON phy.EmployeeID = pr.Physician
    JOIN Appointment as app ON app.AppointmentID = pr.Appointment
    JOIN Nurse as nur ON nur.EmployeeID = app.PrepNurse

SELECT  Pt.Name AS Patient, 
        Ph.Name AS Physician, 
        N.Name AS Nurse, A.Start, A.EndAt, A.ExaminationRoom, PhPCP.Name AS PCP
  FROM  Patient Pt, 
        Physician Ph, 
        Physician PhPCP, 
        Appointment A 
 LEFT JOIN Nurse N ON A.PrepNurse = N.EmployeeID
 WHERE A.Patient = Pt.SSN
   AND A.Physician = Ph.EmployeeID
   AND Pt.PCP = PhPCP.EmployeeID
   AND A.Physician <> Pt.PCP;

/*6. The Patient field in Undergoes is redundant, since we can obtain it from the Stay table. 
There are no constraints in force to prevent inconsistencies between these two tables. 
More specifically, the Undergoes table may include a row 
where the patient ID does not match the one we would obtain from the Stay table through 
the Undergoes.Stay foreign key. Select all rows from Undergoes that exhibit this inconsistency 
Поле Patient in Undergoes является избыточным, поскольку мы можем получить его из таблицы Stay.
Для предотвращения несоответствий между этими двумя таблицами нет никаких ограничений.
Более конкретно, таблица Undergoes может включать строку
где идентификатор пациента не совпадает с тем, который мы получили бы из таблицы Stay через
внешний ключ Undergoes.Stay. 
Выберите все строки из Undergoes, которые демонстрируют эту несогласованность
*/

/*7. Obtain the names of all the nurses who have ever been on call for room 123.*/
SELECT n.Name
    FROM Nurse as n
    JOIN On_Call as ac ON ac.Nurse = n.EmployeeID
    JOIN Room as rm ON rm.BlockCode = ac.BlockCode 
        AND rm.BlockFloor = ac.BlockFloor
        AND rm.RoomNumber = 123
;

/*8. The hospital has several examination rooms where appointments take place. Obtain the number 
of appointments that have taken place in each examination room.
В больнице есть несколько комнат для осмотра, где проводятся встречи. 
Получите количество встреч, которые были проведены в каждом экзаменационном зале.
*/
SELECT app.AppointmentID, COUNT(app.AppointmentID)
    FROM Appointment as app
    GROUP BY app.ExaminationRoom

/*9. Obtain the names of all patients (also include, for each patient, the name of the 
patient's primary care physician), such that \emph{all} the following are true:

The patient has been prescribed some medication by his/her primary care physician.
The patient has undergone a procedure with a cost larger that $5,000
The patient has had at least two appointment where the nurse who prepped the appointment was a 
    registered nurse.
У пациента было по крайней мере две встречи, когда медсестра, которая приготовила встречу, была
    дипломированная медсестра
The patient's primary care physician is not the head of any department.*/
SELECT pt.Name -- not correct
    FROM Patient as pt
    JOIN Prescribes as pre ON pre.Patient = pt.SSN
    JOIN  Undergoes as un ON un.Patient = pt.SSN
        JOIN Procedures as pro ON pro.Code = un.Procedures AND pro.Cost > 5000
    JOIN Appointment as app ON app.Patient = pt.SSN AND 2 <=
            (
                SELECT COUNT(*)
                FROM Nurse, Appointment
                    WHERE Registered = 1  and EmployeeID = Appointment.PrepNurse
            )
    JOIN Physician as phy ON phy.EmployeeID = pt.PCP
        AND NOT EXISTS
            (
                SELECT * 
                    FROM Department as dp
                    WHERE dp.Head = phy.EmployeeID
            )

SELECT Pt.Name, PhPCP.Name FROM Patient Pt, Physician PhPCP
 WHERE Pt.PCP = PhPCP.EmployeeID
   AND EXISTS
       (
         SELECT * FROM Prescribes Pr
          WHERE Pr.Patient = Pt.SSN
            AND Pr.Physician = Pt.PCP
       )
   AND EXISTS
       (
         SELECT * FROM Undergoes U, Procedures Pr
          WHERE U.Procedures = Pr.Code
            AND U.Patient = Pt.SSN
            AND Pr.Cost > 5000
       )
   AND 2 <=
       (
         SELECT COUNT(A.AppointmentID) FROM Appointment A, Nurse N
          WHERE A.PrepNurse = N.EmployeeID
            AND N.Registered = 1
       )
   AND NOT Pt.PCP IN
       (
          SELECT Head FROM Department
       );


SELECT * from Nurse
    