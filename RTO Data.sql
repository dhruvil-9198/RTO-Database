SET SEARCH_PATH TO RMS;

INSERT INTO RTO 
VALUES 
('MH01', 'Mumbai Central'),
('DL02', 'New Delhi'),
('KA03', 'Bangalore East'),
('TN04', 'Chennai East'),
('GJ05', 'Surat'),
('RJ06', 'Bhilwara'),
('KL43', 'Kochi'),
('GJ01', 'Ahmedabad'),
('MP09', 'Indore'),
('UP32', 'Lucknow'),
('PB11', 'Patiala'),
('BR07', 'Darbhanga'),
('HP58', 'Manali'),
('UK14', 'Rishikesh'),
('AS15', 'Barpeta'),
('GJ19', 'Bardoli'),
('CG17', 'Jagdalpur'),
('OD33', 'Bhubaneswar');


INSERT INTO Vehicle_Type 
VALUES 
('MCWOG', 'Motorcycle without gear'),
('MCWG', 'Motorcycle with gear'),
('LMV', 'Light Motor Vehicle'),
('HMV', 'Heavy Motor Vehicle'),
('MGV', 'Medium Goods Vehicle'),
('HTV', 'Heavy Transport Vehicle'),
('HPMV', 'Heavy Passenger Motor Vehicle'),
('TRACTOR', 'Tractor'),
('TPT', 'Transport Vehicle'),
('RICKSHAW', 'Rickshaw'),
('LMV-TT', 'Light Motor Vehicle-Transport Taxi'),
('MPV', 'Multi-Purpose Vehicle'),
('HCV', 'Heavy Commercial Vehicle'),
('HGMV', 'Heavy Goods Motor Vehicle'),
('MCWOG-TT', 'Motorcycle without gear-Transport Taxi'),
('MCWG-TT', 'Motorcycle with gear-Transport Taxi'),
('SUV', 'Sports Utility Vehicle'),
('MPV-T', 'Multi-Purpose Vehicle-Transport Taxi');

INSERT INTO Department
VALUES 
(101, 'Licensing'),
(102, 'Registration'),
(103, 'Permits'),
(104, 'Carnet');



INSERT INTO Employee (Employee_ID, Name, DOB, DOJ, Address, State, Salary, Pan_NO, Branch_ID, Dep_ID) 
VALUES 
(2010101001, 'Rajesh Sharma', '1980-05-12', '2010-06-15', '123 MG Road, Mumbai', 'Maharashtra', 55000, 'ABCDE1234F', 'MH01', 101),
(2012102002, 'Anita Deshmukh', '1985-07-22', '2012-08-01', '456 Bandra West, Mumbai', 'Maharashtra', 60000, 'ABCDE5678F', 'MH01', 102),
(2008103003, 'Vikas Patil', '1978-11-30', '2008-01-20', '789 Colaba, Mumbai', 'Maharashtra', 72000, 'FGHIJ1234K', 'MH01', 103),
(2011104004, 'Swati Joshi', '1990-03-18', '2015-07-10', '101 Juhu, Mumbai', 'Maharashtra', 48000, 'FGHIJ5678K', 'MH01', 104),
(2011101005, 'Suresh Kumar', '1982-01-15', '2011-02-25', '234 Connaught Place, New Delhi', 'Delhi', 57000, 'JKLMN1234P', 'DL02', 101),
(2014102006, 'Priya Arora', '1987-09-10', '2014-04-22', '567 Rajouri Garden, New Delhi', 'Delhi', 52000, 'JKLMN5678P', 'DL02', 102),
(2009103007, 'Aman Verma', '1981-12-05', '2009-09-18', '890 Dwarka, New Delhi', 'Delhi', 68000, 'OPQRS1234T', 'DL02', 103),
(2016104008, 'Meena Khanna', '1991-05-30', '2016-03-12', '321 Saket, New Delhi', 'Delhi', 47000, 'OPQRS5678T', 'DL02', 104),
(2007101009, 'Ravi Reddy', '1979-02-18', '2007-10-20', '123 Indiranagar, Bangalore', 'Karnataka', 75000, 'TUVWX1234Y', 'KA03', 101),
(2013102010, 'Geeta Shetty', '1986-06-12', '2013-01-15', '456 Koramangala, Bangalore', 'Karnataka', 54000, 'TUVWX5678Y', 'KA03', 102),
(2012103011, 'Shankar Naik', '1983-03-22', '2012-08-05', '789 Whitefield, Bangalore', 'Karnataka', 61000, 'XYZAB1234C', 'KA03', 103),
(2017104012, 'Kavya Iyer', '1992-07-08', '2017-02-10', '101 MG Road, Bangalore', 'Karnataka', 46000, 'XYZAB5678C', 'KA03', 104),
(2012101013, 'Vignesh Kumar', '1983-11-05', '2012-07-12', '234 T. Nagar, Chennai', 'Tamil Nadu', 62000, 'CDEFG1234H', 'TN04', 101),
(2015102014, 'Anjali Menon', '1989-10-18', '2015-01-28', '567 Anna Nagar, Chennai', 'Tamil Nadu', 53000, 'CDEFG5678H', 'TN04', 102),
(2005103015, 'Siva Reddy', '1976-08-10', '2005-09-01', '890 Velachery, Chennai', 'Tamil Nadu', 80000, 'HIJKL1234M', 'TN04', 103),
(2016104016, 'Deepa Rajan', '1990-12-20', '2016-04-18', '321 Adyar, Chennai', 'Tamil Nadu', 47000, 'HIJKL5678M', 'TN04', 104),
(2013101017, 'Harsh Patel', '1984-04-25', '2013-09-20', '123 Ring Road, Surat', 'Gujarat', 58000, 'MNOPQ1234R', 'GJ05', 101),
(2015102018, 'Rina Mehta', '1987-11-17', '2015-05-13', '456 City Light, Surat', 'Gujarat', 51000, 'MNOPQ5678R', 'GJ05', 102),
(2009103019, 'Rajesh Desai', '1980-07-08', '2009-12-05', '789 Athwalines, Surat', 'Gujarat', 71000, 'QRSTU1234V', 'GJ05', 103),
(2017104020, 'Maya Shah', '1991-01-14', '2017-08-01', '101 Varachha Road, Surat', 'Gujarat', 46000, 'QRSTU5678V', 'GJ05', 104),
(2010101021, 'Pradeep Singh', '1981-09-25', '2010-11-08', '234 Gandhi Nagar, Bhilwara', 'Rajasthan', 60000, 'VWXYZ1234A', 'RJ06', 101),
(2012102022, 'Kavita Rathore', '1985-12-05', '2012-09-28', '567 Shastri Nagar, Bhilwara', 'Rajasthan', 52000, 'VWXYZ5678A', 'RJ06', 102),
(2011103023, 'Sandeep Joshi', '1982-06-18', '2011-03-15', '890 R.K. Colony, Bhilwara', 'Rajasthan', 63000, 'ABCDE1234B', 'RJ06', 103),
(2016104024, 'Neha Chouhan', '1990-02-14', '2016-06-30', '321 Azad Nagar, Bhilwara', 'Rajasthan', 47000, 'ABCDE5678B', 'RJ06', 104),
(2013101025, 'Ajith Nair', '1984-07-12', '2013-08-10', '234 Marine Drive, Kochi', 'Kerala', 59000, 'EFGHI1234C', 'KL43', 101),
(2015102026, 'Neethu Varghese', '1987-02-24', '2015-02-11', '567 MG Road, Kochi', 'Kerala', 53000, 'EFGHI5678C', 'KL43', 102),
(2009103027, 'Vishnu Menon', '1980-09-05', '2009-03-20', '890 Edappally, Kochi', 'Kerala', 70000, 'JKLMN1234D', 'KL43', 103),
(2017104028, 'Sneha Mathew', '1992-04-15', '2017-05-18', '321 Aluva, Kochi', 'Kerala', 46000, 'JKLMN5678D', 'KL43', 104),
(2010101029, 'Nikhil Patel', '1981-10-22', '2010-09-07', '123 CG Road, Ahmedabad', 'Gujarat', 62000, 'OPQRS1234E', 'GJ01', 101),
(2013102030, 'Pooja Shah', '1985-11-12', '2013-06-23', '456 Satellite, Ahmedabad', 'Gujarat', 53000, 'OPQRS5678E', 'GJ01', 102),
(2008103031, 'Raj Desai', '1978-08-15', '2008-11-09', '789 Vastrapur, Ahmedabad', 'Gujarat', 75000, 'TUVWX1234F', 'GJ01', 103),
(2016104032, 'Aarti Mehta', '1991-01-05', '2016-04-17', '101 Prahlad Nagar, Ahmedabad', 'Gujarat', 46000, 'TUVWX5678F', 'GJ01', 104),
(2011101033, 'Ashish Jain', '1982-02-20', '2011-11-01', '123 MG Road, Indore', 'Madhya Pradesh', 64000, 'YZABC1234G', 'MP09', 101),
(2014102034, 'Ritika Sharma', '1988-03-15', '2014-07-14', '456 Vijay Nagar, Indore', 'Madhya Pradesh', 53000, 'YZABC5678G', 'MP09', 102),
(2009103035, 'Rohit Khurana', '1980-12-18', '2009-02-20', '789 South Tukoganj, Indore', 'Madhya Pradesh',20000, 'DEFGH1234I', 'MP09', 103),
(2017104036, 'Kavita Jain', '1992-06-10', '2017-09-25', '101 Bhawarkuan, Indore', 'Madhya Pradesh', 30000, 'DEFGH5678I', 'MP09', 104),
(2012101037, 'Pankaj Tripathi', '1983-09-22', '2012-05-13', '234 Hazratganj, Lucknow', 'Uttar Pradesh', 61000, 'JKLMN1234J', 'UP32', 101),
(2015102038, 'Nidhi Gupta', '1986-10-05', '2015-01-30', '567 Gomti Nagar, Lucknow', 'Uttar Pradesh', 54000, 'JKLMN5678J', 'UP32', 102),
(2008103039, 'Ravi Yadav', '1977-11-18', '2008-08-22', '890 Alambagh, Lucknow', 'Uttar Pradesh', 74000, 'OPQRS1234K', 'UP32', 103),
(2016104040, 'Suman Singh', '1990-12-25', '2016-07-09', '321 Charbagh, Lucknow', 'Uttar Pradesh', 46000, 'OPQRS5678K', 'UP32', 104),
(2011101041, 'Hardeep Singh', '1981-08-10', '2011-03-05', '123 Patiala Road, Patiala', 'Punjab', 62000, 'RSTUV1234L', 'PB11', 101),
(2014102042, 'Simran Kaur', '1987-07-25', '2014-06-15', '456 Rajpura, Patiala', 'Punjab', 53000, 'RSTUV5678L', 'PB11', 102),
(2009103043, 'Gurpreet Singh', '1980-04-30', '2009-01-17', '789 Nabha, Patiala', 'Punjab', 70000, 'WXYZA1234M', 'PB11', 103),
(2017104044, 'Navjot Kaur', '1992-11-05', '2017-02-12', '101 Sanaur, Patiala', 'Punjab', 46000, 'WXYZA5678M', 'PB11', 104),
(2012101045, 'Amit Kumar', '1985-01-22', '2012-12-10', '234 Laheriasarai, Darbhanga', 'Bihar', 58000, 'BCDEF1234N', 'BR07', 101),
(2015102046, 'Priya Kumari', '1989-05-15', '2015-08-20', '567 Bela, Darbhanga', 'Bihar', 51000, 'BCDEF5678N', 'BR07', 102),
(2011103047, 'Sanjeev Singh', '1983-06-17', '2011-04-28', '890 University Road, Darbhanga', 'Bihar', 65000, 'EFGHI1234O', 'BR07', 103),
(2016104048, 'Ankita Sinha', '1991-03-09', '2016-11-15', '321 Allalpatti, Darbhanga', 'Bihar', 47000, 'EFGHI5678O', 'BR07', 104),
(2011101049, 'Suresh Thakur', '1982-12-12', '2011-10-30', '123 Old Manali, Manali', 'Himachal Pradesh', 60000, 'PQRST1234P', 'HP58', 101),
(2014102050, 'Megha Sharma', '1986-08-19', '2014-09-18', '456 Hadimba Road, Manali', 'Himachal Pradesh', 53000, 'PQRST5678P', 'HP58', 102),
(2008103051, 'Ravi Negi', '1979-07-24', '2008-06-12', '789 Mall Road, Manali', 'Himachal Pradesh', 72000, 'UVWXY1234Q', 'HP58', 103),
(2017104052, 'Poonam Verma', '1990-09-11', '2017-03-05', '101 Solang Valley, Manali', 'Himachal Pradesh', 46000, 'UVWXY5678Q', 'HP58', 104),
(2010101053, 'Anil Rawat', '1981-04-09', '2010-05-28', '234 Laxman Jhula, Rishikesh', 'Uttarakhand', 58000, 'ABCDE1234R', 'UK14', 101),
(2014102054, 'Sarita Joshi', '1988-06-10', '2014-11-22', '567 Tapovan, Rishikesh', 'Uttarakhand', 53000, 'ABCDE5678R', 'UK14', 102),
(2008103055, 'Manish Pant', '1979-08-30', '2008-02-19', '890 Neelkanth Road, Rishikesh', 'Uttarakhand', 71000, 'FGHIJ1234S', 'UK14', 103),
(2011102056, 'Amitav Deka', '1983-11-12', '2011-03-09', '123 Howly Road, Barpeta', 'Assam', 56000, 'ABCDF1234T', 'AS15', 102),
(2014103057, 'Manan Desai', '1987-02-18', '2014-05-15', '456 ST Depot, Bardoli', 'Gujarat', 63000, 'QWERT1234U', 'GJ19', 103),
(2013101058, 'Rajesh Kumar', '1985-08-24', '2013-12-30', '789 Bastar Road, Jagdalpur', 'Chhattisgarh', 59000, 'XYZAB1234V', 'CG17', 101),
(2015104059, 'Subhasis Das', '1986-06-07', '2015-02-12', '101 KIIT Road, Bhubaneswar', 'Odisha', 46000, 'LMNOP1234W', 'OD33', 104);


INSERT INTO Users (Id_Proof, Name, Phone_Number, DOB, Blood_Group, Street, City, State, Username, Password, Branch_ID)
VALUES 
(123456789012, 'Amit Sharma', 9876543210, '1990-08-10', 'O+', '789, Lake View', 'Mumbai', 'Maharashtra', '@amit_sharma', 'Password123', 'MH01'),
(234567890123, 'Neha Singh', 9123456789, '1988-02-15', 'B+', '567, Green Park', 'Delhi', 'Delhi', '@neha_singh', 'SecurePass89', 'DL02'),
(345678901234, 'Raj Mehra', 9765432109, '1992-11-23', 'A+', '90, JP Nagar', 'Bangalore', 'Karnataka', '@raj_mehra', 'Raj12345!', 'KA03'),
(456789012345, 'Priya Desai', 9988776655, '1991-05-20', 'AB+', '123, Anna Nagar', 'Chennai', 'Tamil Nadu', '@priya_d', 'Priya@321', 'TN04'),
(567890123456, 'Ankit Patel', 9876541110, '1987-09-12', 'O-', '345, Ghatkopar', 'Mumbai', 'Maharashtra', '@ankit_p', 'AnkitP@432', 'MH01'),
(678901234567, 'Manisha Ghosh', 9234567890, '1990-12-05', 'B-', '10, Adajan', 'Surat', 'Gujarat', '@manisha_gh', 'Manisha!456', 'GJ05'),
(789012345678, 'Deepak Jain', 9823456789, '1985-04-25', 'A-', '90, SG Highway', 'Ahmedabad', 'Gujarat', '@deepak_j', 'Deepak@789', 'GJ01'),
(890123456789, 'Suresh Reddy', 9345678910, '1989-08-12', 'O+', '123, Hitech City', 'Indore', 'Madhya Pradesh', '@suresh_reddy', 'Suresh$123', 'MP09'),
(901234567890, 'Meera Chauhan', 9123456780, '1993-03-18', 'B+', '456, LBS Road', 'Pune', 'Maharashtra', '@meera_c', 'Meera@321', 'MH01'),
(123456789013, 'Nikhil Arora', 9765432101, '1991-01-14', 'A-', '567, Brigade Road', 'Bangalore', 'Karnataka', '@nikhil_ar', 'Nikhil_321', 'KA03'),
(234567890124, 'Anjali Rana', 9987654321, '1987-07-30', 'AB+', '987, Link Road', 'Delhi', 'Delhi', '@anjali_r', 'Anjali@789', 'DL02'),
(345678901235, 'Yash Malhotra', 9876541234, '1990-09-22', 'O-', '678, MG Road', 'Pune', 'Maharashtra', '@yash_m', 'Yash123@456', 'MH01'),
(456789012346, 'Karan Shetty', 9123456710, '1984-12-18', 'B+', '345, Sector 17', 'Kochi', 'Kerala', '@karan_k', 'Karan@123', 'KL43'),
(567890123467, 'Shruti Iyer', 9988765432, '1985-10-01', 'A+', '109, Old Madras Rd', 'Bangalore', 'Karnataka', '@shruti_i', 'Shruti@432', 'KA03'),
(678901234578, 'Alok Verma', 9234567801, '1986-05-25', 'AB-', '23, Nehru Place', 'Delhi', 'Delhi', '@alok_v', 'Alok123@987', 'DL02'),
(789012345679, 'Rohit Yadav', 9823456781, '1983-08-16', 'B-', '45, Navi Mumbai', 'Mumbai', 'Maharashtra', '@rohit_y', 'Rohit!789', 'MH01'),
(890123456780, 'Sneha Singh', 9345678911, '1989-11-27', 'O+', '123, Vivekananda Rd', 'Lucknow', 'Uttar Pradesh', '@sneha_r', 'Sneha@321', 'UP32'),
(901234567891, 'Vikas Patil', 9123456782, '1992-02-19', 'O+', '98, FC Road', 'Pune', 'Maharashtra', '@vikas_p', 'Vikas@456', 'MH01');


INSERT INTO License_Type (License_Type_ID, License_Type_Name) 
VALUES 
('LL', 'Learner License'),
('NL', 'Normal License'),
('IL', 'International License');


INSERT INTO License (License_ID, Date_of_Issue, EID, Id_Proof, License_Type_ID) 
VALUES 
('MH01 10000000001', '2020-05-15', 2010101001, 123456789012, 'NL'),
('DL02 20000000002', '2019-02-20', 2011101005, 234567890123, 'LL'),
('KA03 30000000003', '2021-07-19', 2007101009, 345678901234, 'NL'),
('TN04 40000000004', '2018-05-23', 2012101013, 456789012345, 'LL'),
('GJ05 50000000005', '2022-09-12', 2013101017, 789012345678, 'NL'),
('GJ01 80000000008', '2017-12-05', 2010101029, 678901234567, 'LL'),
('MH01 10000000006', '2021-08-10', 2010101001, 567890123456, 'IL'),
('DL02 20000000007', '2019-09-12', 2011101005, 890123456789, 'NL'),
('KA03 30000000008', '2020-01-14', 2007101009, 123456789013, 'IL'),
('MH01 10000000009', '2020-03-18', 2010101001, 901234567890, 'LL'),
('UP32 80000000010', '2017-09-25', 2012101037, 890123456780, 'NL'),
('GJ05 50000000011', '2022-10-01', 2013101017, 789012345679, 'IL'),
('TN04 40000000012', '2019-07-30', 2012101013, 234567890124, 'NL'),
('DL02 20000000013', '2021-12-05', 2011101005, 234567890123, 'IL'),
('MH01 10000000014', '2022-05-10', 2010101001, 123456789012, 'NL'),
('MP09 20000012304', '2001-01-11', 2011101033, 890123456789, 'NL');


INSERT INTO LV_Association (License_ID, Vehicle_Type_ID) 
VALUES 
('MH01 10000000001', 'LMV'),
('DL02 20000000002', 'MCWG'),
('KA03 30000000003', 'MCWOG'),
('TN04 40000000004', 'HMV'),
('GJ05 50000000005', 'MCWG'),
('GJ01 80000000008', 'SUV'),
('MH01 10000000006', 'MPV'),
('DL02 20000000007', 'HGMV'),
('KA03 30000000008', 'TRACTOR'),
('MH01 10000000009', 'RICKSHAW'),
('UP32 80000000010', 'HCV'),
('GJ05 50000000011', 'LMV'),
('TN04 40000000012', 'LMV-TT'),
('DL02 20000000013', 'HPMV'),
('MH01 10000000014', 'MGV'),
('MP09 20000012304', 'MPV');


INSERT INTO Permit (Permit_ID, Company_Name, Company_Address, Date_of_Issue, Weight_Limit, EID, Id_Proof) 
VALUES 
('PER123456', 'Logistics Corp', '123, Main St', '2020-12-31', 5.50, 2008103003, 123456789012),
('PER654321', 'Transport Hub', '456, East St', '2019-07-10', 4.20, 2009103007, 234567890123),
('PER987654', 'Global Freight', '789, Market St', '2022-09-25', 6.75, 2012103011, 345678901234),
('PER246810', 'Speed Cargo', '222, Business St', '2017-11-18', 8.00, 2005103015, 456789012345),
('PER135790', 'Quick Logistics', '321, Tower Plaza', '2019-05-16', 7.50, 2008103031, 789012345678),
('PER112233', 'Freight Movers', '566, Windsor Gardens', '2021-08-20', 9.00, 2009103019, 678901234567),
('PER445566', 'Heavy Haulage', '299, Civil Lines', '2018-10-12', 10.00, 2008103003, 901234567890),
('PER778899', 'Trans India', '107, Capitol Building', '2023-01-15', 3.90, 2009103007, 234567890124),
('PER009988', 'Auto Transporters', '909, Downtown', '2021-05-07', 5.50, 2008103003, 345678901235),
('PER776655', 'Fast Freight', '18, Old Town', '2022-11-25', 6.00, 2009103007, 678901234578);


INSERT INTO Vehicle (Chassis_No, Vehicle_Type_ID, Model, Color, Fuel_Type) 
VALUES 
('W3UZZZ8V7HA123456', 'LMV', 'BMW M5 Competetion', 'Black', 'Petrol'),
('A1CD1234567890123', 'LMV', 'Honda City', 'White', 'Petrol'),
('E5GH1234567890456', 'MCWG', 'Yamaha FZ', 'Blue', 'Petrol'),
('I7KL1234567890789', 'LMV-TT', 'Maruti Swift', 'Red', 'Diesel'),
('M3OP1234567890123', 'HMV', 'Tata Truck', 'Yellow', 'Diesel'),
('Q8ST1234567890456', 'MGV', 'Eicher Lorry', 'Green', 'Diesel'),
('U2WX1234567890789', 'HPMV', 'Volvo Bus', 'Silver', 'Diesel'),
('Y9AB1234567890123', 'MPV', 'Toyota Innova', 'Black', 'Petrol'),
('C2EF1234567890456', 'TRACTOR', 'Mahindra Tractor', 'Red', 'Diesel'),
('G6IJ1234567890789', 'MCWOG', 'Honda Activa', 'White', 'Petrol'),
('K1MN1234567890123', 'RICKSHAW', 'Bajaj Auto', 'Yellow', 'Petrol'),
('O9QR1234567890456', 'HTV', 'Ashok Leyland Truck', 'Blue', 'Diesel'),
('S0UV1234567890789', 'HGMV', 'Tata Dumper', 'Orange', 'Diesel'),
('W6YZ1234567890123', 'SUV', 'Ford Endeavour', 'Black', 'Diesel'),
('B2DE1234567890456', 'HCV', 'Mercedes Truck', 'Silver', 'Diesel'),
('F1HI1234567890789', 'MGV', 'Tata Tipper', 'Green', 'Diesel'),
('B1DK3745104629320', 'SUV', 'Tata Nexon', 'Gray', 'Petrol/CNG'),
('A5CD7549826482101', 'MCWOG', 'TVS Jupiter', 'Red', 'Petrol'),
('A5CD7549826482102', 'MCWG', 'Bajaj Vikrant', 'Blue', 'Diesel'),
('A5CD7549826482103', 'MCWOG-TT', 'Vespa', 'Green', 'Electric'),
('A5CD7549826482104', 'MCWG-TT', 'Hero Splendor', 'Black', 'Hybrid'),
('A5CD7549826482105', 'LMV', 'Tata Tigor', 'White', 'Petrol'),
('A5CD7549826482106', 'SUV', 'Tata Harrier', 'Gray', 'Diesel'),
('A5CD7549826482107', 'HMV', 'Ashok Leyland U Truck', 'Red', 'Hybrid'),
('A5CD7549826482108', 'HGMV', 'Tata LPT 3718', 'Blue', 'Diesel'),
('A5CD7549826482109', 'HPMV', 'Volvo 9400 B8R Bus', 'Yellow', 'LPG'),
('A5CD7549826482110', 'MGV', 'Mahindra Furio 12', 'White', 'Diesel'),
('A5CD7549826482111', 'MPV', 'Toyota Innova Crysta', 'Black', 'Petrol'),
('A5CD7549826482112', 'MPV-T', 'Maruti Suzuki Eeco Cargo', 'Red', 'Hybrid'),
('A5CD7549826482113', 'HTV', 'BharatBenz 2823C Tipper', 'Green', 'Diesel'),
('A5CD7549826482114', 'HCV', 'Ashok Leyland 2518 IL', 'Blue', 'Petrol'),
('A5CD7549826482115', 'LMV-TT', 'Tata Yodha Pickup', 'White', 'Hybrid'),
('A5CD7549826482116', 'TPT', 'John Deere 5310 Tractor', 'Yellow', 'Diesel'),
('A5CD7549826482117', 'RICKSHAW', 'Bajaj RE Compact 4S', 'Red', 'Petrol/CNG'),
('A5CD7549826482118', 'TRACTOR', ' Mahindra Arjun 555 DI', 'Green', 'Diesel');





INSERT INTO RC_Book (Registration_No, Chassis_No, EID, Id_Proof, Date_Of_Reg) 
VALUES 
('KA03DE9999', 'W6YZ1234567890123', 2013102010, 345678901234, '2009-09-12'),
('MH01AA1234', 'A1CD1234567890123', 2012102002, 123456789012, '2024-10-01'),
('DL02BB5678', 'E5GH1234567890456', 2014102006, 234567890123, '2024-10-02'),
('KA03CC9101', 'I7KL1234567890789', 2013102010, 345678901234, '2024-10-03'),
('TN04DD2345', 'M3OP1234567890123', 2015102014, 456789012345, '2024-10-04'),
('GJ01EE6789', 'Q8ST1234567890456', 2013102030, 789012345678, '2024-10-05'),
('GJ05FF9101', 'U2WX1234567890789', 2015102018, 678901234567, '2024-10-06'),
('MH01GG1234', 'Y9AB1234567890123', 2012102002, 901234567890, '2024-10-07'),
('MP09HH5678', 'C2EF1234567890456', 2014102006, 890123456789, '2024-10-08'),
('KA03II9101', 'G6IJ1234567890789', 2013102010, 345678901234, '2024-10-09'),
('MH01JJ2345', 'K1MN1234567890123', 2015102014, 567890123456, '2024-10-10'),
('GJ05RA0001', 'W3UZZZ8V7HA123456', 2015102018, 678901234567, '2021-05-10'),
('GJ05AC5001', 'B1DK3745104629320', 2015102018, 678901234567, '2008-03-12'),
('KL43AB0001', 'A5CD7549826482101', 2015102026, 456789012346, '2013-05-17'),
('KL43AB0002', 'A5CD7549826482102', 2015102026, 456789012346, '2011-11-22'),
('KL43AB0003', 'A5CD7549826482103', 2015102026, 456789012346, '2014-07-30'),
('KL43AB0004', 'A5CD7549826482104', 2015102026, 456789012346, '2019-02-10'),
('KL43AB0005', 'A5CD7549826482105', 2015102026, 456789012346, '2020-03-25'),
('KL43AB0006', 'A5CD7549826482106', 2015102026, 456789012346, '2022-06-18'),
('KL43AB0007', 'A5CD7549826482107', 2015102026, 456789012346, '2015-12-05'),
('KL43AB0008', 'A5CD7549826482108', 2015102026, 456789012346, '2021-10-14'),
('KL43AB0009', 'A5CD7549826482109', 2015102026, 456789012346, '2016-04-09'),
('KL43AB0010', 'A5CD7549826482110', 2015102026, 456789012346, '2017-08-21'),
('KL43AB0011', 'A5CD7549826482111', 2015102026, 456789012346, '2023-01-17'),
('KL43AB0012', 'A5CD7549826482112', 2015102026, 456789012346, '2012-09-11'),
('KL43AB0013', 'A5CD7549826482113', 2015102026, 456789012346, '2018-03-29'),
('KL43AB0014', 'A5CD7549826482114', 2015102026, 456789012346, '2010-10-05'),
('KL43AB0015', 'A5CD7549826482115', 2015102026, 456789012346, '2017-07-12'),
('KL43AB0016', 'A5CD7549826482116', 2015102026, 456789012346, '2023-05-03'),
('KL43AB0017', 'A5CD7549826482117', 2015102026, 456789012346, '2010-01-25'),
('KL43AB0018', 'A5CD7549826482118', 2015102026, 456789012346, '2019-09-15');




INSERT INTO Carnet (Carnet_ID, Date_of_Issue, EID, Id_Proof, Chassis_No) 
VALUES 
('C1RN001234', '2020-05-15', 2011104004, 123456789012, 'A1CD1234567890123'),
('C2RN567890', '2022-02-20', 2016104008, 234567890123, 'E5GH1234567890456'),
('C3RN112233', '2019-07-19', 2017104012, 345678901234, 'I7KL1234567890789'),
('C4RN445566', '2021-05-23', 2016104016, 456789012345, 'M3OP1234567890123'),
('C5RN778899', '2018-09-12', 2016104032, 789012345678, 'Q8ST1234567890456'),
('C6RN991122', '2020-12-05', 2017104020, 678901234567, 'U2WX1234567890789');


INSERT INTO Insurance (Policy_ID, Holder_Name, Date_Of_Issue, Tenure, Chassis_No) 
VALUES 
('INS12345-01', 'Amit Sharma', '2024-05-01', 3.00, 'A1CD1234567890123'),
('INS56789-02', 'Neha Singh', '2023-10-10', 2.50, 'E5GH1234567890456'),
('INS11223-03', 'Raj Mehra', '2024-01-05', 4.00, 'I7KL1234567890789'),
('INS44556-04', 'Priya Desai', '2022-07-22', 5.00, 'M3OP1234567890123'),
('INS77889-05', 'Deepak Jain', '2023-03-15', 3.50, 'Q8ST1234567890456'),
('INS99112-06', 'Manisha Ghosh', '2023-09-10', 4.50, 'U2WX1234567890789'),
('INS22334-07', 'Meera Chauhan', '2022-11-25', 2.75, 'Y9AB1234567890123'),
('INS55667-08', 'Suresh Reddy', '2024-06-30', 4.00, 'C2EF1234567890456'),
('INS88990-09', 'Nikhil Arora', '2023-08-14', 3.25, 'G6IJ1234567890789'),
('INS00112-10', 'Ankit Patel', '2022-12-18', 5.00, 'K1MN1234567890123'),
('INS38464-11', 'Manisha Ghosh', '2023-01-15', 2.00, 'W3UZZZ8V7HA123456'),
('INS29452-12','Manisha Ghosh', '2008-03-29', 5.00, 'B1DK3745104629320'),
('INS00933-01', 'Karan Shetty', '2013-05-20', 5.00, 'A5CD7549826482101'),
('INS00933-02', 'Karan Shetty', '2011-11-25', 3.00, 'A5CD7549826482102'),
('INS00933-03', 'Karan Shetty', '2014-07-28', 7.00, 'A5CD7549826482103'),
('INS00933-04', 'Karan Shetty', '2019-02-15', 4.00, 'A5CD7549826482104'),
('INS00933-05', 'Karan Shetty', '2020-03-22', 2.00, 'A5CD7549826482105'),
('INS00933-06', 'Karan Shetty', '2022-06-20', 5.00, 'A5CD7549826482106'),
('INS00933-07', 'Karan Shetty', '2015-12-03', 6.00, 'A5CD7549826482107'),
('INS00933-08', 'Karan Shetty', '2021-10-10', 3.00, 'A5CD7549826482108'),
('INS00933-09', 'Karan Shetty', '2016-04-11', 4.00, 'A5CD7549826482109'),
('INS00933-10', 'Karan Shetty', '2017-08-18', 5.00, 'A5CD7549826482110'),
('INS00933-11', 'Karan Shetty', '2023-01-15', 3.00, 'A5CD7549826482111'),
('INS00933-12', 'Karan Shetty', '2012-09-10', 7.00, 'A5CD7549826482112'),
('INS00933-13', 'Karan Shetty', '2018-03-31', 5.00, 'A5CD7549826482113'),
('INS00933-14', 'Karan Shetty', '2010-10-07', 4.00, 'A5CD7549826482114'),
('INS00933-15', 'Karan Shetty', '2017-07-10', 2.00, 'A5CD7549826482115'),
('INS00933-16', 'Karan Shetty', '2023-05-05', 3.00, 'A5CD7549826482116'),
('INS00933-17', 'Karan Shetty', '2010-01-27', 6.00, 'A5CD7549826482117'),
('INS00933-18', 'Karan Shetty', '2019-09-13', 5.00, 'A5CD7549826482118');

