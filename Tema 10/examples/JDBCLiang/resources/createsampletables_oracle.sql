-- https://github.com/aJetHorn/Intro-to-Java-Programming-9E/tree/master/Supplements/Database%20Supplements

-- Student information database tables

-- drop table Enrollment cascade constraints;
-- drop table Student cascade constraints;
-- drop table Subject cascade constraints;
-- drop table Department;
-- drop table TaughtBy;
-- drop table Course;
-- drop table College;
-- drop table Faculty;

-- Table Person for chapter 35: CopyFileToTable.java
create table Person (
  firstName varchar2(20),
  mi char(1),
  lastName varchar2(20)
);

-- Table StateCapital for chatper 35: ScrollUpdateResultSet.java
create table StateCapital (
  state varchar(20),
  capital varchar(20)
);

insert into StateCapital values (
  'Georgia', 'Atlanta');
insert into StateCapital values (
  'Texas', 'Austin');
insert into StateCapital values (
  'Indiana', 'Indianapolis');
insert into StateCapital values (
  'Illlinois', 'Springfield');
insert into StateCapital values (
  'California', 'Sacramento');

create table Department (
  deptId char(4), 
  name varchar2(25), 
  chairId varchar2(9), 
  collegeId varchar2(4), 
  constraint pkDepartment primary key (deptId));

create table Enrollment (
  ssn char(9) not null, 
  courseId char(5) not null,
  dateRegistered date,
  grade char(1),
  constraint pkEnrollment primary key (ssn, courseId));

create table TaughtBy (
  courseId char(5), 
  ssn char(9));

create table Faculty(
  ssn char(9), 
  firstName varchar2(25), 
  mi char(1), 
  lastName varchar(25), 
  phone char(10),
  email varchar2(50), 
  office varchar2(15), 
  startTime date, 
  rank varchar2(20), 
  salary number(10, 2), 
  deptId char(4),
  constraint pkFaculty primary key (ssn));

create table Subject (
  subjectId char(4), 
  name varchar2(25) unique, 
  startTime date, 
  deptId char(4), 
  constraint pkSubject primary key (subjectId));

create table Course(
  courseId char(5),
  subjectId char(4) not null, 
  courseNumber number(4), 
  title varchar2(50) not null, 
  numOfCredits number(1) 
    constraint ckNumOfCredits check (numOfCredits >= 1),
  constraint pkCourse primary key (courseId),
  constraint fkSubjectId foreign key (subjectId) 
    references Subject(subjectId));

create table Student (
  ssn char(9) constraint pkStudent primary key, 
  firstName varchar2(25), 
  mi char(1), 
  lastName varchar2(25), 
  phone char(11), 
  birthDate date, 
  street varchar2(100), 
  zipCode char(5),
  deptId char(4), 
  constraint fkDeptId foreign key (deptId) 
    references Department(deptId));

create table College(
  collegeId varchar2(4) not null,
  name varchar(25) not null, 
  since date, 
  deanId char(9),
  constraint pkCollege primary key (collegeId),
  constraint fkDeanId foreign key (deanId) 
    references Faculty(ssn));

insert into Department values (
  'CS', 'Computer Science', '111221115', 'SC');
insert into Department values (
  'MATH', 'Mathematics', '111221116', 'SC');
insert into Department values (
  'CHEM', 'Chemistry', '111225555', 'SC');
insert into Department values (
  'EDUC', 'Education', '333114444', 'EDUC');
insert into Department values (
  'ACCT', 'Accounting', '333115555', 'BUSS');
insert into Department values (
  'BIOL', 'Biology', '333116666', 'SC');

-- insert into Department values ( 'BIOL', 'Biology', '111225555', 'SC');

insert into Enrollment values (
  '444111110', '11111', sysdate, 'A');
--In MS Access, replace sysdate by date()
insert into Enrollment values (
  '444111110', '11112', sysdate, 'B');
insert into Enrollment values (
  '444111110', '11113', sysdate, 'C');
insert into Enrollment values (
  '444111111', '11111', sysdate, 'D');
insert into Enrollment values (
  '444111111', '11112', sysdate, 'F');
insert into Enrollment values (
  '444111111', '11113', sysdate, 'A');
insert into Enrollment values (
  '444111112', '11114', sysdate, 'B');
insert into Enrollment values (
  '444111112', '11115', sysdate, 'C');
insert into Enrollment values (
  '444111112', '11116', sysdate, null);
insert into Enrollment values (
  '444111113', '11111', sysdate, null);
insert into Enrollment values (
  '444111113', '11113', sysdate, null);
insert into Enrollment values (
  '444111114', '11115', sysdate, null);
insert into Enrollment values (
  '444111115', '11115', sysdate, null);
insert into Enrollment values (
  '444111115', '11116', sysdate, null);
insert into Enrollment values (
  '444111116', '11111', sysdate, null);
insert into Enrollment values (
  '444111117', '11111', sysdate, null);
insert into Enrollment values (
  '444111118', '11111', sysdate, null);
insert into Enrollment values (
  '444111118', '11112', sysdate, null);
insert into Enrollment values (
  '444111118', '11113', sysdate, null);

insert into TaughtBy values (
  '11111', '111221111');
insert into TaughtBy values (
  '11112', '111221111');
insert into TaughtBy values (
  '11113', '111221111');
insert into TaughtBy values (
  '11114', '111221115');
insert into TaughtBy values (
  '11115', '111221110');
insert into TaughtBy values (
  '11116', '111221115');
insert into TaughtBy values (
  '11117', '111221116');
insert into TaughtBy values (
  '11118', '111221112');

insert into Subject values (
  'CSCI', 'Computer Science', '1-AUG-1980', 'CS');
insert into Subject values (
  'ITEC', 'Information Technology', '1-JAN-2002', 'CS');
insert into Subject values (
  'MATH', 'Mathematical Science', '1-AUG-1935', 'MATH');
insert into Subject values (
  'STAT', 'Statistics', '1-AUG-1980', 'MATH');
insert into Subject values (
  'EDUC', 'Education', '1-AUG-1980', 'EDUC');

insert into Faculty values (
  111221110, 'Patty', 'R', 'Smith', '9129215555',
  'patty@yahoo.com', 'SC129', '11-OCT-76', 
  'Full Professor', 60000, 'MATH');
insert into Faculty values ( 
  111221111, 'George', 'P', 'Franklin', '9129212525', 
  'george@yahoo.com', 'SC130', '12-OCT-86', 
  'Associate Professor', 65000, 'CS');
insert into Faculty values ( 
  111221112, 'Jean', 'D', 'Yao', '9129215556', 
  'jean@yahoo.com', 'SC131', '13-AUG-76',
  'Full Professor', 65000, 'MATH');
insert into Faculty values ( 
  '111221113', 'Frank', 'E', 'Goldman', '9129215557',
  'frank@yahoo.com', 'SC132', '14-JAN-96', 
  'Assistant Professor', 60000, 'BUSS');
insert into Faculty values ( 
  '111221114', 'Steve', 'T', 'Templeton', '9129215558',
  'steve@yahoo.com', 'UH132', '01-JAN-98',
  'Assistant Professor', 60000, 'BUSS');
insert into Faculty values ( 
  '111221115', 'Alex', 'T', 'Bedat', '9129215559', 
  'alex@yahoo.com', 'SC133', '01-JAN-00', 
  'Full Professor', 95000, 'CS');
insert into Faculty values ( 
  '111221116', 'Judy', 'T', 'Woo', '9129215560', 
  'judy@yahoo.com', 'SC133', '01-JAN-00', 
  'Full Professor', 55000, 'MATH');
insert into Faculty values ( 
  '111221117', 'Joe', 'R', 'Chang', '9129215561', 
  'joe@yahoo.com', 'ED133', '01-JAN-00', 
  'Full Professor', 55000, 'EDUC');
insert into Faculty values ( 
  '111221118', 'Francis', 'R', 'Chin', '9129215562', 
  'joe@yahoo.com', 'ED133', '01-JAN-89', 
  'Full Professor', 75000, 'BIOL');
insert into Faculty values ( 
  '111221119', 'Ray', 'R', 'Smith', '9129215563', 
  'ray@yahoo.com', 'SC133', '01-JAN-94', 
  'Full Professor', 85000, 'CHEM');

insert into Student values (
  '444111110', 'Jacob', 'R', 'Smith', null,
  '9-APR-1985', '99 Kingston Street', '31435', 'BIOL');
insert into Student values (
  '444111111', 'John', 'K', 'Stevenson', '9129219434',
  null, '100 Main Street', '31411', 'BIOL');
insert into Student values (
  '444111112', 'George', 'R', 'Heintz', '9129213454',
  '10-OCT-1974', '1200 Abercorn Street', '31419', 'CS');
insert into Student values (
  '444111113', 'Frank', 'E', 'Jones', '9125919434',
  '9-SEP-1970', '100 Main Street', '31411', 'BIOL');
insert into Student values (
  '444111114', 'Jean', 'K', 'Smith', '9129219434',
  '9-FEB-1970', '100 Main Street', '31411', 'CHEM');
insert into Student values (
  '444111115', 'Josh', 'R', 'Woo', '7075989434',
  '9-FEB-1970', '555 Franklin Street', '31411', 'CHEM');
insert into Student values (
  '444111116', 'Josh', 'R', 'Smith', '9129219434',
  '9-FEB-1973', '100 Main Street', '31411', 'BIOL');
insert into Student values (
  '444111117', 'Joy', 'P', 'Kennedy', '9129229434',
  '19-MAR-1974', '103 Bay Street', '31412', 'CS');
insert into Student values (
  '444111118', 'Toni', 'R', 'Peterson', '9129229434',
  '29-APR-1964', '103 Bay Street', '31412', 'MATH');
insert into Student values (
  '444111119', 'Patrick', 'R', 'Stoneman', null,
  '29-APR-1969', '101 Washington Street', '31435', 'MATH');
insert into Student values (
  '444111120', 'Rick', 'R', 'Carter', null,
  '9-APR-1986', '19 West Ford Street', '31411', 'BIOL');

insert into Course values (
  '11111', 'CSCI', '1301', 'Intro to Java I', 4);
insert into Course values (
  '11112', 'CSCI', '1302', 'Intro to Java II', 3);
insert into Course values (
  '11113', 'CSCI', '4720', 'Database Systems', 3);
insert into Course values (
  '11114', 'CSCI', '4750', 'Rapid Java Application', 3);
insert into Course values (
  '11115', 'MATH', '2750', 'Calculus I', 3);
insert into Course values (
  '11116', 'MATH', '3750', 'Calculus II', 3);
insert into Course values (
  '11117', 'EDUC', '1111', 'Reading', 3);
insert into Course values (
  '11118', 'ITEC', '1344', 'Database Administration', 3);

insert into College values ( 
  'SC', 'Science', '01-JAN-94','111221110');
insert into College values ( 
  'NURS', 'Nursing', '01-JAN-94',null);
insert into College values ( 
  'EDUC', 'Education', '01-JAN-94', '111221117');
insert into College values ( 
  'BUSS', 'Business', '01-JAN-94', '111221114');

-- For exercise 34.7 in intro6e
-- drop table csci4990;
-- drop table csci1301;
-- drop table csci1302;
-- drop table csci3720;

create table csci4990 (
  ssn char(11), 
  name varchar2(25), 
  score number);

insert into csci4990 values ( 
  '111-22-3333', 'John F Smith', 85.4);

create table csci1301 (
  ssn char(11), 
  name varchar2(25), 
  score number);

insert into csci1301 values ( 
  '111-22-3333', 'John F Smith', 75.4);
insert into csci1301 values ( 
  '111-22-4444', 'Corey Stack', 45.4);
insert into csci1301 values ( 
  '111-22-5555', 'Jane Smith', 45.9);
insert into csci1301 values ( 
  '111-22-6666', 'Jean White', 85.9);

create table csci1302 (
  ssn char(11), 
  name varchar2(25), 
  score number);

insert into csci1302 values ( 
  '111-22-3333', 'John F Smith', 55.4);
insert into csci1302 values ( 
  '111-22-4444', 'Corey Stack', 95.4);
insert into csci1302 values ( 
  '111-22-5555', 'Jane Smith', 75.0);

create table csci3720 (
  ssn char(11), 
  name varchar2(25), 
  score number);

insert into csci3720 values ( 
  '111-22-3333', 'John F Smith', 85.4);
insert into csci3720 values ( 
  '111-22-4444', 'Corey Stack', 75.4);
insert into csci3720 values ( 
  '111-22-5555', 'Jane Smith', 95.0);

-- drop table Account;

create table Account (
  username varchar(20), 
  password varchar2(25), 
  name varchar(20));

insert into Account values ( 
  'javaman', 'namavaj', 'John F. Smith');

-- For the example in ch34 in intro6e
-- drop table Address;

create table Address (  
  firstname varchar(25),
  mi char(1),
  lastname varchar(25),
  street varchar(40),
  city varchar(20),
  state varchar(2),
  zip varchar(5),
  telephone varchar(10),
  email varchar(30)
);

-- drop table Country;

create table Country(name varchar(30), flag blob, 
  description varchar(255));

-- drop table Student1;

create table Student1 (  
  username varchar(50) not null, 
  password varchar(50) not null,
  fullname varchar(200) not null,
  constraint pkStudent1 primary key (username)
);

insert into Student1 values ('abc1', 'abc', 'John Smith');
insert into Student1 values ('abc2', 'abc', 'Peter Smith');
insert into Student1 values ('abc3', 'abc', 'Jane Paul');

-- drop table Student2;

create table Student2 (  
  username varchar(50) not null, 
  password varchar(50) not null,
  firstname varchar(100),
  lastname varchar(100),
  constraint pkStudent2 primary key (username)
);

-- https://github.com/mybatis/migrations/issues/49
-- @DELIMITER /

create or replace function studentFound
(first varchar2, last varchar2)
-- Do not name firstName and lastName.
return number is
  numberOfSelectedRows number := 0;
begin
  select count(*) into numberOfSelectedRows
  from Student
  where Student.firstName = first and
    Student.lastName = last;
  return numberOfSelectedRows;
end studentFound;
/

-- @DELIMITER ;

commit;
