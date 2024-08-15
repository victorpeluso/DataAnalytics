use university_COP4703_1238;

select * from Semester;

/* select statement to retrieve rows where column DaysTime contains characters 'Tu' for Tuesday classes*/
select * from Section where DaysTime like '%Tu%';

/* retrieves the list of names of students who are enrolled in a class for the Spring 2023 semester */
select distinct FName,LName,Name from Enrollment en, Student st, Semester sm, Section s
where st.Sid = en.Student and en.Section = s.SectId
and s.Semester = sm.Code
and sm.Name = 'Spring 2023'
order by FName,LName desc;

/* retrieves list of students enrolled in Fall Semester '1238', but not in Spring Semester '1231' */
select FName, LName from Student where Sid in
(select Student from Enrollment e, Section s 
where e.Section = s.SectId
and e.Course = s.Course
and Semester = '1238') and
sid not in
(select Student from Enrollment e, Section s 
where e.Section = s.SectId
and e.Course = s.Course
and Semester = '1231');

/* retrieve list of instructors who currently do not have a section assigned to them */
select Id,IName as Instructor_Name from Instructor where Id not in
(select distinct Instructor from Section);


/*   JOINS    */


/* retrieves information of all students who are currently enrolled in a class using an inner join to match
   existing values in each table */
select distinct s.* from Student s join Enrollment e on s.Sid = e.Student;

/* retrieves names of instructors who are also the deans of their colleges */
select distinct i.IName as Instructor_Name, c.CName as College_Name 
from College c right join Instructor i on c.Dean = i.Id
where CName is NOT NULL;


/*   UPDATE   */


/* updates the grades in enrollment to all be null */
update Enrollment set Enrollment.Letter_Grade = null;
select Letter_Grade from Enrollment; /* test code */

/* updates the letter grades in enrollment to all be A if points is >90 */
update Enrollment
set Enrollment.Letter_Grade = 'A' 
where Enrollment.Points > 90;
select Letter_Grade from Enrollment; /* test code */


/*   COUNT, MAX, MIN, AVERAGE   */


/* retrieves the overall number of instructors on campus */
select count(*) as Number_Instructors from Instructor;

/* retrieves the highest, lowest and average grades in all classes */
select MAX(Points), MIN(Points), AVG(Points) from Enrollment;

/* filters previous statement to only include the grades of students enrolled in the Fall 2023 semester */
select MAX(Points), MIN(Points), AVG(Points) from Enrollment e 
inner join Section s on e.Section = s.SectId 
inner join Semester sm on s.Semester = sm.Code
where sm.Name = 'Fall 2023';  /* filter */


/*   GROUP BY   */


/* returns the number of students enrolled in each section */
select Section, count(*) as Enrolled_Students from Enrollment 
group by Section;

/* returns the students enrolled in more than two classes, and how many classes each student is enrolled in */
select Student,FName,LName,count(*) as Enrolled_Classes from Enrollment e
join Student s on e.Student = s.Sid 
group by Student
having count(*) > 2;

/* returns how many instructors are teaching in a department */
select Department,DName as Department_Name,count(*) as Number_of_Instructors
from Instructor i join Department d on i.Department = d.DCode
group by Department;

/* returns how many classes are available for each course */
select Course,count(*) as Number_of_Courses from Section group by Course;


/*   ORDER BY   */


/* retrieves departments teaching a course in a semester, ordered by semester */
select DName, Semester from Department d, Course c, Section s
where d.DCode = c.Department
and c.CCode = s.Course
order by s.Semester;

/* retrieves a list professors, what colleges they teach for and which departments they belong to, ordered by rank */
select CName, IName, IRank, DName from College c, Instructor i, Department d
where i.Id = c.Dean
and c.CName = d.College
order by IRank;


/*   VIEWS   */


/* creates a view which lists students currently enrolled in a section 
   as well as how many sections each student is enrolled in */
create view Student_Enrollment as
select Student as Student_Id,FName as First_Name,LName as Last_Name,count(Section) as Enrolled_Sections
from Enrollment enr join Student s on enr.Student = s.Sid
group by Student;

select * from Student_Enrollment;


/*   PROCEDURES   */


/* creates a function that passes semester as an argument and retrieves the sections 
   which were taught that semester and the number of enrolled students */ 
DELIMITER $$
create procedure Semester_Catalog (IN semester varchar(20))
BEGIN

select enr.Section,enr.Course,count(*) as Enrolled_Students 
from Enrollment enr join Section sec on enr.Section = sec.SectId join Semester sm on
sec.Semester = sm.Code where sm.Name = semester
group by enr.Section,enr.Course;


END$$
DELIMITER ;

call Semester_Catalog('Spring 2023'); /* test code */

/* create a function to calculate grades of students in a section */
DELIMITER $$
CREATE PROCEDURE Calculate_Grades ( IN course_id varchar(10) )
BEGIN

declare letter_grade char;
declare grade float;
declare stud varchar(10);
declare sect varchar(50);

declare finished INTEGER DEFAULT 0;

/* temporary memory storage */
declare students_cursor cursor for
SELECT enr.Student, enr.Section, enr.Points  from ENROLLMENT enr inner join SECTION s on enr.Section = s.SectId WHERE enr.Course = course_id;

/* handles the situation when cursor could not find any row. 
   it also handles the situation when the cursor reaches the end of the row */       
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
       
START TRANSACTION;
  OPEN students_cursor;
        std_loop : LOOP
 	FETCH students_cursor INTO stud, sect, grade;
             IF finished = 1 THEN 
		LEAVE std_loop;
	END IF;
        
            IF ( grade >= 90 ) THEN
                  SET letter_grade = 'A';
             ELSEIF (grade >= 80) THEN
                  SET letter_grade = 'B';
	         ELSEIF (grade >= 70) THEN
                  SET letter_grade = 'C';
            ELSEIF (grade >= 60) THEN
                  SET letter_grade = 'D';
             ELSE
                  SET letter_grade = 'F';
	   END IF;
            
UPDATE ENROLLMENT SET Letter_Grade = letter_grade 
WHERE Student = stud and Section = sect;
            
	     END LOOP std_loop;
	CLOSE students_cursor;	
COMMIT;

SELECT enr.*  from ENROLLMENT enr inner join SECTION s on enr.Section = s.SectId WHERE enr.Course = course_id; 
END$$
DELIMITER ;

/* test code */
update Enrollment set Letter_Grade = NULL;

select * from Enrollment;

call Calculate_Grades ('GLY-3112');
/* end test code */


/*   TRIGGERS   */


/* creates a function which triggers when the user attempts to update a score */
DELIMITER $$
create trigger update_validate_points BEFORE UPDATE ON Enrollment
FOR EACH ROW 
BEGIN
   IF (NEW.Points <0 OR NEW.Points > 100 )  THEN
    signal sqlstate '45000' set message_text = 'Points must be between 0 and 100';
   END IF;
END$$
DELIMITER ;


/* creates a function which triggers when the user attempts to insert a new score */
DELIMITER $$
create trigger insert_validate_points BEFORE INSERT ON Enrollment
FOR EACH ROW 
BEGIN
   IF (NEW.Points <0 OR NEW.Points > 100 )  THEN
    signal sqlstate '45000' set message_text = 'Points must be between 0 and 100';
   END IF;
END$$
DELIMITER ;

/* test code */
select * from Enrollment where Student = '2345789' and Section = 'U02-43345';

update enrollment set Points = 100 where Student = '2345789' and Section = 'U02-43345';
/* end test code */


/* begin */
/* adds new column to Department table */
alter table Department add column Employees smallint default 0;

/* updates department table to the number of employees in each department */
UPDATE Department d INNER JOIN (Select Department,COUNT(Id) as Empl_No FROM INSTRUCTOR GROUP BY Department) i 
ON d.DCode = i.Department  SET d.Employees = i.Empl_No;

/* creates a trigger to update the number of employees in a department when a new employee is added */
CREATE TRIGGER add_employee AFTER INSERT ON INSTRUCTOR
FOR EACH ROW 
UPDATE DEPARTMENT SET Employees = Employees + 1 WHERE DCode = NEW.Department;


/* test code */
select * from Department where DCode = '1000234999';

select * from Department;

INSERT INTO INSTRUCTOR
(`Id`,`IName`,`IOffice`,`IRank`,`Department`) VALUES
('4433236','Carl Hudson','DM-433','Faculty','1000234999');
/* end test code */

/* creates a trigger to update the number of employees if an employee switches departments */
DELIMITER $$
CREATE TRIGGER update_employee AFTER UPDATE ON INSTRUCTOR
FOR EACH ROW 
BEGIN	
      IF NEW.Department !=  OLD.Department THEN
      
		UPDATE DEPARTMENT SET Employees = Employees - 1 WHERE DCode = OLD.Department;
        
		UPDATE DEPARTMENT SET Employees = Employees+ 1 WHERE DCode = NEW.Department;
               
       END IF;
END; $$ 
DELIMITER ;

/* test code */
select * from Department where DCode = '1000234999';

select * from Department where DCode = '11122444442';

UPDATE INSTRUCTOR SET  Department  = '11122444442' WHERE Id = '4433236';
/* end test code */

/* creates a trigger to update the number of employees in a department if they are removed from instructor */
CREATE TRIGGER remove_employee  AFTER DELETE ON INSTRUCTOR
FOR EACH ROW 
UPDATE DEPARTMENT set  Employees = Employees - 1 WHERE DCode = OLD.Department;

/* test code */
delete from Instructor where Id = '4433236';

select * from Department where DCode = '11122444442';
/* end test code */
/* end */

/* creates a trigger if instructor is already a chair */
DELIMITER $$
CREATE TRIGGER check_dean_update BEFORE UPDATE ON COLLEGE
FOR EACH ROW 
BEGIN	
        IF  EXISTS (SELECT * FROM DEPARTMENT WHERE Chair = NEW.Dean) THEN
               signal sqlstate '45000' set message_text = 'Instructor is a chair of department';
       END IF;
       
END; $$
DELIMITER ;

/* test code */
select * from Department ;

UPDATE COLLEGE SET Dean = '1009224' WHERE CName = 'College of Medicine';
/* end test code */


/* creates a trigger if instructor is already a chair */
DELIMITER $$
CREATE TRIGGER check_chair_update BEFORE UPDATE ON DEPARTMENT
FOR EACH ROW 
BEGIN	
        IF  EXISTS (SELECT * FROM COLLEGE WHERE Dean = NEW.Chair) THEN
               signal sqlstate '45000' set message_text = 'Instructor is a dean of college';
       END IF;
       
END; $$
DELIMITER ;

/* test code */
select Dean from College;
 
update Department set Chair = '1455353' where DCode = '11122444442';
/* end test code */