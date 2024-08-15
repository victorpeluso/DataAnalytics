drop database if exists university_COP4703_1238;

create database university_COP4703_1238;

use university_COP4703_1238;

create table Semester (
  Code char(4) PRIMARY KEY,
  Name varchar(20) NOT NULL,
  Start_Date datetime NOT NULL,
  End_Date datetime NOT NULL
);

create table College(
       CName varchar(100) PRIMARY KEY,
       CPhone varchar(10),
       COffice varchar(10),
       Dean varchar(10) UNIQUE
);

create table Department (
      DCode varchar(20) PRIMARY KEY,
      DName varchar(100) UNIQUE NOT NULL,
      DOffice varchar(10),
      DPhone varchar(10),
      Chair varchar(10) UNIQUE,
      CStartDate datetime,
      College varchar(100) NOT NULL,
      FOREIGN KEY(College) REFERENCES College (CName)
);

create table Instructor(
       Id varchar(10) PRIMARY KEY,
       IName varchar(100) NOT NULL,
       IOffice varchar(10),
       IPhone varchar(10),
       IRank Enum('Adjunct', 'Faculty','Tenure'),
       Department varchar(20) NOT NULL,
       FOREIGN KEY (Department) REFERENCES Department(DCode)
);

ALTER TABLE College ADD CONSTRAINT college_dean_fk  FOREIGN KEY (Dean) 
REFERENCES Instructor(Id);

ALTER TABLE Department ADD CONSTRAINT department_chair_fk  FOREIGN KEY (Chair) 
REFERENCES Instructor(Id);

create table Course(
  CCode varchar(10) primary key,
  CoName varchar(50) not null,
  CoLevel ENUM ('Freshman','Sophomore','Junior','Senior','Grad','PhD') NOT NULL,
  Credits tinyint NOT NULL DEFAULT 0,
  CDesc varchar(250),
  Department varchar(20) NOT NULL,
  FOREIGN KEY (Department) REFERENCES Department(DCode)
);

create table Student (
   Sid varchar(10) primary key,
   FName varchar(50) not null,
   LName varchar(50) not null,
   MName varchar(50),
   Addr varchar(250),
   Phone varchar(10),
   DoB datetime not null,
   Major varchar(100),
   Department varchar(20) not null,
   foreign key (Department) references Department(DCode)
);

create table Section(
      Course varchar(10),
      SectId varchar(10),
      CRoom varchar(10),
      DaysTime varchar(50),
      Semester char(4) not null,
      Instructor varchar(10) not null,
      PRIMARY KEY (Course,SectId),
      FOREIGN KEY (Semester) REFERENCES Semester (Code),
      FOREIGN KEY (Instructor) REFERENCES Instructor (Id),
      FOREIGN KEY (Course) REFERENCES Course (CCode)
);

create table Enrollment(
      Student varchar(10),
      Course varchar(10),
      Section varchar(10),
      Letter_Grade ENUM('A','B','C','D','F'),
      Points float,
      PRIMARY KEY(Student,Course,Section),
      FOREIGN KEY (Student) REFERENCES Student(Sid),
      FOREIGN KEY(Course,Section) REFERENCES Section(Course,SectId)
);