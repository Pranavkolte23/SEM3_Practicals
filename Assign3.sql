USE te31414_db;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS PlacementDrive;
DROP TABLE IF EXISTS Training;

CREATE TABLE PlacementDrive (
    drive_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    package DECIMAL(5,2) NOT NULL,
    placed_loc VARCHAR(50) NOT NULL
);

CREATE TABLE Training (
    training_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    training_fee INT NOT NULL,
    training_year YEAR NOT NULL
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    drive_id INT NULL,
    training_id INT NULL,
    student_name VARCHAR(50) NOT NULL,
    cgpa DECIMAL(4,2) NOT NULL,
    student_branch VARCHAR(50) NOT NULL,
    student_dob DATE NOT NULL,
    FOREIGN KEY (drive_id) REFERENCES PlacementDrive(drive_id) ON DELETE CASCADE,
    FOREIGN KEY (training_id) REFERENCES Training(training_id) ON DELETE CASCADE
);

DESC student;
DESC PlacementDrive;
DESC Training;

INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Amazon', 5, 'Noida');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Salesforce', 6, 'Noida');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Google', 7, 'Banglore');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Salesforce', 8, 'Noida');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Atlassian', 9, 'Noida');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Google', 10, 'Gurgaon');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Google', 11, 'Banglore');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Atlassian', 12, 'Gurgaon');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Amazon', 13, 'Gurgaon');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('LinkedIn', 14, 'Gurgaon');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Facebook', 15, 'Noida');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Atlassian', 16, 'Gurgaon');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Facebook', 17, 'Banglore');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Salesforce', 18, 'Banglore');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Atlassian', 19, 'Gurgaon');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Atlassian', 20, 'Pune');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('LinkedIn', 21, 'Pune');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Facebook', 22, 'Pune');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Salesforce', 23, 'Noida');
INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('LinkedIn', 24, 'Pune');

INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 18638, 2024);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 15856, 2024);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Barclays', 19277, 2024);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Northern Trust', 15409, 2022);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Accenture', 15835, 2024);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Deloitte', 15827, 2024);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Barclays', 16998, 2023);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 18028, 2023);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Accenture', 15038, 2023);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Northern Trust', 19449, 2023);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Barclays', 16222, 2022);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Arista', 19063, 2024);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 17055, 2023);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Accenture', 17840, 2024);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Northern Trust', 15971, 2024);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Arista', 18433, 2024);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Barclays', 18350, 2023);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 15593, 2022);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Accenture', 18444, 2024);
INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 17880, 2022);

INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (18, 18, 'Patric', 8.46, 'Information Technology', '2004-04-06');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (14, 14, 'Dore', 8.71, 'Electronics and Telecommunication', '2004-08-10');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (2, 2, 'Drusi', 8.68, 'Electronics and Telecommunication', '2004-03-17');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (6, 6, 'Douglas', 8.24, 'Information Technology', '2004-03-19');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (7, 7, 'Dennie', 8.53, 'Computer Engineering', '2004-12-29');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (1, 1, 'Adela', 8.69, 'Computer Engineering', '2004-08-17');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (4, 4, 'Ann', 8.28, 'Computer Engineering', '2004-05-31');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (8, 8, 'Arabelle', 8.08, 'Electronics and Telecommunication', '2004-03-20');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (10, 10, 'Connie', 8.22, 'Computer Engineering', '2004-03-18');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (5, 5, 'Lainey', 8.75, 'Electronics and Telecommunication', '2004-08-15');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (20, 20, 'Palm', 8.18, 'Electronics and Telecommunication', '2004-05-04');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (11, 11, 'Alan', 8.88, 'Electronics and Telecommunication', '2004-04-29');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (17, 17, 'Kacy', 8.24, 'Electronics and Telecommunication', '2004-06-23');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (12, 12, 'Norean', 8.94, 'Information Technology', '2004-06-06');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (13, 13, 'Vernen', 8.73, 'Computer Engineering', '2004-10-27');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (9, 9, 'Michale', 8.71, 'Information Technology', '2004-08-14');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (15, 15, 'Shandee', 8.55, 'Information Technology', '2004-05-14');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (16, 16, 'Jonah', 8.11, 'Computer Engineering', '2004-08-08');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (19, 19, 'Lou', 8.36, 'Computer Engineering', '2004-07-14');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (3, 3, 'Ewart', 8.12, 'Information Technology', '2004-07-28');

SELECT * FROM Student;
SELECT * FROM Training;
SELECT * FROM PlacementDrive;

SELECT * FROM Student NATURAL JOIN PlacementDrive;
SELECT s.student_id, s.drive_id, s.training_id, s.student_name, s.cgpa, s.student_branch, s.student_dob, p1.company_name FROM Student s INNER JOIN Student s2 ON s.student_id = s2.student_id INNER JOIN PlacementDrive p1 ON s.drive_id = p1.drive_id order by p1.company_name;
SELECT s.student_name, s.student_branch, p.package FROM Student s INNER JOIN PlacementDrive p ON s.drive_id = p.drive_id WHERE p.package > 7;
SELECT s.student_name, t.company_name, t.training_fee FROM Student s INNER JOIN Training t ON s.training_id = t.training_id WHERE t.training_fee > 16000;
SELECT s.student_name, s.student_id, s.training_id, t.training_year FROM Student s NATURAL JOIN Training t WHERE s.student_name = 'Patric' AND t.training_year = 2022;
SELECT COUNT(DISTINCT company_name) AS company_count FROM Training WHERE training_year <= 2023;
SELECT * FROM Student WHERE drive_id IN (SELECT drive_id FROM PlacementDrive WHERE placed_loc = 'Pune' AND company_name = 'LinkedIn');
SELECT s.student_id, s.student_name, s.student_branch, t.company_name, t.training_year FROM Student s NATURAl JOIN Training t WHERE t.company_name='Barclays' AND t.training_year = 2023;
CREATE VIEW Student_Training_View AS SELECT * FROM Student NATURAL JOIN Training;
CREATE VIEW Student_View AS SELECT student_id, student_name, cgpa, student_branch, student_dob FROM Student;

CREATE VIEW Student_View AS SELECT student_id, student_name, cgpa, student_branch, student_dob FROM Student;
INSERT INTO Student_View (student_name, cgpa, student_branch, student_dob) VALUES ('ABHISHEK', 9.32, 'Computer Engineering', '2004-05-24');
UPDATE Student_View SET cgpa = 8.87 WHERE student_name = 'ABHISHEK';
DELETE FROM Student_View WHERE student_name = 'ABHISHEK';
DROP VIEW Student_View;
/*

OUTPUT :-

pict@pict-OptiPlex-SFF-Plus-7010:~$ mysql -h 10.10.14.184 -u te31414 -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 498
Server version: 5.5.5-10.4.19-MariaDB MariaDB Server

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use te31414_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> USE te31414_db;
ista', 19063, 2Database changed
mysql> 
mysql> DROP TABLE IF EXISTS Student;
024);
INSERT INTO Training (comQuery OK, 0 rows affected (0.12 sec)

mysql> DROP TABLE IF EXISTS PlacementDrive;
pany_name, training_fee, training_yeaQuery OK, 0 rows affected (0.10 sec)

mysql> DROP TABLE IF EXISTS Training;
r) VALUES ('TCS', 17055, 2023);Query OK, 0 rows affected (0.13 sec)

mysql> 
mysql> CREATE TABLE PlacementDrive (
    ->     drive_id INT PRIMARY KEY AUTO_INCREMENT,
 ('A    ->     company_name VARCHAR(100) NOT NULL,
    ->     package DECIMAL(5,2) NOT NULL,
     ->     placed_loc VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.34 sec)

mysql> 
mysql> CREATE TABLE Training (
    ->     training_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     company_name VARCHAR(100) NOT NULL,
    ->     training_fee INT NOT NULL,
INSERT INTO Training (company_n    ->     training_year YEAR NOT NULL
ar    -> );
) VQuery OK, 0 rows affected (0.19 sec)

mysql> 
mysql> CREATE TABLE Student (
    ->     student_id INT PRIMARY KEY AUTO_INCREMENT,
    ->     drive_id INT NOT NULL,
    ->     training_id INT NOT NULL,
    ->     student_name VARCHAR(50) NOT NULL,
i    ->     cgpa DECIMAL(4,2) NOT NULL,
    ->     student_branch VARCHAR(50) NOT NULL,
    ->     student_dob DATE NOT NULL,
g    ->     FOREIGN KEY (drive_id) REFERENCES PlacementDrive(drive_id) ON DELETE CASCADE,
    ->     FOREIGN KEY (training_id) REFERENCES Training(training_id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.21 sec)

mysql> DESC PlacementDrive;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| drive_id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| company_name | varchar(100) | NO   |     | NULL    |                |
| package      | decimal(5,2) | NO   |     | NULL    |                |
| placed_loc   | varchar(50)  | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> DESC Training;
'2004-04-06');
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| training_id   | int(11)      | NO   | PRI | NULL    | auto_increment |
| company_name  | varchar(100) | NO   |     | NULL    |                |
| training_fee  | int(11)      | NO   |     | NULL    |                |
| training_year | year(4)      | NO   |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> 
mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Amazon', 5, 'Noida');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VAQuery OK, 1 row affected (0.02 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Salesforce', 6, 'Noida');
LUES (14, 14, 'Dore', 8.71, 'Electronics and Telecommunication', '2004-08-10');
INSERT INTO StudenQuery OK, 1 row affected (0.03 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Google', 7, 'Banglore');
t (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (2, 2, 'Drusi',Query OK, 1 row affected (0.07 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Salesforce', 8, 'Noida');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Atlassian', 9, 'Noida');
_id, student_name, cgpa, student_branch, student_dob) VALUES (6, 6, 'Douglas', 8.24, 'InformationQuery OK, 1 row affected (0.02 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Google', 10, 'Gurgaon');
 Technology', '2004-03-19');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, studQuery OK, 1 row affected (0.03 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Google', 11, 'Banglore');
ent_branch, student_dob) VALUES (7, 7, 'Dennie', 8.53, 'Computer Engineering', '2004-12-29');
INSEQuery OK, 1 row affected (0.02 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Atlassian', 12, 'Gurgaon');
RT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (1, Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Amazon', 13, 'Gurgaon');
1, 'Adela', 8.69, 'Computer Engineering', '2004-08-17');
INSERT INTO Student (drive_id, training_Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('LinkedIn', 14, 'Gurgaon');
id, student_name, cgpa, student_branch, student_dob) VALUES (4, 4, 'Ann', 8.28, 'Computer EngineeriQuery OK, 1 row affected (0.03 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Facebook', 15, 'Noida');
ng', '2004-05-31');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_brancQuery OK, 1 row affected (0.02 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Atlassian', 16, 'Gurgaon');
h, student_dob) VALUES (8, 8, 'Arabelle', 8.08, 'Electronics and Telecommunication', '2004-03-20');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Facebook', 17, 'Banglore');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES Query OK, 1 row affected (0.07 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Salesforce', 18, 'Banglore');
(10, 10, 'Connie', 8.22, 'Computer Engineering', '2004-03-18');
INSERT INTO Student (drive_id, traininQuery OK, 1 row affected (0.09 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Atlassian', 19, 'Gurgaon');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Atlassian', 20, 'Pune');
d Telecommunication', '2004-08-15');
INSERT INTO Student (drive_id, training_id, student_name, cgQuery OK, 1 row affected (0.03 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('LinkedIn', 21, 'Pune');
pa, student_branch, student_dob) VALUES (20, 20, 'Palm', 8.18, 'Electronics and TelecommunicatioQuery OK, 1 row affected (0.03 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Facebook', 22, 'Pune');
n', '2004-05-04');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_brancQuery OK, 1 row affected (0.03 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('Salesforce', 23, 'Noida');
h, student_dob) VALUES (11, 11, 'Alan', 8.88, 'Electronics and Telecommunication', '2004-04-29');
IQuery OK, 1 row affected (0.06 sec)

mysql> INSERT INTO PlacementDrive (company_name, package, placed_loc) VALUES ('LinkedIn', 24, 'Pune');
NSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUQuery OK, 1 row affected (0.04 sec)

mysql> 
mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 18638, 2024);
ES (17, 17, 'Kacy', 8.24, 'Electronics and Telecommunication', '2004-06-23');
INSERT INTO StudeQuery OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 15856, 2024);
nt (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (12, 12, 'NQuery OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Barclays', 19277, 2024);
orean', 8.94, 'Information Technology', '2004-06-06');
INSERT INTO Student (drive_id, training_id, Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Northern Trust', 15409, 2022);
student_name, cgpa, student_branch, student_dob) VALUES (13, 13, 'Vernen', 8.73, 'Computer Engineering', Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Accenture', 15835, 2024);
'2004-10-27');
INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, studeQuery OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Deloitte', 15827, 2024);
nt_dob) VALUES (9, 9, 'Michale', 8.71, 'Information Technology', '2004-08-14');
INSERT INTO StudentQuery OK, 1 row affected (0.06 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Barclays', 16998, 2023);
 (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (15, 15, 'Shandee'Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 18028, 2023);
, 8.55, 'Information Technology', '2004-05-14');
INSERT INTO Student (drive_id, training_id, sQuery OK, 1 row affected (0.16 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Accenture', 15038, 2023);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Northern Trust', 19449, 2023);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Barclays', 16222, 2022);
Query OK, 1 row affected (0.06 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Arista', 19063, 2024);
e_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (3, 3, 'Ewart', 8.12, Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 17055, 2023);
'Information Technology', '2004-07-28');

SELECT * FROM Student;
SELECT * FROM Training;
SELECQuery OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Accenture', 17840, 2024);
T * FROM PlacementDrive;Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Northern Trust', 15971, 2024);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Arista', 18433, 2024);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Barclays', 18350, 2023);
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 15593, 2022);
Query OK, 1 row affected (0.07 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('Accenture', 18444, 2024);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Training (company_name, training_fee, training_year) VALUES ('TCS', 17880, 2022);
Query OK, 1 row affected (0.03 sec)

mysql> 
mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (18, 18, 'Patric', 8.46, 'Information Technology', '2004-04-06');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (14, 14, 'Dore', 8.71, 'Electronics and Telecommunication', '2004-08-10');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (2, 2, 'Drusi', 8.68, 'Electronics and Telecommunication', '2004-03-17');
Query OK, 1 row affected (0.16 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (6, 6, 'Douglas', 8.24, 'Information Technology', '2004-03-19');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (7, 7, 'Dennie', 8.53, 'Computer Engineering', '2004-12-29');
Query OK, 1 row affected (0.06 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (1, 1, 'Adela', 8.69, 'Computer Engineering', '2004-08-17'); 
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (4, 4, 'Ann', 8.28, 'Computer Engineering', '2004-05-31');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (8, 8, 'Arabelle', 8.08, 'Electronics and Telecommunication', '2004-03-20');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (10, 10, 'Connie', 8.22, 'Computer Engineering', '2004-03-18');
Query OK, 1 row affected (0.06 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (5, 5, 'Lainey', 8.75, 'Electronics and Telecommunication', '2004-08-15');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (20, 20, 'Palm', 8.18, 'Electronics and Telecommunication', '2004-05-04');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (11, 11, 'Alan', 8.88, 'Electronics and Telecommunication', '2004-04-29');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (17, 17, 'Kacy', 8.24, 'Electronics and Telecommunication', '2004-06-23');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (12, 12, 'Norean', 8.94, 'Information Technology', '2004-06-06');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (13, 13, 'Vernen', 8.73, 'Computer Engineering', '2004-10-27');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (9, 9, 'Michale', 8.71, 'Information Technology', '2004-08-14');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (15, 15, 'Shandee', 8.55, 'Information Technology', '2004-05-14');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (16, 16, 'Jonah', 8.11, 'Computer Engineering', '2004-08-08');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (19, 19, 'Lou', 8.36, 'Computer Engineering', '2004-07-14'); 
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Student (drive_id, training_id, student_name, cgpa, student_branch, student_dob) VALUES (3, 3, 'Ewart', 8.12, 'Information Technology', '2004-07-28');
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM Student;
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
| student_id | drive_id | training_id | student_name | cgpa | student_branch                    | student_dob |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
|          1 |       18 |          18 | Patric       | 8.46 | Information Technology            | 2004-04-06  |
|          2 |       14 |          14 | Dore         | 8.71 | Electronics and Telecommunication | 2004-08-10  |
|          3 |        2 |           2 | Drusi        | 8.68 | Electronics and Telecommunication | 2004-03-17  |
|          4 |        6 |           6 | Douglas      | 8.24 | Information Technology            | 2004-03-19  |
|          5 |        7 |           7 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  |
|          6 |        1 |           1 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  |
|          7 |        4 |           4 | Ann          | 8.28 | Computer Engineering              | 2004-05-31  |
|          8 |        8 |           8 | Arabelle     | 8.08 | Electronics and Telecommunication | 2004-03-20  |
|          9 |       10 |          10 | Connie       | 8.22 | Computer Engineering              | 2004-03-18  |
|         10 |        5 |           5 | Lainey       | 8.75 | Electronics and Telecommunication | 2004-08-15  |
|         11 |       20 |          20 | Palm         | 8.18 | Electronics and Telecommunication | 2004-05-04  |
|         12 |       11 |          11 | Alan         | 8.88 | Electronics and Telecommunication | 2004-04-29  |
|         13 |       17 |          17 | Kacy         | 8.24 | Electronics and Telecommunication | 2004-06-23  |
|         14 |       12 |          12 | Norean       | 8.94 | Information Technology            | 2004-06-06  |
|         15 |       13 |          13 | Vernen       | 8.73 | Computer Engineering              | 2004-10-27  |
|         16 |        9 |           9 | Michale      | 8.71 | Information Technology            | 2004-08-14  |
|         17 |       15 |          15 | Shandee      | 8.55 | Information Technology            | 2004-05-14  |
|         18 |       16 |          16 | Jonah        | 8.11 | Computer Engineering              | 2004-08-08  |
|         19 |       19 |          19 | Lou          | 8.36 | Computer Engineering              | 2004-07-14  |
|         20 |        3 |           3 | Ewart        | 8.12 | Information Technology            | 2004-07-28  |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
20 rows in set (0.00 sec)

mysql> SELECT * FROM Training;
+-------------+----------------+--------------+---------------+
| training_id | company_name   | training_fee | training_year |
+-------------+----------------+--------------+---------------+
|           1 | TCS            |        18638 |          2024 |
|           2 | TCS            |        15856 |          2024 |
|           3 | Barclays       |        19277 |          2024 |
|           4 | Northern Trust |        15409 |          2022 |
|           5 | Accenture      |        15835 |          2024 |
|           6 | Deloitte       |        15827 |          2024 |
|           7 | Barclays       |        16998 |          2023 |
|           8 | TCS            |        18028 |          2023 |
|           9 | Accenture      |        15038 |          2023 |
|          10 | Northern Trust |        19449 |          2023 |
|          11 | Barclays       |        16222 |          2022 |
|          12 | Arista         |        19063 |          2024 |
|          13 | TCS            |        17055 |          2023 |
|          14 | Accenture      |        17840 |          2024 |
|          15 | Northern Trust |        15971 |          2024 |
|          16 | Arista         |        18433 |          2024 |
|          17 | Barclays       |        18350 |          2023 |
|          18 | TCS            |        15593 |          2022 |
|          19 | Accenture      |        18444 |          2024 |
|          20 | TCS            |        17880 |          2022 |
+-------------+----------------+--------------+---------------+
20 rows in set (0.00 sec)

mysql> SELECT * FROM PlacementDrive;
+----------+--------------+---------+------------+
| drive_id | company_name | package | placed_loc |
+----------+--------------+---------+------------+
|        1 | Amazon       |    5.00 | Noida      |
|        2 | Salesforce   |    6.00 | Noida      |
|        3 | Google       |    7.00 | Banglore   |
|        4 | Salesforce   |    8.00 | Noida      |
|        5 | Atlassian    |    9.00 | Noida      |
|        6 | Google       |   10.00 | Gurgaon    |
|        7 | Google       |   11.00 | Banglore   |
|        8 | Atlassian    |   12.00 | Gurgaon    |
|        9 | Amazon       |   13.00 | Gurgaon    |
|       10 | LinkedIn     |   14.00 | Gurgaon    |
|       11 | Facebook     |   15.00 | Noida      |
|       12 | Atlassian    |   16.00 | Gurgaon    |
|       13 | Facebook     |   17.00 | Banglore   |
|       14 | Salesforce   |   18.00 | Banglore   |
|       15 | Atlassian    |   19.00 | Gurgaon    |
|       16 | Atlassian    |   20.00 | Pune       |
|       17 | LinkedIn     |   21.00 | Pune       |
|       18 | Facebook     |   22.00 | Pune       |
|       19 | Salesforce   |   23.00 | Noida      |
|       20 | LinkedIn     |   24.00 | Pune       |
+----------+--------------+---------+------------+
20 rows in set (0.00 sec)

mysql> SELECT * FROM Student NATURAL JOIN PlacementDrive;
+----------+------------+-------------+--------------+------+-----------------------------------+-------------+--------------+---------+------------+
| drive_id | student_id | training_id | student_name | cgpa | student_branch                    | student_dob | company_name | package | placed_loc |
+----------+------------+-------------+--------------+------+-----------------------------------+-------------+--------------+---------+------------+
|       18 |          1 |          18 | Patric       | 8.46 | Information Technology            | 2004-04-06  | Facebook     |   22.00 | Pune       |
|       14 |          2 |          14 | Dore         | 8.71 | Electronics and Telecommunication | 2004-08-10  | Salesforce   |   18.00 | Banglore   |
|        2 |          3 |           2 | Drusi        | 8.68 | Electronics and Telecommunication | 2004-03-17  | Salesforce   |    6.00 | Noida      |
|        6 |          4 |           6 | Douglas      | 8.24 | Information Technology            | 2004-03-19  | Google       |   10.00 | Gurgaon    |
|        7 |          5 |           7 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  | Google       |   11.00 | Banglore   |
|        1 |          6 |           1 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  | Amazon       |    5.00 | Noida      |
|        4 |          7 |           4 | Ann          | 8.28 | Computer Engineering              | 2004-05-31  | Salesforce   |    8.00 | Noida      |
|        8 |          8 |           8 | Arabelle     | 8.08 | Electronics and Telecommunication | 2004-03-20  | Atlassian    |   12.00 | Gurgaon    |
|       10 |          9 |          10 | Connie       | 8.22 | Computer Engineering              | 2004-03-18  | LinkedIn     |   14.00 | Gurgaon    |
|        5 |         10 |           5 | Lainey       | 8.75 | Electronics and Telecommunication | 2004-08-15  | Atlassian    |    9.00 | Noida      |
|       20 |         11 |          20 | Palm         | 8.18 | Electronics and Telecommunication | 2004-05-04  | LinkedIn     |   24.00 | Pune       |
|       11 |         12 |          11 | Alan         | 8.88 | Electronics and Telecommunication | 2004-04-29  | Facebook     |   15.00 | Noida      |
|       17 |         13 |          17 | Kacy         | 8.24 | Electronics and Telecommunication | 2004-06-23  | LinkedIn     |   21.00 | Pune       |
|       12 |         14 |          12 | Norean       | 8.94 | Information Technology            | 2004-06-06  | Atlassian    |   16.00 | Gurgaon    |
|       13 |         15 |          13 | Vernen       | 8.73 | Computer Engineering              | 2004-10-27  | Facebook     |   17.00 | Banglore   |
|        9 |         16 |           9 | Michale      | 8.71 | Information Technology            | 2004-08-14  | Amazon       |   13.00 | Gurgaon    |
|       15 |         17 |          15 | Shandee      | 8.55 | Information Technology            | 2004-05-14  | Atlassian    |   19.00 | Gurgaon    |
|       16 |         18 |          16 | Jonah        | 8.11 | Computer Engineering              | 2004-08-08  | Atlassian    |   20.00 | Pune       |
|       19 |         19 |          19 | Lou          | 8.36 | Computer Engineering              | 2004-07-14  | Salesforce   |   23.00 | Noida      |
|        3 |         20 |           3 | Ewart        | 8.12 | Information Technology            | 2004-07-28  | Google       |    7.00 | Banglore   |
+----------+------------+-------------+--------------+------+-----------------------------------+-------------+--------------+---------+------------+
20 rows in set (0.00 sec)

mysql> SELECT s.student_id, s.drive_id, s.training_id, s.student_name, s.cgpa, s.student_branch, s.student_dob, p1.company_name FROM Student s INNER JOIN Student s2 ON s.student_id = s2.student_id INNER JOIN PlacementDrive p1 ON s.drive_id = p1.drive_id order by p1.company_name;
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+--------------+
| student_id | drive_id | training_id | student_name | cgpa | student_branch                    | student_dob | company_name |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+--------------+
|          6 |        1 |           1 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  | Amazon       |
|         16 |        9 |           9 | Michale      | 8.71 | Information Technology            | 2004-08-14  | Amazon       |
|         14 |       12 |          12 | Norean       | 8.94 | Information Technology            | 2004-06-06  | Atlassian    |
|         10 |        5 |           5 | Lainey       | 8.75 | Electronics and Telecommunication | 2004-08-15  | Atlassian    |
|         18 |       16 |          16 | Jonah        | 8.11 | Computer Engineering              | 2004-08-08  | Atlassian    |
|         17 |       15 |          15 | Shandee      | 8.55 | Information Technology            | 2004-05-14  | Atlassian    |
|          8 |        8 |           8 | Arabelle     | 8.08 | Electronics and Telecommunication | 2004-03-20  | Atlassian    |
|         12 |       11 |          11 | Alan         | 8.88 | Electronics and Telecommunication | 2004-04-29  | Facebook     |
|          1 |       18 |          18 | Patric       | 8.46 | Information Technology            | 2004-04-06  | Facebook     |
|         15 |       13 |          13 | Vernen       | 8.73 | Computer Engineering              | 2004-10-27  | Facebook     |
|          5 |        7 |           7 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  | Google       |
|          4 |        6 |           6 | Douglas      | 8.24 | Information Technology            | 2004-03-19  | Google       |
|         20 |        3 |           3 | Ewart        | 8.12 | Information Technology            | 2004-07-28  | Google       |
|         13 |       17 |          17 | Kacy         | 8.24 | Electronics and Telecommunication | 2004-06-23  | LinkedIn     |
|         11 |       20 |          20 | Palm         | 8.18 | Electronics and Telecommunication | 2004-05-04  | LinkedIn     |
|          9 |       10 |          10 | Connie       | 8.22 | Computer Engineering              | 2004-03-18  | LinkedIn     |
|          3 |        2 |           2 | Drusi        | 8.68 | Electronics and Telecommunication | 2004-03-17  | Salesforce   |
|         19 |       19 |          19 | Lou          | 8.36 | Computer Engineering              | 2004-07-14  | Salesforce   |
|          2 |       14 |          14 | Dore         | 8.71 | Electronics and Telecommunication | 2004-08-10  | Salesforce   |
|          7 |        4 |           4 | Ann          | 8.28 | Computer Engineering              | 2004-05-31  | Salesforce   |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+--------------+
20 rows in set (0.00 sec)

mysql> SELECT s.student_name, s.student_branch, p.package FROM Student s INNER JOIN PlacementDrive p ON s.drive_id = p.drive_id WHERE p.package > 7;
+--------------+-----------------------------------+---------+
| student_name | student_branch                    | package |
+--------------+-----------------------------------+---------+
| Patric       | Information Technology            |   22.00 |
| Dore         | Electronics and Telecommunication |   18.00 |
| Douglas      | Information Technology            |   10.00 |
| Dennie       | Computer Engineering              |   11.00 |
| Ann          | Computer Engineering              |    8.00 |
| Arabelle     | Electronics and Telecommunication |   12.00 |
| Connie       | Computer Engineering              |   14.00 |
| Lainey       | Electronics and Telecommunication |    9.00 |
| Palm         | Electronics and Telecommunication |   24.00 |
| Alan         | Electronics and Telecommunication |   15.00 |
| Kacy         | Electronics and Telecommunication |   21.00 |
| Norean       | Information Technology            |   16.00 |
| Vernen       | Computer Engineering              |   17.00 |
| Michale      | Information Technology            |   13.00 |
| Shandee      | Information Technology            |   19.00 |
| Jonah        | Computer Engineering              |   20.00 |
| Lou          | Computer Engineering              |   23.00 |
+--------------+-----------------------------------+---------+
17 rows in set (0.00 sec)

mysql> SELECT s.student_name, t.company_name, t.training_fee FROM Student s INNER JOIN Training t ON s.training_id = t.training_id WHERE t.training_fee > 16000;
+--------------+----------------+--------------+
| student_name | company_name   | training_fee |
+--------------+----------------+--------------+
| Dore         | Accenture      |        17840 |
| Dennie       | Barclays       |        16998 |
| Adela        | TCS            |        18638 |
| Arabelle     | TCS            |        18028 |
| Connie       | Northern Trust |        19449 |
| Palm         | TCS            |        17880 |
| Alan         | Barclays       |        16222 |
| Kacy         | Barclays       |        18350 |
| Norean       | Arista         |        19063 |
| Vernen       | TCS            |        17055 |
| Jonah        | Arista         |        18433 |
| Lou          | Accenture      |        18444 |
| Ewart        | Barclays       |        19277 |
+--------------+----------------+--------------+
13 rows in set (0.01 sec)

mysql> select s.student_name, s.student_id, s.training_id, t.training_year FROM Student s NATURAL JOIN Training t WHERE s.student_name = 'Patric' AND t.training_year = 2022;
+--------------+------------+-------------+---------------+
| student_name | student_id | training_id | training_year |
+--------------+------------+-------------+---------------+
| Patric       |          1 |          18 |          2022 |
+--------------+------------+-------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(DISTINCT company_name) AS company_count FROM Training WHERE training_year <= 2023;
+---------------+
| company_count |
+---------------+
|             4 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM Student WHERE drive_id IN (SELECT drive_id FROM PlacementDrive WHERE placed_loc = 'Pune' AND company_name = 'LinkedIn');
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
| student_id | drive_id | training_id | student_name | cgpa | student_branch                    | student_dob |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
|         11 |       20 |          20 | Palm         | 8.18 | Electronics and Telecommunication | 2004-05-04  |
|         13 |       17 |          17 | Kacy         | 8.24 | Electronics and Telecommunication | 2004-06-23  |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT s.student_id, s.student_name, s.student_branch, t.company_name, t.training_year FROM Student s NATURAl JOIN Training t WHERE t.co
mpany_name='Barclays' AND t.training_year = 2023;
+------------+--------------+----------------------+--------------+---------------+
| student_id | student_name | student_branch       | company_name | training_year |
+------------+--------------+----------------------+--------------+---------------+
|          5 | Dennie       | Computer Engineering | Barclays     |          2023 |
+------------+--------------+----------------------+--------------+---------------+
1 row in set (0.00 sec)

mysql> CREATE VIEW v1 AS SELECT * FROM Student NATURAL JOIN Training ORDER BY training_id;
Query OK, 0 rows affected (0.02 sec)

mysql> select * from v1;
+-------------+------------+----------+--------------+------+-----------------------------------+-------------+----------------+--------------+---------------+
| training_id | student_id | drive_id | student_name | cgpa | student_branch                    | student_dob | company_name   | training_fee | training_year |
+-------------+------------+----------+--------------+------+-----------------------------------+-------------+----------------+--------------+---------------+
|           1 |          6 |        1 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  | TCS            |        18638 |          2024 |
|           2 |          3 |        2 | Drusi        | 8.68 | Electronics and Telecommunication | 2004-03-17  | TCS            |        15856 |          2024 |
|           3 |         20 |        3 | Ewart        | 8.12 | Information Technology            | 2004-07-28  | Barclays       |        19277 |          2024 |
|           4 |          7 |        4 | Ann          | 8.28 | Computer Engineering              | 2004-05-31  | Northern Trust |        15409 |          2022 |
|           5 |         10 |        5 | Lainey       | 8.75 | Electronics and Telecommunication | 2004-08-15  | Accenture      |        15835 |          2024 |
|           6 |          4 |        6 | Douglas      | 8.24 | Information Technology            | 2004-03-19  | Deloitte       |        15827 |          2024 |
|           7 |          5 |        7 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  | Barclays       |        16998 |          2023 |
|           8 |          8 |        8 | Arabelle     | 8.08 | Electronics and Telecommunication | 2004-03-20  | TCS            |        18028 |          2023 |
|           9 |         16 |        9 | Michale      | 8.71 | Information Technology            | 2004-08-14  | Accenture      |        15038 |          2023 |
|          10 |          9 |       10 | Connie       | 8.22 | Computer Engineering              | 2004-03-18  | Northern Trust |        19449 |          2023 |
|          11 |         12 |       11 | Alan         | 8.88 | Electronics and Telecommunication | 2004-04-29  | Barclays       |        16222 |          2022 |
|          12 |         14 |       12 | Norean       | 8.94 | Information Technology            | 2004-06-06  | Arista         |        19063 |          2024 |
|          13 |         15 |       13 | Vernen       | 8.73 | Computer Engineering              | 2004-10-27  | TCS            |        17055 |          2023 |
|          14 |          2 |       14 | Dore         | 8.71 | Electronics and Telecommunication | 2004-08-10  | Accenture      |        17840 |          2024 |
|          15 |         17 |       15 | Shandee      | 8.55 | Information Technology            | 2004-05-14  | Northern Trust |        15971 |          2024 |
|          16 |         18 |       16 | Jonah        | 8.11 | Computer Engineering              | 2004-08-08  | Arista         |        18433 |          2024 |
|          17 |         13 |       17 | Kacy         | 8.24 | Electronics and Telecommunication | 2004-06-23  | Barclays       |        18350 |          2023 |
|          18 |          1 |       18 | Patric       | 8.46 | Information Technology            | 2004-04-06  | TCS            |        15593 |          2022 |
|          19 |         19 |       19 | Lou          | 8.36 | Computer Engineering              | 2004-07-14  | Accenture      |        18444 |          2024 |
|          20 |         11 |       20 | Palm         | 8.18 | Electronics and Telecommunication | 2004-05-04  | TCS            |        17880 |          2022 |
+-------------+------------+----------+--------------+------+-----------------------------------+-------------+----------------+--------------+---------------+
20 rows in set (0.00 sec)

mysql> CREATE VIEW Student_View AS SELECT student_id, student_name, cgpa, student_branch, student_dob FROM Student;
Query OK, 0 rows affected (0.031 sec)

mysql> desc Student_View;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| student_id     | int(11)      | NO   |     | 0       |       |
| student_name   | varchar(50)  | NO   |     | NULL    |       |
| cgpa           | decimal(4,2) | NO   |     | NULL    |       |
| student_branch | varchar(50)  | NO   |     | NULL    |       |
| student_dob    | date         | NO   |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
5 rows in set (0.003 sec)

mysql> select * from Student_View;
+------------+--------------+------+-----------------------------------+-------------+
| student_id | student_name | cgpa | student_branch                    | student_dob |
+------------+--------------+------+-----------------------------------+-------------+
|          1 | Patric       | 8.46 | Information Technology            | 2004-04-06  |
|          2 | Dore         | 8.71 | Electronics and Telecommunication | 2004-08-10  |
|          3 | Drusi        | 8.68 | Electronics and Telecommunication | 2004-03-17  |
|          4 | Douglas      | 8.24 | Information Technology            | 2004-03-19  |
|          5 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  |
|          6 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  |
|          7 | Ann          | 8.28 | Computer Engineering              | 2004-05-31  |
|          8 | Arabelle     | 8.08 | Electronics and Telecommunication | 2004-03-20  |
|          9 | Connie       | 8.22 | Computer Engineering              | 2004-03-18  |
|         10 | Lainey       | 8.75 | Electronics and Telecommunication | 2004-08-15  |
|         11 | Palm         | 8.18 | Electronics and Telecommunication | 2004-05-04  |
|         12 | Alan         | 8.88 | Electronics and Telecommunication | 2004-04-29  |
|         13 | Kacy         | 8.24 | Electronics and Telecommunication | 2004-06-23  |
|         14 | Norean       | 8.94 | Information Technology            | 2004-06-06  |
|         15 | Vernen       | 8.73 | Computer Engineering              | 2004-10-27  |
|         16 | Michale      | 8.71 | Information Technology            | 2004-08-14  |
|         17 | Shandee      | 8.55 | Information Technology            | 2004-05-14  |
|         18 | Jonah        | 8.11 | Computer Engineering              | 2004-08-08  |
|         19 | Lou          | 8.36 | Computer Engineering              | 2004-07-14  |
|         20 | Ewart        | 8.12 | Information Technology            | 2004-07-28  |
+------------+--------------+------+-----------------------------------+-------------+
21 rows in set (0.002 sec)

mysql> INSERT INTO Student_View (student_name, cgpa, student_branch, student_dob) VALUES ('ABHISHEK', 9.32, 'Computer Engineering', '2004-05-24');
Query OK, 1 row affected (0.031 sec)

mysql> select * from Student_View;
+------------+--------------+------+-----------------------------------+-------------+
| student_id | student_name | cgpa | student_branch                    | student_dob |
+------------+--------------+------+-----------------------------------+-------------+
|          1 | Patric       | 8.46 | Information Technology            | 2004-04-06  |
|          2 | Dore         | 8.71 | Electronics and Telecommunication | 2004-08-10  |
|          3 | Drusi        | 8.68 | Electronics and Telecommunication | 2004-03-17  |
|          4 | Douglas      | 8.24 | Information Technology            | 2004-03-19  |
|          5 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  |
|          6 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  |
|          7 | Ann          | 8.28 | Computer Engineering              | 2004-05-31  |
|          8 | Arabelle     | 8.08 | Electronics and Telecommunication | 2004-03-20  |
|          9 | Connie       | 8.22 | Computer Engineering              | 2004-03-18  |
|         10 | Lainey       | 8.75 | Electronics and Telecommunication | 2004-08-15  |
|         11 | Palm         | 8.18 | Electronics and Telecommunication | 2004-05-04  |
|         12 | Alan         | 8.88 | Electronics and Telecommunication | 2004-04-29  |
|         13 | Kacy         | 8.24 | Electronics and Telecommunication | 2004-06-23  |
|         14 | Norean       | 8.94 | Information Technology            | 2004-06-06  |
|         15 | Vernen       | 8.73 | Computer Engineering              | 2004-10-27  |
|         16 | Michale      | 8.71 | Information Technology            | 2004-08-14  |
|         17 | Shandee      | 8.55 | Information Technology            | 2004-05-14  |
|         18 | Jonah        | 8.11 | Computer Engineering              | 2004-08-08  |
|         19 | Lou          | 8.36 | Computer Engineering              | 2004-07-14  |
|         20 | Ewart        | 8.12 | Information Technology            | 2004-07-28  |
|         21 | ABHISHEK     | 9.32 | Computer Engineering              | 2004-05-24  |
+------------+--------------+------+-----------------------------------+-------------+
21 rows in set (0.002 sec)

mysql> UPDATE Student_View SET cgpa = 8.87 WHERE student_name = 'ABHISHEK';
Query OK, 1 row affected (0.031 sec)

mysql> select * from Student_View;
+------------+--------------+------+-----------------------------------+-------------+
| student_id | student_name | cgpa | student_branch                    | student_dob |
+------------+--------------+------+-----------------------------------+-------------+
|          1 | Patric       | 8.46 | Information Technology            | 2004-04-06  |
|          2 | Dore         | 8.71 | Electronics and Telecommunication | 2004-08-10  |
|          3 | Drusi        | 8.68 | Electronics and Telecommunication | 2004-03-17  |
|          4 | Douglas      | 8.24 | Information Technology            | 2004-03-19  |
|          5 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  |
|          6 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  |
|          7 | Ann          | 8.28 | Computer Engineering              | 2004-05-31  |
|          8 | Arabelle     | 8.08 | Electronics and Telecommunication | 2004-03-20  |
|          9 | Connie       | 8.22 | Computer Engineering              | 2004-03-18  |
|         10 | Lainey       | 8.75 | Electronics and Telecommunication | 2004-08-15  |
|         11 | Palm         | 8.18 | Electronics and Telecommunication | 2004-05-04  |
|         12 | Alan         | 8.88 | Electronics and Telecommunication | 2004-04-29  |
|         13 | Kacy         | 8.24 | Electronics and Telecommunication | 2004-06-23  |
|         14 | Norean       | 8.94 | Information Technology            | 2004-06-06  |
|         15 | Vernen       | 8.73 | Computer Engineering              | 2004-10-27  |
|         16 | Michale      | 8.71 | Information Technology            | 2004-08-14  |
|         17 | Shandee      | 8.55 | Information Technology            | 2004-05-14  |
|         18 | Jonah        | 8.11 | Computer Engineering              | 2004-08-08  |
|         19 | Lou          | 8.36 | Computer Engineering              | 2004-07-14  |
|         20 | Ewart        | 8.12 | Information Technology            | 2004-07-28  |
|         21 | ABHISHEK     | 8.87 | Computer Engineering              | 2004-05-24  |
+------------+--------------+------+-----------------------------------+-------------+
21 rows in set (0.002 sec)


mysql> DELETE FROM Student_View WHERE student_name = 'ABHISHEK';
Query OK, 1 row affected (0.031 sec)

mysql> select * from Student_View;
+------------+--------------+------+-----------------------------------+-------------+
| student_id | student_name | cgpa | student_branch                    | student_dob |
+------------+--------------+------+-----------------------------------+-------------+
|          1 | Patric       | 8.46 | Information Technology            | 2004-04-06  |
|          2 | Dore         | 8.71 | Electronics and Telecommunication | 2004-08-10  |
|          3 | Drusi        | 8.68 | Electronics and Telecommunication | 2004-03-17  |
|          4 | Douglas      | 8.24 | Information Technology            | 2004-03-19  |
|          5 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  |
|          6 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  |
|          7 | Ann          | 8.28 | Computer Engineering              | 2004-05-31  |
|          8 | Arabelle     | 8.08 | Electronics and Telecommunication | 2004-03-20  |
|          9 | Connie       | 8.22 | Computer Engineering              | 2004-03-18  |
|         10 | Lainey       | 8.75 | Electronics and Telecommunication | 2004-08-15  |
|         11 | Palm         | 8.18 | Electronics and Telecommunication | 2004-05-04  |
|         12 | Alan         | 8.88 | Electronics and Telecommunication | 2004-04-29  |
|         13 | Kacy         | 8.24 | Electronics and Telecommunication | 2004-06-23  |
|         14 | Norean       | 8.94 | Information Technology            | 2004-06-06  |
|         15 | Vernen       | 8.73 | Computer Engineering              | 2004-10-27  |
|         16 | Michale      | 8.71 | Information Technology            | 2004-08-14  |
|         17 | Shandee      | 8.55 | Information Technology            | 2004-05-14  |
|         18 | Jonah        | 8.11 | Computer Engineering              | 2004-08-08  |
|         19 | Lou          | 8.36 | Computer Engineering              | 2004-07-14  |
|         20 | Ewart        | 8.12 | Information Technology            | 2004-07-28  |
+------------+--------------+------+-----------------------------------+-------------+
21 rows in set (0.002 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> \q
Bye
pict@pict-OptiPlex-SFF-Plus-7010:~$ exit
*/
