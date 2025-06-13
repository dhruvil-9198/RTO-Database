SET SEARCH_PATH TO RMS;

--1.Total number of license holder of particular vehicle type
SELECT Vehicle_Type_Id, COUNT(License_ID) AS "No of users" FROM LV_Association GROUP BY Vehicle_Type_ID;

--2.Details of vehicles inactive
SELECT * FROM RC_Book WHERE current_date > expiry_date;

--3.Details of license expired
SELECT * FROM License WHERE current_date > expiry_date;

--4.Total number of carnet holder in each state
SELECT SUBSTRING(r.Registration_No, 1, 2) AS "State Code",COUNT(c.*) FROM Carnet AS c JOIN RC_Book AS r ON c.Chassis_No = r.Chassis_No GROUP BY SUBSTRING(r.Registration_No, 1, 2);

--5.Total number of carnet issued in each RTO branch
SELECT SUBSTRING(r.Registration_No, 1, 4) AS "State Code",COUNT(*) FROM Carnet AS c JOIN RC_Book AS r ON c.Chassis_No = r.Chassis_No GROUP BY SUBSTRING(r.Registration_No, 1, 4);

--6.RTOs who have issued license but not carnet and permit
SELECT * 
FROM RTO AS r WHERE 
Branch_ID IN (
	SELECT Branch_ID 
	FROM License AS l 
	JOIN Employee AS e ON l.EID = e.Employee_id
)
AND Branch_ID NOT IN (
	SELECT Branch_ID FROM Carnet AS c 
	JOIN Employee AS e ON c.EID = e.Employee_id
)
AND Branch_ID NOT IN (
	SELECT Branch_ID FROM Permit AS p 
	JOIN Employee AS e ON p.EID = e.Employee_id);

--7.Show details of cars owned by given user
SELECT * FROM RC_Book WHERE ID_Proof = 678901234567;

--8.Details of owners owning both private car and motorcycle
SELECT * FROM Users AS u WHERE EXISTS (SELECT ID_Proof FROM RC_Book AS r JOIN Vehicle AS v ON r.chassis_no = v.chassis_No WHERE (v.Vehicle_Type_ID = 'LMV' OR v.Vehicle_Type_ID = 'MPV' OR v.Vehicle_Type_ID = 'SUV') AND r.ID_Proof = u.ID_Proof) 
AND EXISTS (SELECT ID_Proof FROM RC_Book AS r JOIN Vehicle AS v ON r.chassis_no = v.chassis_No WHERE (v.Vehicle_Type_ID = 'MCWOG' OR v.Vehicle_Type_ID = 'MCWG') AND r.ID_Proof = u.ID_Proof);

SELECT * 
FROM Users AS u
WHERE EXISTS (
    SELECT ID_Proof
    FROM RC_Book AS r
    JOIN Vehicle AS v ON r.chassis_no = v.chassis_No
    WHERE (v.Vehicle_Type_ID = 'LMV' OR v.Vehicle_Type_ID = 'MPV' OR v.Vehicle_Type_ID = 'SUV')
    AND r.ID_Proof = u.ID_Proof
)
AND EXISTS (
    SELECT ID_Proof
    FROM RC_Book AS r
    JOIN Vehicle AS v ON r.chassis_no = v.chassis_No
    WHERE (v.Vehicle_Type_ID = 'MCWOG' OR v.Vehicle_Type_ID = 'MCWG')
    AND r.ID_Proof = u.ID_Proof
);

--9.Show details of Users with vehicles whose registration is expiring this year
SELECT * FROM Users AS u NATURAL JOIN RC_Book AS r WHERE EXTRACT(YEAR FROM r.expiry_date) = EXTRACT(YEAR FROM current_date);

SELECT * 
FROM Users AS u 
NATURAL JOIN RC_Book AS r
WHERE EXTRACT(YEAR FROM r.expiry_date) = EXTRACT(YEAR FROM CURRENT_DATE);


--10.Show total number of employees in each RTO branch
SELECT Branch_Id,COUNT(*) FROM Employee GROUP BY Branch_id;

--11.Display all employees with salary higher than department avg salary
SELECT e.*, d.salary FROM Employee AS e JOIN (SELECT dep_id, AVG(salary) AS salary FROM Employee GROUP BY Dep_id) AS d ON e.Dep_id = d.Dep_id 
WHERE e.salary > d.salary;


--12.Show total number of employees in each State
SELECT SUBSTRING(Branch_Id, 1, 2) AS "State Code",COUNT(*) FROM Employee GROUP BY SUBSTRING(Branch_Id, 1, 2);

--13.Show total number of RTOs in particular state
SELECT SUBSTRING(Branch_Id, 1, 2), COUNT(*) FROM RTO GROUP BY SUBSTRING(Branch_Id, 1, 2);

--14.Show details of all RTOs
SELECT * FROM RTO;

--15.Find All vehicle types which given user is allowed to drive
SELECT la.Vehicle_Type_ID FROM LV_Association la JOIN License l ON la.License_ID = l.License_ID WHERE l.Id_Proof = 234567890123;

SELECT 
    la.Vehicle_Type_ID
FROM 
    LV_Association AS la
JOIN 
    License AS l ON la.License_ID = l.License_ID
WHERE 
    l.Id_Proof = 234567890123;


--16.Show total number of license holder
SELECT COUNT(License_ID) FROM License;

--17.Show total number of licenses issued by each RTO branch
SELECT Branch_ID, COUNT(License_ID)  AS Total_Licence_Holder
FROM USERS JOIN License ON USERS.Id_Proof=License.Id_Proof 
GROUP BY Branch_ID;

--18.Show total number of license holder in each state
SELECT State, COUNT(License_ID) AS Total_Licence_Holder
FROM USERS JOIN License ON USERS.Id_Proof=License.Id_Proof 
GROUP BY State;

--19.Show total number of active vehicles
SELECT COUNT(*) FROM RC_Book WHERE current_date < expiry_date;

--20.Show total number of vehicles in each state
SELECT u.STATE, COUNT(v.Chassis_No) AS Total_Vehicle FROM vehicle v JOIN Rc_book r ON v.chassis_no = r.chassis_no JOIN users u ON r.id_proof = u.id_proof GROUP BY u.state;

--21.Show total number of vehicles of each vehicle type
SELECT vehicle_type_ID ,COUNT(chassis_No) AS Total_vehicle FROM vehicle GROUP BY vehicle_type_ID;

--22.Show total number of RCs issued by particular RTO branch
SELECT b.branch_id , COUNT(rc.Registration_No) AS Total_RC FROM RC_Book rc JOIN users u ON rc.id_proof = u.id_proof JOIN rto b ON u.branch_id = b.branch_id GROUP BY b.branch_id;


--23.Show details of users with atleast two vehicles
SELECT u.* FROM Users AS u JOIN RC_Book AS r ON u.ID_Proof = r.ID_Proof GROUP BY u.ID_Proof HAVING COUNT(u.ID_proof)>=2;

--24.Show details of user who does not own any vehicle
SELECT * FROM Users WHERE ID_Proof NOT IN (SELECT ID_Proof FROM RC_Book);

--25.List all the RTOs with Less than 3 employees
SELECT r.* FROM RTO AS r NATURAL JOIN Employee AS e GROUP BY r.Branch_ID HAVING COUNT(*) < 3; 

--26.List employees who have have issued more than 1 license
SELECT e.* FROM Employee AS e JOIN License AS l ON e.Employee_ID = l.EID GROUP BY e.Employee_ID HAVING COUNT(*)>1;

--27.Show details of user who own all available vehicle types
SELECT U.Id_Proof, U.Name FROM Users U WHERE NOT EXISTS (SELECT VT.Vehicle_Type_ID FROM Vehicle_Type VT WHERE NOT EXISTS 
(SELECT 1 FROM RC_Book R JOIN Vehicle V ON R.Chassis_No = V.Chassis_No WHERE R.Id_Proof = U.Id_Proof AND V.Vehicle_Type_ID = VT.Vehicle_Type_ID));

SELECT u.Id_Proof, u.Name
FROM Users u
WHERE NOT EXISTS (
    SELECT veh.Vehicle_Type_ID
    FROM Vehicle_Type veh
    WHERE NOT EXISTS (
        SELECT 1
        FROM RC_Book rc
        JOIN Vehicle v ON rc.Chassis_No = v.Chassis_No
        WHERE rc.Id_Proof = u.Id_Proof
        AND v.Vehicle_Type_ID = veh.Vehicle_Type_ID
    )
);



--28.List employees of CARNET department who have not issued any carnet
SELECT * FROM Employee WHERE Dep_ID = 104 AND Employee_ID NOT IN (SELECT EID FROM Carnet);

--29.Find users owning maximum vehicles in their cities
SELECT u.city, u.name 
FROM Users AS u 
WHERE (
	SELECT COUNT(*) 
	FROM RC_Book AS r 
	WHERE r.ID_Proof = u.ID_Proof
) = (
	SELECT  MAX(cnt) 
	FROM (
		SELECT COUNT(*) AS cnt 
		FROM RC_Book AS r 
		WHERE SUBSTRING(r.Registration_No, 1, 4) = u.Branch_ID
		GROUP BY R.ID_Proof
	)
);


--30.Show total number of international driving license holder in each state
SELECT SUBSTRING(License_Id, 1, 2),COUNT(*) FROM License WHERE License_Type_ID = 'IL' GROUP BY SUBSTRING(License_Id, 1, 2);

--31.Show total number of international driving license issued by each RTO branch
SELECT SUBSTRING(License_Id, 1, 4),COUNT(*) FROM License WHERE License_Type_ID = 'IL' GROUP BY SUBSTRING(License_Id, 1, 4);

--32.Show total number of permit holder in each RTO branch
SELECT Branch_Id AS "State Code",COUNT(*) FROM Permit AS p NATURAL JOIN Users AS u GROUP BY u.Branch_id;

--33.Show total number of permit issued by each state
SELECT SUBSTRING(u.Branch_Id, 1, 2) AS "State Code",COUNT(*) FROM Permit AS p NATURAL JOIN Users AS u GROUP BY SUBSTRING(u.Branch_id, 1, 2);

SELECT 
    SUBSTRING(u.Branch_Id, 1, 2) AS "State Code",
    COUNT(*)
FROM 
    Permit AS p 
    NATURAL JOIN Users AS u
GROUP BY 
    SUBSTRING(u.Branch_Id, 1, 2);
