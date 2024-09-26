-- Data Base Implementation
use master;
-- Create new database;
CREATE DATABASE Experimental_Work;
-- Use created database
use Experimental_Work;
-- Daniel -- 3rd Normal Form (3FN) --
CREATE TABLE PostalCode(
	PostalCode	varchar(8) not null,
	Place		varchar(50) not null,
	PRIMARY KEY (PostalCode),
)


CREATE TABLE People (
	ID 			integer 	not null,
	FirstName	varchar(50) not null,
	LastName	varchar(50) not null,
	HomeAddress	varchar(50) not null,
	PostalCode	varchar(8) not null,
	FOREIGN KEY (PostalCode) REFERENCES PostalCode(PostalCode),
	PRIMARY KEY (ID)
)
-- Create Contacts Table
CREATE TABLE Contacts (
	Contact_ID	integer		not null,
	People_ID	integer		not null,
	FOREIGN KEY (People_ID) REFERENCES People(ID),
	PRIMARY KEY (Contact_ID)
)
-- Create Teacher Table
CREATE TABLE Teacher (
	Teacher_ID	integer		not null,
	Gender		varchar(50),
	FOREIGN KEY (Teacher_ID) REFERENCES People(ID),
	PRIMARY KEY (Teacher_ID)
)
-- Create Student Table
CREATE TABLE Student (
	Student_ID	integer		not null,
	BirthDate	date		not null,
	FOREIGN KEY (Student_ID) REFERENCES People(ID),
	PRIMARY KEY (Student_ID)
)
-- Create School Table
CREATE TABLE School (
	ID			integer		not null,
	Name		varchar(50)	not null,
	City		varchar(50)	not null,
	PRIMARY KEY (ID)
)
-- Create University Table
CREATE TABLE University (
	University_ID	integer	not null,
	City		varchar(50)	not null,
	FOREIGN KEY (University_ID) REFERENCES School(ID),
	PRIMARY KEY (University_ID)
)
-- Create High School Table
CREATE TABLE HighSchool (
	HighSchool_ID	integer	not null,
	Type_		varchar(50)	not null,
	FOREIGN KEY (HighSchool_ID) REFERENCES School(ID),
	PRIMARY KEY (HighSchool_ID),
	CHECK (Type_ IN ('DayTime','NigthTime','Both'))
)
-- Create Teaching Table
CREATE TABLE Teaching (
	T_ID		integer		not null,
	HighSchool_ID	integer	not null,
	StartingYear	integer	not null,
	Discipline	varchar(50)	not null,
	FOREIGN KEY (T_ID) 			REFERENCES Teacher(Teacher_ID),
	FOREIGN KEY (HighSchool_ID)	REFERENCES HighSchool(HighSchool_ID),
	PRIMARY KEY (T_ID)
)
-- Create ToHire Table
CREATE TABLE ToHire (
	ID			integer		not null,
	Teacher_ID	integer		not null,
	T_ID		integer		not null,
	StartDate	date		not null,
	EndDate		date		not null,
	Salary		money		not null,
	FOREIGN KEY (Teacher_ID)	REFERENCES Teacher(Teacher_ID),
	FOREIGN KEY (T_ID)			REFERENCES Teaching(T_ID),
	FOREIGN KEY (ID)			REFERENCES School(ID),
	PRIMARY KEY (ID, Teacher_ID, T_ID, StartDate)
)
-- Create Attend Table
CREATE TABLE Attend (
	Year_ 		integer		not null,
	SchoolYear	integer		not null,
	FirstTime	varchar(3)	not null,
	HighSchool_ID	integer	not null,
	Student_ID	integer		not null,
	FOREIGN KEY (HighSchool_ID)	REFERENCES HighSchool(HighSchool_ID),
	FOREIGN KEY (Student_ID)	REFERENCES Student(Student_ID),
	PRIMARY KEY (Year_, HighSchool_ID, Student_ID),
	CHECK (FirstTime IN ('Yes','No'))
)
-- Create Enroll Table
CREATE TABLE Enroll (
	Student_ID	integer		not null,
	University_ID	integer not null,
	Date_		date		not null,
	Course		varchar(50)	not null,
	FOREIGN KEY (Student_ID)	REFERENCES Student(Student_ID),
	FOREIGN KEY (University_ID) REFERENCES University(University_ID),
	PRIMARY KEY (Student_ID, University_ID, Date_)
)

-- Data Insertion to Database
-- Insert sample data into PostalCode Table
insert  into PostalCode (PostalCode, Place) VALUES 
('1234-567', 'City1'), 
('2345-678', 'City2'), 
('3456-789', 'City3');
-- Insert sample data into People Table
insert into People values
    (1,'John', 'Doe', '123 Main St', '1234-567'),
    (2,'Jane', 'Smith', '456 Elm St', '2345-678'),
    (3,'Alice', 'Johnson', '789 Oak St', '1234-567'),
    (4,'Bob', 'Williams', '101 Pine St', '2345-678'),
    (5,'Emily', 'Brown', '202 Maple St', '1234-567'),
	(6,'Rafa³', 'Kawka', '203 Maple St', '3456-789'),
	(7,'Mary', 'White', '204 Maple St', '3456-789'),
	(8,'Kamil', 'Yellow', '205 Maple St', '1234-567'),
	(9,'Józef', 'Sikora', '206 Maple St', '1234-567'),
	(10,'Emily', 'Kowalski', '207 Maple St', '2345-678');

-- Check Table

	SELECT * FROM People;

-- Insert sample data into Contacts Table
insert into Contacts values
    (26, 1),
    (27, 2),
    (28, 3),
    (29, 4),
    (30, 5),
	(31, 6)

-- Insert sample data into Teacher Table
insert into Teacher values
    (1, 'Male'),
    (2, 'Female'),
    (3, 'Male'),
    (4, 'Female'),
    (5, 'Male'),
	(6, 'Male')

-- Insert sample data into Student Table
insert into Student values
    (6,'2000-01-01'),
    (7,'2001-02-03'),
    (8,'2002-03-04'),
    (9,'2003-04-05'),
    (10,'2004-05-06')

-- Insert sample data into School Table
insert into School values
    (100,'School1', 'City1'),
    (101,'School2', 'City2'),
    (102,'School3', 'City3'),
    (103,'School4', 'City4'),
    (104,'School5', 'City5'),
	(105,'School6', 'City6'),
	(106,'School7', 'City7'),
	(107,'School8', 'City8'),
	(108,'School9', 'City9'),
	(109,'School10', 'City10')

-- Insert sample data into University Table
insert into University values
    (100, 'City1'),
    (101, 'City2'),
    (102, 'City3'),
    (103, 'City4'),
    (104, 'City5')

-- Insert sample data into High School Table
insert into HighSchool values
    (105, 'DayTime'),
    (106, 'NigthTime'),
    (107, 'Both'),
    (108, 'DayTime'),
    (109, 'NigthTime')

-- Insert sample data into Teaching Table
insert into Teaching values
    (1, 105, 2010, 'Math'),
    (2, 106, 2011, 'Engineering'),
    (3, 107, 2012, 'Phyiscs'),
    (4, 108, 2013, 'Math'),
    (5, 109, 2014, 'Phyiscs')

-- Insert sample data into ToHire Table
insert into ToHire values
    (100, 1, 3, '2020-01-01', '2021-01-01', 1000),
    (101, 3, 3, '2020-02-02', '2021-02-02', 1100),
    (105, 1, 3, '2020-03-03', '2021-03-03', 2000),
    (106, 2, 5, '2020-04-04', '2021-04-04', 2100),
    (109, 2, 5, '2020-05-05', '2021-05-05', 3000),
	(107, 2, 5, '2024-05-05', '2025-05-05', 1000)

-- Insert sample data into Attend Table
insert into Attend values
    (2020, 1, 'Yes', 105, 6),
    (2021, 2, 'No', 106, 7),
    (2022, 3, 'Yes', 108, 8),
    (2022, 4, 'No', 108, 9),
    (2020, 5, 'Yes', 109, 10)


-- Insert sample data into Enroll Table
insert into Enroll values
    (6, 101, '2020-01-01', 'Managment'),
    (7, 101, '2020-02-02', 'Safety and Health'),
    (8, 103, '2020-03-03', 'Managment'),
    (9, 104, '2020-04-04', 'Safety and Health'),
    (10, 102, '2020-05-05', 'Managment')

--2.1. Who was the 1st Hired Teacher? [Teacher (Name, Gender), Date]
SELECT FirstName AS Name, Gender, StartDate AS Date
FROM ToHire
INNER JOIN Teacher ON Teacher.Teacher_ID = ToHire.Teacher_ID
INNER JOIN People ON Teacher.Teacher_ID = People.ID
WHERE ToHire.StartDate = (SELECT MIN(StartDate) FROM ToHire);

--2.2. How many different Students have enrolled each University?
--[University (Name), N_Students]
SELECT School.Name, COUNT(DISTINCT Enroll.Student_ID) AS N_Students
FROM Enroll
INNER JOIN University ON University.University_ID = Enroll.University_ID
INNER JOIN School ON School.ID = University.University_ID
GROUP BY School.Name;

--2.3. Which students attended school the longest?
--[Students (Name), Number of Years]
SELECT People.FirstName AS Name, COUNT(DISTINCT Attend.Year_) AS Number_of_Years
FROM Attend
INNER JOIN Student ON Attend.Student_ID = Student.Student_ID
INNER JOIN People ON Student.Student_ID = People.ID
GROUP BY People.FirstName
ORDER BY Number_of_Years DESC;

--2.4. Which Teachers were Hired in the last 60 days with salaries below 1200€?
--[Teacher (Name), Date, Salary]
SELECT FirstName AS Name, LastName AS Surname, StartDate AS Date, Salary
FROM ToHire
INNER JOIN Teacher ON ToHire.Teacher_ID = Teacher.Teacher_ID
INNER JOIN People ON Teacher.Teacher_ID = People.ID
WHERE StartDate >= DATEADD(day, -60, GETDATE()) AND Salary < 1200;

--2.5. Which universities currently have courses with no students enrolled?
--[Universities (Name)] List them in alphabetical order.
SELECT School.Name AS Name
FROM School
WHERE School.ID NOT IN (SELECT DISTINCT Enroll.University_ID FROM Enroll)
ORDER BY Name ASC;

-- Assuming that each Student has a cost of 50€/day for the school, create a procedure 
-- that for a given month calculates the Total Value that each school spent, presenting 
-- a table with the names of the schools and the total spent in each one in that month. 
-- The procedure must return the total amount spent by all the schools.

CREATE PROCEDURE SchoolExpenses
    @Month INTEGER,
    @Year INTEGER
AS
BEGIN
    DECLARE @TotalExpenses MONEY = 0;
    -- Create a temporary table to hold the results
    CREATE TABLE #SchoolExpenses (
        SchoolName VARCHAR(50),
        TotalSpent MONEY
    );
    DECLARE @DaysInMonth INTEGER;

    -- Determine the number of days in the specified month
    SET @DaysInMonth = CASE 
        WHEN @Month IN (1, 3, 5, 7, 8, 10, 12) THEN 31
        WHEN @Month IN (4, 6, 9, 11) THEN 30
        WHEN @Month = 2 THEN 
            CASE 
                WHEN @Year % 4 = 0 AND (@Year % 100 != 0 OR @Year % 400 = 0) THEN 29
                ELSE 28
            END
        END;

    -- Insert total expenses for each school into the temporary table
    INSERT INTO #SchoolExpenses (SchoolName, TotalSpent)
    SELECT 
        School.Name, 
        COUNT(Attend.Student_ID) * 50 * @DaysInMonth AS TotalSpent
    FROM 
        School
    LEFT JOIN 
        Attend ON School.ID = Attend.HighSchool_ID
        AND YEAR(Attend.SchoolYear) = @Year 
        AND MONTH(Attend.SchoolYear) = @Month
    GROUP BY 
        School.Name;

    -- Calculate the total expenses across all schools
    SELECT @TotalExpenses = SUM(TotalSpent) FROM #SchoolExpenses;

    -- Return the detailed expenses for each school and the total expenses
    SELECT * FROM #SchoolExpenses;
    SELECT @TotalExpenses AS TotalExpenses;

    -- Clean up the temporary table
    DROP TABLE #SchoolExpenses;
END;

-- Execute the procedure with example input
EXECUTE SchoolExpenses @Month = 2, @Year = 2020;

-- A student cannot attend more than 2 Courses at the same time. Create a trigger 
-- that only lets you insert a new record in the Enroll relationship if this student 
-- is not yet enrolled in 2 courses.

CREATE TRIGGER EnrollLimit
ON Enroll
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @StudentID INT;
    DECLARE @CourseCount INT;

    -- Check each student in the INSERTED table
    DECLARE cur CURSOR FOR 
        SELECT Student_ID FROM INSERTED;

    OPEN cur;
    FETCH NEXT FROM cur INTO @StudentID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Count the number of currently enrolled courses for this student
        SELECT @CourseCount = COUNT(*) 
        FROM Enroll 
        WHERE Student_ID = @StudentID;

        -- Check if the student is already enrolled in 2 or more courses
        IF @CourseCount >= 2
        BEGIN
            PRINT 'Cannot enroll in more than 2 courses at the same time for Student ID: ' + CAST(@StudentID AS VARCHAR);
        END
        ELSE
        BEGIN
            -- If the count is less than 2, insert the new record into Enroll
            INSERT INTO Enroll (Student_ID, University_ID, Date_, Course)
            SELECT Student_ID, University_ID, Date_, Course
            FROM INSERTED
            WHERE Student_ID = @StudentID; -- Ensure we only insert for this student
        END

        FETCH NEXT FROM cur INTO @StudentID;
    END

    CLOSE cur;
    DEALLOCATE cur;
END;

