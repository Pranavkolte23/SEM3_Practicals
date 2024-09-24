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


-- Assignment 2
SELECT * FROM Student WHERE (student_name LIKE 'A%' OR student_name LIKE 'D%') AND student_branch in ('Computer Engineering', 'Information Technology');
SELECT DISTINCT(company_name) FROM PlacementDrive;
UPDATE Training SET training_fee = training_fee * 1.15 WHERE training_year = 2022;
DELETE FROM Student WHERE cgpa < 8.3;
SELECT company_name from PlacementDrive WHERE placed_loc IN ('Pune', 'Banglore');
SELECT * FROM Training WHERE training_year in (2022, 2023);
SELECT student_name FROM Student WHERE cgpa = (SELECT MAX(cgpa) FROM Student);
SELECT student_name FROM Student WHERE cgpa >= 8.4 AND cgpa <= 8.7;
SELECT s.student_name, t.training_id, t.training_fee FROM Student s JOIN Training t ON t.training_id = s.training_id ORDER BY t.training_fee DESC;
SELECT p.company_name, s.student_name, p.placed_loc, p.package FROM Student s JOIN PlacementDrive p ON s.drive_id = p.drive_id WHERE package > 10 AND package < 20;
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

mysql> SELECT * FROM Student WHERE (student_name LIKE 'A%' OR student_name LIKE 'D%') AND student_branch in ('Computer Engineering', 'Information Technology');
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
| student_id | drive_id | training_id | student_name | cgpa | student_branch                    | student_dob |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
|          4 |        6 |           6 | Douglas      | 8.24 | Information Technology            | 2004-03-19  |
|          5 |        7 |           7 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  |
|          6 |        1 |           1 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  |
|          7 |        4 |           4 | Ann          | 8.28 | Computer Engineering              | 2004-05-31  |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
6 rows in set (0.00 sec)

mysql> SELECT DISTINCT(company_name) FROM PlacementDrive;
+--------------+
| company_name |
+--------------+
| Amazon       |
| Salesforce   |
| Google       |
| Atlassian    |
| LinkedIn     |
| Facebook     |
+--------------+
6 rows in set (0.00 sec)

mysql> UPDATE Training SET training_fee = training_fee * 1.15 WHERE training_year = 2022;
Query OK, 4 rows affected (0.03 sec)
Rows matched: 4  Changed: 4  Warnings: 0

mysql> SELECT * FROM Training;
+-------------+----------------+--------------+---------------+
| training_id | company_name   | training_fee | training_year |
+-------------+----------------+--------------+---------------+
|           1 | TCS            |        18638 |          2024 |
|           2 | TCS            |        15856 |          2024 |
|           3 | Barclays       |        19277 |          2024 |
|           4 | Northern Trust |        17720 |          2022 |
|           5 | Accenture      |        15835 |          2024 |
|           6 | Deloitte       |        15827 |          2024 |
|           7 | Barclays       |        16998 |          2023 |
|           8 | TCS            |        18028 |          2023 |
|           9 | Accenture      |        15038 |          2023 |
|          10 | Northern Trust |        19449 |          2023 |
|          11 | Barclays       |        18655 |          2022 |
|          12 | Arista         |        19063 |          2024 |
|          13 | TCS            |        17055 |          2023 |
|          14 | Accenture      |        17840 |          2024 |
|          15 | Northern Trust |        15971 |          2024 |
|          16 | Arista         |        18433 |          2024 |
|          17 | Barclays       |        18350 |          2023 |
|          18 | TCS            |        17932 |          2022 |
|          19 | Accenture      |        18444 |          2024 |
|          20 | TCS            |        20562 |          2022 |
+-------------+----------------+--------------+---------------+
20 rows in set (0.00 sec)

mysql> DELETE FROM Student WHERE cgpa < 8.3;
Query OK, 8 rows affected (0.03 sec)

mysql> select * from Student;
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
| student_id | drive_id | training_id | student_name | cgpa | student_branch                    | student_dob |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
|          1 |       18 |          18 | Patric       | 8.46 | Information Technology            | 2004-04-06  |
|          2 |       14 |          14 | Dore         | 8.71 | Electronics and Telecommunication | 2004-08-10  |
|          3 |        2 |           2 | Drusi        | 8.68 | Electronics and Telecommunication | 2004-03-17  |
|          5 |        7 |           7 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  |
|          6 |        1 |           1 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  |
|         10 |        5 |           5 | Lainey       | 8.75 | Electronics and Telecommunication | 2004-08-15  |
|         12 |       11 |          11 | Alan         | 8.88 | Electronics and Telecommunication | 2004-04-29  |
|         14 |       12 |          12 | Norean       | 8.94 | Information Technology            | 2004-06-06  |
|         15 |       13 |          13 | Vernen       | 8.73 | Computer Engineering              | 2004-10-27  |
|         16 |        9 |           9 | Michale      | 8.71 | Information Technology            | 2004-08-14  |
|         17 |       15 |          15 | Shandee      | 8.55 | Information Technology            | 2004-05-14  |
|         19 |       19 |          19 | Lou          | 8.36 | Computer Engineering              | 2004-07-14  |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
12 rows in set (0.00 sec)

mysql> SELECT company_name from PlacementDrive WHERE placed_loc IN ('Pune', 'Banglore');
+--------------+
| company_name |
+--------------+
| Google       |
| Google       |
| Facebook     |
| Salesforce   |
| Atlassian    |
| LinkedIn     |
| Facebook     |
| LinkedIn     |
+--------------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM Training WHERE training_year in (2022, 2023);
+-------------+----------------+--------------+---------------+
| training_id | company_name   | training_fee | training_year |
+-------------+----------------+--------------+---------------+
|           4 | Northern Trust |        17720 |          2022 |
|           7 | Barclays       |        16998 |          2023 |
|           8 | TCS            |        18028 |          2023 |
|           9 | Accenture      |        15038 |          2023 |
|          10 | Northern Trust |        19449 |          2023 |
|          11 | Barclays       |        18655 |          2022 |
|          13 | TCS            |        17055 |          2023 |
|          17 | Barclays       |        18350 |          2023 |
|          18 | TCS            |        17932 |          2022 |
|          20 | TCS            |        20562 |          2022 |
+-------------+----------------+--------------+---------------+
10 rows in set (0.00 sec)

mysql> SELECT student_name FROM Student WHERE cgpa = (SELECT MAX(cgpa) FROM Student);
+--------------+
| student_name |
+--------------+
| Norean       |
+--------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM Student;
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
| student_id | drive_id | training_id | student_name | cgpa | student_branch                    | student_dob |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
|          1 |       18 |          18 | Patric       | 8.46 | Information Technology            | 2004-04-06  |
|          2 |       14 |          14 | Dore         | 8.71 | Electronics and Telecommunication | 2004-08-10  |
|          3 |        2 |           2 | Drusi        | 8.68 | Electronics and Telecommunication | 2004-03-17  |
|          5 |        7 |           7 | Dennie       | 8.53 | Computer Engineering              | 2004-12-29  |
|          6 |        1 |           1 | Adela        | 8.69 | Computer Engineering              | 2004-08-17  |
|         10 |        5 |           5 | Lainey       | 8.75 | Electronics and Telecommunication | 2004-08-15  |
|         12 |       11 |          11 | Alan         | 8.88 | Electronics and Telecommunication | 2004-04-29  |
|         14 |       12 |          12 | Norean       | 8.94 | Information Technology            | 2004-06-06  |
|         15 |       13 |          13 | Vernen       | 8.73 | Computer Engineering              | 2004-10-27  |
|         16 |        9 |           9 | Michale      | 8.71 | Information Technology            | 2004-08-14  |
|         17 |       15 |          15 | Shandee      | 8.55 | Information Technology            | 2004-05-14  |
|         19 |       19 |          19 | Lou          | 8.36 | Computer Engineering              | 2004-07-14  |
+------------+----------+-------------+--------------+------+-----------------------------------+-------------+
12 rows in set (0.00 sec)

mysql> SELECT student_name FROM Student WHERE cgpa >= 8.4 AND cgpa <= 8.7;
+--------------+
| student_name |
+--------------+
| Patric       |
| Drusi        |
| Dennie       |
| Adela        |
| Shandee      |
+--------------+
5 rows in set (0.00 sec)

mysql> SELECT s.student_name, t.training_id, t.training_fee FROM Student s JOIN Training t ON t.training_id = s.training_id ORDER BY t.training_fee DESC;
+--------------+-------------+--------------+
| student_name | training_id | training_fee |
+--------------+-------------+--------------+
| Norean       |          12 |        19063 |
| Alan         |          11 |        18655 |
| Adela        |           1 |        18638 |
| Lou          |          19 |        18444 |
| Patric       |          18 |        17932 |
| Dore         |          14 |        17840 |
| Vernen       |          13 |        17055 |
| Dennie       |           7 |        16998 |
| Shandee      |          15 |        15971 |
| Drusi        |           2 |        15856 |
| Lainey       |           5 |        15835 |
| Michale      |           9 |        15038 |
+--------------+-------------+--------------+
12 rows in set (0.00 sec)

mysql> SELECT p.company_name, s.student_name, p.placed_loc, p.package FROM Student s JOIN PlacementDrive p ON s.drive_id = p.drive_id WHERE package > 10 AND package < 20 GROUP BY placed_loc;
+--------------+--------------+------------+---------+
| company_name | student_name | placed_loc | package |
+--------------+--------------+------------+---------+
| Salesforce   | Dore         | Banglore   |   18.00 |
| Atlassian    | Norean       | Gurgaon    |   16.00 |
| Facebook     | Alan         | Noida      |   15.00 |
+--------------+--------------+------------+---------+
3 rows in set (0.00 sec)

mysql> SELECT p.company_name, s.student_name, p.placed_loc, p.package FROM Student s JOIN PlacementDrive p ON s.drive_id = p.drive_id WHERE package > 10 AND package < 20;
+--------------+--------------+------------+---------+
| company_name | student_name | placed_loc | package |
+--------------+--------------+------------+---------+
| Salesforce   | Dore         | Banglore   |   18.00 |
| Google       | Dennie       | Banglore   |   11.00 |
| Facebook     | Alan         | Noida      |   15.00 |
| Atlassian    | Norean       | Gurgaon    |   16.00 |
| Facebook     | Vernen       | Banglore   |   17.00 |
| Amazon       | Michale      | Gurgaon    |   13.00 |
| Atlassian    | Shandee      | Gurgaon    |   19.00 |
+--------------+--------------+------------+---------+
7 rows in set (0.01 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> \q
Bye
pict@pict-OptiPlex-SFF-Plus-7010:~$ exit
*/
