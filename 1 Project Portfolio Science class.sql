/* Created databse 'postgres' and created the table 'Science_class'*/

CREATE TABLE Science_Class (Enrollment_no INT, Name VARCHAR, Science_Marks INT);
INSERT into Science_Class values (1,'Popeye',33)
INSERT into Science_Class values (2,'Olive',54)
INSERT into Science_Class values (3,'Brutus',98)

/*Retrieved all the data from the table 'Science_Class'*/
SELECT * FROM science_class;
/*Retrieved name of students who scored more than 60 marks*/
SELECT * FROM science_class WHERE Science_Marks>60;
/*Retrieved all data of students who have scored more than 35 but less than 60 marks*/
SELECT * FROM science_class WHERE science_marks BETWEEN 35 AND 60;
/*Retrieve all other students data*/
SELECT * FROM science_class WHERE science_marks NOT BETWEEN 35 and 60;

/*Updated a students marks, Deleted the row containing the student called "Robb" and renamed the column "Name" to "student_name"*/
UPDATE TABLE science_class SET science_marks=45 WHERE name='Popeye';
DELETE FROM science_class WHERE name='Robb';
ALTER TABLE science_class RENAME COLUMN name to student_name;
