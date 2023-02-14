--Assignment-1
create table customer_master
(
CUSTOMER_NUMBER int primary key,
FIRSTNAME varchar(20),
middlename varchar(50),
lastname varchar(40),
CUSTOMER_CITY varchar(10),
CUSTOMER_CONTACT_NO varchar(15) not null unique,
occupation varchar(30),
CUSTOMER_DATE_OF_BIRTH DATE)
set DATEFORMAT dmy;
select * from customer_master
insert into customer_master(CUSTOMER_NUMBER,FIRSTNAME,middlename,lastname,CUSTOMER_CITY,CUSTOMER_CONTACT_NO,occupation,CUSTOMER_DATE_OF_BIRTH)
values(1001,'Ramesh','Chandra','Sharma','Hyd',9678954321,'Inspector','09.03.2001'),
(1002,'Tetala','Vineela','Reddy','Rjy',9876512340,'SI','02.12.2001'),
(1003,'Paidi','Sobha','Rani','Mp',6879057684,'Doctor','11.07.2001'),
(1004,'Thatisetti','NULL','Pallavi','Hyd',6241345609,'Student','08.06.2001'),
(1005,'Lanka','Vineela','NULL','Rjy',9848678901,'Student','14.03.2002'),
(1006,'Suresh','Rao','Majji','Vskp',9890847654,'Service','15.04.2002')

--Display No.of customers belongs Each City
select * from customer_master
select CUSTOMER_CITY,COUNT(CUSTOMER_NUMBER) from customer_master group by CUSTOMER_CITY

--Display all city Names from Customer tables without any duplicate value
select * from customer_master
select CUSTOMER_CITY from customer_master
select distinct CUSTOMER_CITY from customer_master

--Display No.of customers from different Occupation
select * from customer_master
select occupation,COUNT(CUSTOMER_NUMBER) from customer_master group by occupation

--Display Customer Details with the Ascending Order based on FirstName
select * from customer_master
select * from customer_master order by FIRSTNAME

--assignment2
create table customer_master
(
CUSTOMER_NUMBER int primary key,
FIRSTNAME varchar(20),
middlename varchar(50),
lastname varchar(40),
CUSTOMER_CITY varchar(10),
CUSTOMER_CONTACT_NO varchar(15) not null unique,
occupation varchar(30),
CUSTOMER_DATE_OF_BIRTH DATE)
insert into customer_master
values(1001,'Ramesh','Chandra','Sharma','Hyd',9678954321,'Inspector','2001-09-03'),
(1002,'Tetala','Vineela','Reddy','Rjy',9876512340,'SI','2001-12-02'),
(1003,'Paidi','Sobha','Rani','Mp',6879057684,'Doctor','2001-07-11'),
(1004,'Thatisetti','NULL','Pallavi','Hyd',6241345609,'Student','2001-06-08'),
(1005,'Lanka','Vineela','NULL','Rjy',9848678901,'Student','2002-03-14'),
(1006,'Suresh','Rao','Majji','Vskp',9890847654,'Service','2002-04-15')
select * from customer_master

 create table loan_details(
 CUSTOMER_NUMBER int,
 branch_id int ,
 loan_amount int,

 constraint fk_CUSTOMER_NUMBER foreign key(CUSTOMER_NUMBER) references customer_master(customer_number))
 insert into loan_details values(1001,1,90000),
 (1002,2,100000),
 (1003,3,150000),
 (1004,4,200000),
 (1005,5,250000),
 (1006,6,300000)
 select * from loan_details

 drop table loan_details
 drop table customer_master
 
 create table branch_master(
branch_id int primary key,
 branch_name varchar(50),
 branch_city varchar(50)
constraint fk_master foreign key(branch_id) references branch_master(branch_id))
insert into branch_master values(1,'LSBK','Kakinada'),
(2,'LSBH','Hyderabad'),
(3,'LSBR','Rajahmundry'),
(4,'LSBV','Vizag'),
(5,'LSBG','Gujarat'),
(6,'LSBC','Chennai')
select *  from branch_master
 create table account_master(
 account_number int primary key,
 customer_number int ,
 branch_id int,
 opening_balance int ,
 account_opening_date date,
 account_type varchar(50),
 account_status varchar(10),
 constraint fk_custom foreign key(customer_number) references customer_master(customer_number))
 
 insert into account_master values(30001,1001,1,1000,'2012-12-15','Saving','Active'),
 (30002,1002,2,1000,'2012-06-12','Saving','Active'),
 (30003,1003,3,1000,'2012-05-17','Saving','Active'),
 (30004,1004,4,1000,'2013-01-27','Saving','Active'),
 (30005,1005,5,1000,'2010-08-12','Saving','Suspended'),
 (30006,1006,6,1000,'2009-11-09','Saving','Terminated')
 select * from account_master

 create table transaction_details(
transaction_number int primary key,
account_number int,
date_of_transaction date,
medium_of_transaction varchar(30),
transaction_type varchar(40),
transaction_amount int,
constraint fk_details foreign key(account_number) references account_master(account_number))

insert into transaction_details values(301,30001,'2013-01-01','Cheque','Deposit',2000),
(302,30002,'2013-02-01','Cash','Withdrawal',1000),
(303,30003,'2013-01-01','Cash','Deposit',2000),
(304,30004,'2013-02-01','Cash','Deposit',3000),
(305,30003,'2013-01-11','Cash','Deposit',7000),
(306,30001,'2013-03-21','Cash','Withdrawal',9000)
select * from transaction_details

--assignment-3

--Assignment on Stored Procedure
--Create a user defined stored procedure to display “welcome to SQL Server” as message andexecute it

CREATE PROCEDURE DisplayMessage
AS
BEGIN
    PRINT 'Welcome to SQL Server'
END
EXEC DisplayMessage

--create a stored procedure which takes Gender and id as input paramaeter . Based on input
--parameter display the Emplyee Name ,Gender Salary from tblEmployee table

create table tblemployee
(
DeptId int identity primary key,
Name varchar(40),
Gender varchar(10),
salary int
)
insert into tblemployee values('Mark','Male',8000),
('John','Male',5000),
('Pam','Male',8000),
('Tony','Male',9000),
('Ben','Male',8600)
select *from tblemployee
create table tblDepartment
(
DeptId int primary key identity,
DepartmentName varchar(50),
Location varchar(100),
DepartmentHead varchar(40))
insert into tblDepartment values
('IT','London','Rick'),
('Payroll','Delhi','Ron'),
('HR','NewYork','Christle')
select * from tblDepartment

--create a stored procedure which takes Gender and Depatid as input paramaeter and
--TotlaEmployeecount as output param. Based on input parameter display the Emplyee Name ,Gender
--Salary from tblEmployee table and Total Employee of given Gender and Department Id

CREATE PROCEDURE GetEmployeeDetails (@Gender NVARCHAR(10), @empID INT)
AS
BEGIN
    SELECT Name, Gender, Salary
    FROM tblEmployee
    WHERE Gender = @Gender AND empID = @empID
END



--create a stored procedure two add thee number and display the sum of three numberas output. If
--user does not pass values for input params give default value sum as output.

CREATE PROCEDURE GetSumOfNumbers (@Number1 INT = 0, @Number2 INT = 0, @Number3 INT = 0, @Sum INT OUTPUT)
AS
BEGIN
    SET @Sum = @Number1 + @Number2 + @Number3
END


DECLARE @Sum INT
EXEC GetSumOfNumbers 1, 2, 3, @Sum OUTPUT
PRINT 'Sum: ' + CAST(@Sum AS VARCHAR(10))

DECLARE @Sum INT
EXEC GetSumOfNumbers @Sum OUTPUT
PRINT 'Sum: ' + CAST(@Sum AS VARCHAR(10))

--Assignments on Functions
--create a function to display student information by BranchId
CREATE FUNCTION DisplayStudentInformationByBranchId (@BranchId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        s.StudentId,
        s.FirstName,
        s.LastName,
        s.Email,
        s.Phone,
        b.BranchName
    FROM 
        Students s
        JOIN Branches b ON s.BranchId = b.BranchId
    WHERE 
        s.BranchId = @BranchId
)

--create a function to display student information by Gender

CREATE FUNCTION DisplayStudentInformationByGender (@Gender VARCHAR(10))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        StudentId,
        FirstName,
        LastName,
        Email,
        Phone,
        Gender
    FROM 
        Students
    WHERE 
        Gender = @Gender
)


CREATE FUNCTION CalculateNetSalesAmount (@OrderId INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @NetSalesAmount DECIMAL(18,2)
    SET @NetSalesAmount = (SELECT SUM(UnitPrice * Quantity) - Discount FROM Orders WHERE OrderId = @OrderId)
    RETURN @NetSalesAmount
END

--Assignment on Trigger:
--create a trigger to delete the recode from tblEmployee table and insert deleted record
--deetails in tblEmployeeaudit Table (use after or For trigger)

CREATE TRIGGER trg_DeleteEmployeeRecord
ON tblEmployee
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO tblEmployeeAudit
        (EmployeeId, FirstName, LastName, Email, Phone, Department)
    SELECT 
        EmployeeId, FirstName, LastName, Email, Phone, Department
    FROM 
        DELETED
END

--Assignmen on subquery
/*assignment
List put the product details which is not at all sold using subquery.
refer tblProduct and tblproductSales tables
*/

SELECT * 
FROM tblProduct 
WHERE productId NOT IN (SELECT productId FROM tblproductSales);
