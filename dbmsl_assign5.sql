DROP TABLE IF EXISTS Result;
DROP TABLE IF EXISTS Stud_Marks;

CREATE TABLE Stud_Marks(
    rollno INT PRIMARY KEY,
    total_marks INT
);

CREATE TABLE Result(
    rollno INT,
    name varchar(45),
    class varchar(45) DEFAULT NULL,
    FOREIGN KEY(rollno) REFERENCES Stud_Marks(rollno)
);

INSERT INTO Stud_Marks VALUES(1, 1245);
INSERT INTO Stud_Marks VALUES(2, 950);
INSERT INTO Stud_Marks VALUES(3, 850);

INSERT INTO Result VALUES(1, 'VARAD', NULL);
INSERT INTO Result VALUES(2, 'KETAN', NULL);
INSERT INTO Result VALUES(3, 'NIRANJAN', NULL);

DROP PROCEDURE IF EXISTS proc_grade;

DELIMITER //

CREATE PROCEDURE proc_grade(IN rno INT)
BEGIN
    DECLARE marks INT;

    SELECT total_marks INTO marks FROM Stud_Marks WHERE rollno = rno;

    IF marks <= 1500 AND marks >= 990 THEN
        UPDATE Result SET class = 'DISTINCTION' WHERE rollno = rno;
    ELSEIF marks <= 989 AND marks >= 900 THEN
        UPDATE Result SET class = 'FIRST' WHERE rollno = rno;
    ELSEIF marks <= 899 AND marks >= 825 THEN
        UPDATE Result SET class = 'HIGHER SECOND' WHERE rollno = rno;
    END IF;
END
//

DELIMITER ;

CALL proc_grade(1);
CALL proc_grade(2);
CALL proc_grade(3);

SELECT * FROM Result;

/*

OUTPUT :-

mysql> DROP TABLE IF EXISTS Result;
Query OK, 0 rows affected (0.16 sec)

mysql> DROP TABLE IF EXISTS Stud_Marks;
Query OK, 0 rows affected (0.11 sec)

mysql> CREATE TABLE Stud_Marks(
    ->     rollno INT PRIMARY KEY,
    ->     total_marks INT
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> CREATE TABLE Result(
    ->     rollno INT,
    ->     name varchar(45),
    ->     class varchar(45) DEFAULT NULL,
    ->     FOREIGN KEY(rollno) REFERENCES Stud_Marks(rollno)
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql> INSERT INTO Stud_Marks VALUES(1, 1245);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Stud_Marks VALUES(2, 950);
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Stud_Marks VALUES(3, 850);
Query OK, 1 row affected (0.10 sec)

mysql> 
mysql> INSERT INTO Result VALUES(1, 'VARAD', NULL);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Result VALUES(2, 'KETAN', NULL);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Result VALUES(3, 'NIRANJAN', NULL);
Query OK, 1 row affected (0.10 sec)

mysql> 
mysql> DROP PROCEDURE IF EXISTS proc_grade;
Query OK, 0 rows affected (0.08 sec)

mysql> 
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE proc_grade(IN rno INT)
    -> BEGIN
    ->     DECLARE marks INT;
    -> 
    ->     SELECT total_marks INTO marks FROM Stud_Marks WHERE rollno = rno;
    -> 
    ->     IF marks <= 1500 AND marks >= 990 THEN
    ->         UPDATE Result SET class = 'DISTINCTION' WHERE rollno = rno;
    ->     ELSEIF marks <= 989 AND marks >= 900 THEN
    ->         UPDATE Result SET class = 'FIRST' WHERE rollno = rno;
    ->     ELSEIF marks <= 899 AND marks >= 825 THEN
    ->         UPDATE Result SET class = 'HIGHER SECOND' WHERE rollno = rno;
    ->     END IF;
    -> END
    -> //
Query OK, 0 rows affected (0.14 sec)

mysql> 
mysql> DELIMITER ;
mysql> 
mysql> CALL proc_grade(1);
Query OK, 2 rows affected (0.02 sec)

mysql> CALL proc_grade(2);
Query OK, 2 rows affected (0.07 sec)

mysql> CALL proc_grade(3);
Query OK, 2 rows affected (0.03 sec)

mysql> 
mysql> SELECT * FROM Result;
+--------+----------+---------------+
| rollno | name     | class         |
+--------+----------+---------------+
|      1 | VARAD    | DISTINCTION   |
|      2 | KETAN    | FIRST         |
|      3 | NIRANJAN | HIGHER SECOND |
+--------+----------+---------------+
3 rows in set (0.00 sec)

*/
