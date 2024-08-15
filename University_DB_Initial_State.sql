use university_COP4703_1238;


/*Inserting Semesters*/
INSERT INTO Semester(`Code`,`Name`,Start_Date,End_Date)VALUES
('1211','Spring 2021','2021-01-05','2021-04-15'),
('1215','Summer 2021','2021-05-02','2021-08-10'),
('1218','Fall 2021','2021-08-22','2021-12-05'),
('1221','Spring 2022','2022-01-04','2022-04-13'),
('1225','Summer 2022','2022-05-01','2022-08-12'),
('1228','Fall 2022','2022-08-20','2022-12-06'),
('1231','Spring 2023','2023-01-08','2023-04-14'),
('1235','Summer 2023','2023-05-07','2023-08-14'),
('1238','Fall 2023','2023-08-24','2023-12-06');

/*Inserting Colleges*/
INSERT INTO `College` (`CName`,`COffice`,`CPhone`) VALUES
('College of Arts, Sciences & Education','CASE-100','3053481111'),
('College of Business','RB-100','3053486666'),
('College OF Engineering & Computing','CASE 354','3053482774'),
('College of Medicine','AHC200','3053480570'),
('College of Law','RDB 1050','3053480888'),
('Communication, Architecture + The Arts','PCA100','3053480999');


/*Inserting Departments*/
INSERT INTO `Department` (`DCode`,`DName`,`DOffice`,`College`) VALUES
('1000234999','Chemistry and Biochemistry','CP-304','College of Arts, Sciences & Education'),
('11122444442','Language Arts and Sociology','DM-200','College of Arts, Sciences & Education'),
('1200237980','Biomedical Sciences','AHC2-400','College of Medicine'),
('1200445332','Earth and Environment','DM-250','College of Arts, Sciences & Education'),
('2335234979','COM Humanities Health and Society','AHC2-330','College of Medicine'),
('3400234963','COB Dept of Mkt and Logistics','RB-353','College of Business'),
('3450234975','COB School of Accounting','RB-200','College of Business'),
('4000234978','School of Computing and Information Sciences','EC-220','College OF Engineering & Computing'),
('4400234834','Civil and Environ Engineering','EC-400','College OF Engineering & Computing'),
('2670001000','Law Dean Admin and Faculty','RDB-2042','College of Law'),
('2600001000','Law Clinical Programs','RDB-2065','College of Law'),
('2920001000','Architecture','PCA-272','Communication, Architecture + The Arts'),
('2990001000','Communication','VH-208','Communication, Architecture + The Arts');

/*Inserting Instructors*/
INSERT INTO `Instructor` (`Id`,`IName`,`IOffice`,`IPhone`,`Department`,`IRank`) VALUES
('1000463','Brenda Bonilla','CP-223','3053486654','1200237980','Tenure'),
('1009224','Evan Eisenberg','CP-223','3053481223','4400234834','Faculty'),
('1009842','Rafael Craftman','CP-223','3053489887','1200237980','Faculty'),
('1108958','Karen Guzman','CP-223','3053483384','1200445332','Adjunct'),
('1203356','Jorge Alvarez','CP-223','3053485674','1200445332','Tenure'),
('1221244','Laura Elliot','CP-223','3053480096','4000234978','Tenure'),
('1453774','Kevin Romero','CP-223','3053480998','2335234979','Faculty'),
('1579323','Sebastian Almeida','CP-223','3053482144','1000234999','Adjunct'),
('2221133','Harry Dan','CP-223','3053486732','3400234963','Faculty'),
('2234556','Ira Barroso','CP-223','3053486674','1200445332','Faculty'),
('2789990','John Capote','CP-223','3053487765','2335234979','Tenure'),
('3300944','Daniel Ferrer','CP-223','3053486754','4000234978','Faculty'),
('3322111','Scarlett Daniels','CP-223','3053482245','3400234963','Tenure'),
('3322469','Israel Elias','CP-223','3053486543','4400234834','Tenure'),
('3333333','Juliet Chavez','CP-223','3053487765','3450234975','Faculty'),
('3394566','Nancy Chandler','CP-223','3053484454','2335234979','Adjunct'),
('1123554','Samantha Cuervo','PCA-123','3053483234','2670001000','Faculty'),
('3345532','Mariam Spenser','RDB-224','3053483234','2600001000','Faculty'),
('2231452','Robert Delasso','RDB-128','3053483234','2600001000','Adjunct'),
('1134212','Jenny Alonso','PCA-123','3053483234','2920001000','Faculty'),
('2365423','Mason Smith','PCA-123','3053483234','2920001000','Faculty'),
('1455353','Randall Lewis','VH-212B','3053486687','2990001000','Faculty'),
('3411556','Anderson Truman','DM-323','3053483114','11122444442','Faculty'),
('2214675','Martha Stuart','DM-443','3053483264','11122444442','Faculty');

/*Update College Deans*/
UPDATE COLLEGE SET Dean = '1579323' WHERE CName = 'College of Arts, Sciences & Education';
UPDATE COLLEGE SET Dean = '1009842' WHERE CName = 'College of Business';
UPDATE COLLEGE SET Dean = '3300944' WHERE CName = 'College OF Engineering & Computing';
UPDATE COLLEGE SET Dean = '1000463' WHERE CName = 'College of Medicine';
UPDATE COLLEGE SET Dean = '2231452' WHERE CName = 'College of Law';
UPDATE COLLEGE SET Dean = '1455353' WHERE CName = 'Communication, Architecture + The Arts';

/*Update Department Chairs*/
UPDATE DEPARTMENT SET Chair = '1579323', CStartDate = '2015-02-01' WHERE DCode = '1000234999';
UPDATE DEPARTMENT SET Chair = '3345532', CStartDate = '2019-05-06' WHERE DCode = '2600001000';
UPDATE DEPARTMENT SET Chair = '1000463', CStartDate = '2020-09-23' WHERE DCode = '1200237980';
UPDATE DEPARTMENT SET Chair = '2789990', CStartDate = '2010-04-01' WHERE DCode = '2335234979';
UPDATE DEPARTMENT SET Chair = '1123554', CStartDate = '2010-04-01' WHERE DCode = '2670001000';
UPDATE DEPARTMENT SET Chair = '1134212', CStartDate = '2010-04-01' WHERE DCode = '2920001000';
UPDATE DEPARTMENT SET Chair = '1455353', CStartDate = '2010-04-01' WHERE DCode = '2990001000';
UPDATE DEPARTMENT SET Chair = '2221133', CStartDate = '2010-04-01' WHERE DCode = '3400234963';
UPDATE DEPARTMENT SET Chair = '3333333', CStartDate = '2010-04-01' WHERE DCode = '3450234975';
UPDATE DEPARTMENT SET Chair = '3300944', CStartDate = '2010-04-01' WHERE DCode = '4000234978';
UPDATE DEPARTMENT SET Chair = '1009224', CStartDate = '2010-04-01' WHERE DCode = '4400234834';
UPDATE DEPARTMENT SET Chair = '1203356', CStartDate = '2010-04-01' WHERE DCode = '1200445332';
UPDATE DEPARTMENT SET Chair = '2214675', CStartDate = '2019-06-01' WHERE DCode = '11122444442';

/*Insert Courses*/
INSERT INTO `COURSE` (`CCode`,`CoName`,`CDesc`,`CoLevel`,`Credits`,`Department`) VALUES
('ACG-4101','Financial Acct I','Basic Financial Accounting','Senior',3,'3450234975'),
('BME-4050L','Biomedical Lab','Lab','Senior',1,'1200237980'),
('CGS-1920','Intro to Computing','Intro to Computing','Freshman',3,'4000234978'),
('CHM-1045','Gen Chemistry I','Generic Chemistry','Freshman',3,'1000234999'),
('EGN-3613','Engineering Economy','Engineering Economy','Junior',1,'4400234834'),
('GLY-3112','Earth Thru Time','History of Earth','Junior',3,'1200445332'),
('HSC-2100','Healthy Lifestyles','Healthy Lifestyles','Sophomore',3,'11122444442'),
('MAR-3023','Intro To Marketing','Introduction to Marketing','Junior',3,'3400234963');

ALTER TABLE Section MODIFY COLUMN DaysTime varchar(50);

/*Insert Sections*/
INSERT INTO Section (SectId,Course,Semester,DaysTime,CRoom,Instructor) VALUES
('U01-11234','CHM-1045','1221','Tu/Th 11:00 AM - 12:15 PM','GC-344','1579323'),
('U01-66555','CHM-1045','1221','Tu/Th 11:00 AM - 12:15 PM','DM-244','1579323'),
('U02-22146','GLY-3112','1218','Mon/Tu/Th 11:00 AM - 12:15 PM','PC-214','1203356'),
('U01C-43354','GLY-3112','1218','Mo/Wed 9:00 AM - 10:15 PM','CASE-344','2234556'),
('U01-12534','BME-4050L','1221','Tu/Th 9:00 AM - 10:15 PM','PH-C115','1000463'),
('U01-33434','BME-4050L','1221','Tu/Th 11:00 AM - 12:15 PM','PH-C320','1000463'),
('U01-88657','HSC-2100','1225','Tu/Th 11:00 AM - 12:15 PM','AHC2-114','2214675'),
('U01A-90876','HSC-2100','1228','Mo/Tu/Wed/Th 10:00 AM - 11:15 AM','AHC1-344','3411556'),
('U02-56432','HSC-2100','1228','Tu/Th 11:00 AM - 12:15 PM','AHC1-344','3411556'),
('U02-43345','ACG-4101','1225','Mon/Wed 11:00 AM - 12:15 PM','RB-245','3333333'),
('U02B-33428','ACG-4101','1228','Tu/Wed/Th 11:00 AM - 12:15 PM','RB-215','3333333'),
('U02-11214','ACG-4101','1231','Tu/Th 11:00 AM - 12:15 PM','RB-115','3333333'),
('U02-29076','MAR-3023','1231','Mon/Wed 11:00 AM - 12:15 PM','RB-245','2234556'),
('U02B-19567','MAR-3023','1231','Tu/Wed/Th 11:00 AM - 12:15 PM','RB-215','2234556'),
('U02-30623','MAR-3023','1231','Tu/Th 11:00 AM - 12:15 PM','RB-115','3322111'),
('U02-53498','EGN-3613','1235','Mon/Wed 11:00 AM - 12:15 PM','CASE-245','1009224'),
('U02C-44986','EGN-3613','1238','Tu/Wed/Th 11:00 AM - 12:15 PM','CASE-215','1009224'),
('U02-30925','EGN-3613','1238','Tu/Th 11:00 AM - 12:15 PM','CASE-115','3322469'),
('U02C-79823','CGS-1920','1238','Tu/Wed/Th 11:00 AM - 12:15 PM','RB-215','1221244'),
('U02-79004','CGS-1920','1238','Tu/Th 11:00 AM - 12:15 PM','RB-115','3300944');

/*Insert Students*/
INSERT INTO STUDENT (Sid,FName,LName,DoB,Addr,Major,Department) VALUES
('9099895','Jackson','Rodriguez','2000-02-13','4400 SW 12 AVE, Miami, FL 33422','Psychology','11122444442'),
('5633432','Jason','Swart','2000-06-13','321 SW 44 AVE, Miami, FL 33422','Computer Science','4000234978'),
('8963452','Martin','Jimenez','2000-01-12','532 SW 87 AVE, Miami, FL 33422','Language Arts','11122444442'),
('8065436','Lauren','Johnson','2001-07-29','632 SW 89 AVE, Miami, FL 33422','Finances','3450234975'),
('0754346','Matthew','Garner','2000-05-30','5632 SW 55 AVE, Miami, FL 33422','General Medicine','1200237980'),
('9353563','Alex','Martinez','2000-07-28','1232 SW  67 AVE, Miami, FL 33422','Information Systems','4000234978'),
('9424566','Eileen','Harrison','2001-06-15','6732 SW 33 AVE, Miami, FL 33422','Information Security','4000234978'),
('8897543','Martha','Elias','2000-04-03','7532 SW 78 AVE, Miami, FL 33422','Accounting','3450234975'),
('4400694','Monica','Dominguez','2000-08-13','1532 SW 4` AVE, Miami, FL 33422','International Business','3450234975'),
('5553323','Daniel','Tompson','2001-03-23','320 SW 22 AVE, Miami, FL 33422','Psychology','11122444442'),
('9986445','Mary','Louis','2001-10-22','122 SW 12 AVE, Miami, FL 33422','Engineering Management','4400234834'),
('0998908','Freddy','Reford','2001-04-11','753 SW 23 AVE, Miami, FL 33422','Psychology','11122444442'),
('9995643','Robert','Fulton','2000-02-08','4135 SW 56 AVE, Miami, FL 33422','Computer Science','4000234978'),
('9877876','Owen','Smullen','2001-02-28','1221 SW 12 AVE, Miami, FL 33422','Educational Sciences','11122444442'),
('8874231','Anna','Suarez','2000-02-10','145 SW 35 AVE, Miami, FL 33422','Computer Science','4000234978'),
('8864386','Morgan','Freeman','2001-03-19','5000 NW 14 AVE, Miami, FL 33422','Information Systems','4000234978'),
('6670975','Jessica','Smith','2000-01-22','4432 SW 43 AVE, Miami, FL 33422','Information Systems','4000234978'),
('8643456','Orlando','Gonzalez','2000-09-11','4432 SW 43 AVE, Miami, FL 33422','Chemistry','1200237980'),
('9864534','Gabriela','Swift','2000-03-18','4432 SW 43 AVE, Miami, FL 33422','Biology','1200237980'),
('5567979','Stephanie','Rotella','2002-02-06','4432 SW 43 AVE, Miami, FL 33422','Economics','3450234975'),
('2335278','Karla','Kirgan','2000-10-13','4432 SW 43 AVE, Miami, FL 33422','Economics','3450234975'),
('9876775','Kate','Homes','2001-02-25','4432 SW 43 AVE, Miami, FL 33422','Finances','3450234975'),
('8875453','Jonathan','Wilson','2001-04-17','4432 SW 43 AVE, Miami, FL 33422','Mechanical Engineering','4400234834'),
('7780875','Fernando','Rodriguez','2000-12-23','4432 SW 43 AVE, Miami, FL 33422','Construction Management','4400234834'),
('5534678','Alex','Lau','2003-05-01','4432 SW 43 AVE, Miami, FL 33422','Diatetics and Nutrition','11122444442'),
('6689445','Nadia','Garcia','2000-08-23','4432 SW 43 AVE, Miami, FL 33422','Nursing','2335234979'),
('9704235','Louis','Campbell','2002-06-15','4432 SW 43 AVE, Miami, FL 33422','Nursing','2335234979'),
('2345789','Amanda','Ramirez','2001-12-10','4432 SW 43 AVE, Miami, FL 33422','Sociology/Anthropology','11122444442');


/*Insert Enrollment*/
INSERT INTO ENROLLMENT(Student,Course,Section,Letter_Grade,Points) VALUES
('8897543','ACG-4101','U02-43345','B',85),
('8643456','ACG-4101','U02-43345','B',83),
('9876775','ACG-4101','U02-43345','C',75),
('9704235','ACG-4101','U02-43345','C',76),
('2345789','ACG-4101','U02-43345','B',82),
('9995643','ACG-4101','U02B-33428','A',99),
('5567979','ACG-4101','U02B-33428','A',92),
('9099895','ACG-4101','U02B-33428','B',84),
('4400694','ACG-4101','U02B-33428','B',86),
('8065436','MAR-3023','U02-29076','A',97),
('8897543','MAR-3023','U02-29076','A',95),
('2345789','MAR-3023','U02-29076','A',93),
('4400694','MAR-3023','U02-29076','B',86),
('8963452','MAR-3023','U02-29076','B',88),
('8643456','MAR-3023','U02B-19567','B',80),
('5567979','MAR-3023','U02B-19567','C',70),
('9876775','MAR-3023','U02B-19567','C',75),
('9704235','MAR-3023','U02-30623','A',92),
('9995643','MAR-3023','U02-30623','B',81),
('9424566','MAR-3023','U02-30623','B',83),
('5633432','EGN-3613','U02-53498','C',73),
('9353563','EGN-3613','U02-53498','D',65),
('9424566','EGN-3613','U02-53498','D',68),
('9995643','EGN-3613','U02-53498','A',90),
('8874231','EGN-3613','U02-53498','B',83),
('8875453','EGN-3613','U02-53498','B',85),
('7780875','EGN-3613','U02-53498','B',87),
('9877876','EGN-3613','U02-30925','B',81),
('9424566','EGN-3613','U02-30925','C',72),
('5633432','CGS-1920','U02C-79823','C',74),
('8065436','CGS-1920','U02C-79823','C',77),
('9353563','CGS-1920','U02C-79823','A',99),
('8897543','CGS-1920','U02C-79823','A',100),
('9995643','CGS-1920','U02-79004','B',84),
('9877876','CGS-1920','U02-79004','B',83),
('8874231','CGS-1920','U02-79004','B',87),
('8875453','CGS-1920','U02-79004','C',74),
('7780875','CGS-1920','U02-79004','F',53),
('9704235','CGS-1920','U02-79004','F',51),
('4400694','CGS-1920','U02-79004','D',68),
('9424566','CGS-1920','U02-79004','A',100),
('8963452','CHM-1045','U01-11234','A',99),
('8065436','CHM-1045','U01-11234','A',97),
('5553323','CHM-1045','U01-66555','B',86),
('9864534','CHM-1045','U01-66555','B',84),
('9704235','CHM-1045','U01-66555','C',76),
('9099895','GLY-3112','U02-22146','A',90),
('8065436','GLY-3112','U02-22146','A',93),
('5553323','GLY-3112','U02-22146','B',85),
('9877876','GLY-3112','U02-22146','B',87),
('5534678','GLY-3112','U02-22146','B',88),
('8963452','GLY-3112','U01C-43354','B',84),
('9704235','GLY-3112','U01C-43354','C',78),
('2345789','GLY-3112','U01C-43354','D',67),
('9099895','BME-4050L','U01-12534','A',98),
('5553323','BME-4050L','U01-12534','B',84),
('9864534','BME-4050L','U01-12534','C',71),
('6689445','BME-4050L','U01-33434','C',72),
('8643456','BME-4050L','U01-33434','F',50),
('5633432','HSC-2100','U01-88657','A',96),
('9877876','HSC-2100','U01-88657','A',99),
('6689445','HSC-2100','U01-88657','A',100),
('8643456','HSC-2100','U01-88657','B',86),
('9704235','HSC-2100','U01-88657','B',88),
('2345789','HSC-2100','U01-88657','C',77),
('8875453','HSC-2100','U01-88657','C',78),
('8963452','HSC-2100','U01A-90876','A',96),
('9864534','HSC-2100','U01A-90876','B',84),
('5534678','HSC-2100','U01A-90876','B',86),
('7780875','HSC-2100','U01A-90876','B',83),
('9099895','HSC-2100','U02-56432','D',66),
('8065436','HSC-2100','U02-56432','C',75),
('8875453','HSC-2100','U02-56432','C',74),
('9424566','HSC-2100','U02-56432','B',87),
('9353563','HSC-2100','U02-56432','B',84),
('4400694','HSC-2100','U02-56432','A',97),
('8065436','ACG-4101','U02-43345','A',99),
('9353563','ACG-4101','U02-43345','A',100);