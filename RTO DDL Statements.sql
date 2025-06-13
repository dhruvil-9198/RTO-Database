CREATE Schema RMS

SET Search_Path to RMS

CREATE TABLE RTO(
	Branch_ID   Char(4) CHECK (Branch_Id ~	'^[A-Z]{2}[0-9]{2}$'),
	Branch_Name Varchar(26)  NOT NULL UNIQUE,
	PRIMARY KEY(Branch_ID)
);

CREATE TABLE Vehicle_Type(
  Vehicle_Type_ID   Varchar(8) CHECK( Vehicle_Type_ID IN ('MCWOG', 'MCWG', 'MCWOG-TT', 'MCWG-TT', 'LMV', 'SUV', 'HMV', 'HGMV', 'HPMV', 'MGV', 'MPV', 'MPV-T', 'HTV', 'HCV', 'LMV-TT', 'TPT', 'RICKSHAW', 'TRACTOR'
)),
  Vehicle_Type_Name Varchar(50) NOT NULL UNIQUE,
  PRIMARY KEY(Vehicle_Type_ID)
);

CREATE TABLE Department(
	Department_ID   Decimal(3,0) CHECK (Department_ID < 200 AND Department_ID > 100),
	Department_Name Varchar(20) NOT NULL UNIQUE,
	PRIMARY KEY(Department_ID )
);

CREATE TABLE Employee(
	Employee_ID  Decimal(10,0),
	Name         Varchar(50) NOT NULL,
	DOB          DATE        NOT NULL,
	CHECK (DOB <= (CURRENT_DATE - INTERVAL '21 years')),
	DOJ          DATE        NOT NULL,
	Address      Varchar(100)NOT NULL,
	State        Varchar(50) NOT NULL,
	Salary	    Decimal(7,0)	NOT NULL,
	Pan_NO       Char(10) NOT NULL UNIQUE CHECK (PAN_NO ~ '^[A-Z]{5}[0-9]{4}[A-Z]{1}$'),
	Branch_ID   Char(4),
	Dep_ID       Decimal(3,0),
	PRIMARY KEY(Employee_ID),
	FOREIGN KEY(Branch_ID) REFERENCES RTO(Branch_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY(Dep_ID) REFERENCES Department(Department_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Users(
    Id_Proof       Decimal(12,0),
	Name           Varchar(50) NOT NULL,
	Phone_Number   Decimal(10,0) NOT NULL,
	DOB            DATE        NOT NULL,
	CHECK (DOB <= (CURRENT_DATE - INTERVAL '18 Years')),
 	Blood_Group   Varchar(3)    NOT NULL CHECK (Blood_Group IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
	Street		  Varchar(50)   NOT NULL,
	City		  Varchar(20)   NOT NULL,
	State         Varchar(50)   NOT NULL,
	Username	  Varchar(20)   NOT NULL UNIQUE CHECK (Username ~ '^@[A-Za-z0-9_]+$'),
	Password	  Varchar(16)   NOT NULL CHECK (length(Password) >= 8),
	Branch_ID     Char(4),
	PRIMARY KEY(Id_Proof),
	FOREIGN KEY(Branch_ID) REFERENCES RTO(Branch_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE License_Type(
    License_Type_ID   Char(2) CHECK (License_Type_ID IN ('LL','NL','IL')),
	License_Type_Name Varchar(30) NOT NULL UNIQUE,
	PRIMARY KEY(License_Type_ID)
); 

CREATE TABLE License(
    License_ID    Char(16) CHECK (License_ID ~ '^[A-Z]{2}[0-9]{2} [0-9]{11}$'),
	Date_Of_Issue	Date	NOT NULL,
	Expiry_Date   Date,
	EID           Decimal(10,0),
	Id_Proof       Decimal(12,0),
	License_Type_ID   char(2),
	PRIMARY KEY(License_ID),
	FOREIGN KEY(License_Type_ID) REFERENCES License_Type(License_Type_ID) ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(EID) REFERENCES Employee(Employee_ID) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(Id_Proof) REFERENCES Users(Id_Proof) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE OR REPLACE FUNCTION calc_l_expiry()
RETURNS TRIGGER AS $BODY$
BEGIN

	NEW.Expiry_Date := NEW.Date_of_Issue + (INTERVAL '1 YEAR'*20) - INTERVAL '1 day';

	RETURN NEW;

END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER set_l_exp
BEFORE INSERT ON License
FOR EACH ROW EXECUTE FUNCTION calc_l_expiry();


CREATE TABLE Permit(
	Permit_ID        Varchar(12)  CHECK(Length(Permit_ID) In (6, 7, 8, 9, 10, 11, 12)),
	Company_Name     Varchar(30)  NOT NULL,
	Company_Address  Varchar(100) NOT NULL,
	Date_of_Issue	Date	NOT NULL,
	Expiry_Date      Date,
	Weight_Limit     Decimal(4,2) NOT NULL,
	EID              Decimal(10,0),
	Id_Proof      Decimal(12,0),
	PRIMARY KEY(Permit_ID),
    FOREIGN KEY(EID) REFERENCES Employee(Employee_ID) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(Id_Proof) REFERENCES Users(Id_Proof) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TRIGGER set_r_exp
BEFORE INSERT ON Permit
FOR EACH ROW EXECUTE FUNCTION calc_l_expiry();
 

CREATE TABLE Vehicle(
    Chassis_No    char(17) CHECK (chassis_no ~ '^[A-Z0-9]{17}$'),
	Vehicle_Type_ID   Varchar(8),
	Model         Varchar(50)  NOT NULL,
	Color		  Varchar(20)  NOT NULL,
	Fuel_Type	  Varchar(20)  NOT NULL,
	CHECK (Fuel_Type IN ('Petrol', 'Diesel', 'Electric', 'Hybrid', 'Petrol/CNG', 'LPG')),
	PRIMARY KEY(Chassis_no),
	FOREIGN KEY(Vehicle_Type_ID ) REFERENCES Vehicle_Type(Vehicle_Type_ID ) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE LV_Association(
    License_ID        Char(16),
    Vehicle_Type_ID   Varchar(8),
    PRIMARY KEY (License_ID, Vehicle_Type_ID),
    FOREIGN KEY (License_ID) REFERENCES License(License_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Vehicle_Type_ID) REFERENCES Vehicle_Type(Vehicle_Type_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE RC_Book(
	Registration_No  Char(10) CHECK(Registration_No ~'^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$'),
	Chassis_No       Char(17),
	EID              Decimal(10,0),
	Id_Proof       Decimal(12,0),
	Date_of_Reg		Date	NOT NULL,
	Expiry_Date		Date,
	PRIMARY KEY(Chassis_No),
	FOREIGN KEY(Chassis_No) REFERENCES Vehicle(Chassis_No) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(EID) REFERENCES Employee(Employee_ID) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(Id_Proof) REFERENCES Users(Id_Proof) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE OR REPLACE FUNCTION calc_expiry()
RETURNS TRIGGER AS $BODY$
DECLARE
	tenure INT;
	vtype Varchar(8);
BEGIN
	SELECT vehicle_Type_ID INTO vtype FROM Vehicle AS v WHERE v.Chassis_No = NEW.Chassis_No;

	IF vtype = 'MCWOG' OR vtype = 'MCWG' OR vtype = 'LMV' OR vtype = 'MPV' OR vtype = 'SUV' OR vtype = 'TRACTOR' THEN
		tenure := 15;
	ELSE
		tenure := 5;
	END IF;

	NEW.Expiry_Date := NEW.Date_of_Reg +(INTERVAL '1 YEAR'*tenure) - INTERVAL '1 day';

	RETURN NEW;

END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER set_exp
BEFORE INSERT ON RC_Book
FOR EACH ROW EXECUTE FUNCTION calc_expiry();

CREATE TABLE Carnet(
	Carnet_ID    VARCHAR(50) CHECK (Carnet_ID ~ '^[A-Z0-9]{8,12}$'),
	Date_of_Issue	Date	NOT NULL,
	Expiry_Date   Date,
    EID           Decimal(10,0),
	Id_Proof      Decimal(12,0),
	Chassis_No     Char(17),
	PRIMARY KEY(Carnet_ID),
	FOREIGN KEY(EID) REFERENCES Employee(Employee_ID) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY(Id_Proof) REFERENCES Users(Id_Proof) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Chassis_No) REFERENCES RC_Book(Chassis_No) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TRIGGER set_c_exp
BEFORE INSERT ON Carnet
FOR EACH ROW EXECUTE FUNCTION calc_l_expiry();

CREATE TABLE Insurance(
	Policy_ID      Varchar(20) CHECK (Policy_ID ~ '^[A-Z0-9-]+$'),
	Holder_Name    Varchar(50) NOT NULL,
	Date_Of_Issue  DATE        NOT NULL,
	Tenure         Decimal(3,2)NOT NULL,
	Chassis_No     Char(17),
	PRIMARY KEY(Policy_ID),
	FOREIGN KEY(Chassis_No) REFERENCES RC_Book(Chassis_No) ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM RTO;

SELECT * FROM Vehicle_Type;

SELECT * FROM Department;

SELECT * FROM Employee;

SELECT * FROM Users;

SELECT * FROM License_Type;

SELECT * FROM License;

SELECT * FROM LV_Association;

SELECT * FROM Permit;

SELECT * FROM Vehicle;

SELECT * FROM Carnet;

SELECT * FROM RC_Book;

SELECT * FROM Insurance;
