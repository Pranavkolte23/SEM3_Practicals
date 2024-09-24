DROP TABLE IF EXISTS Library;
DROP TABLE IF EXISTS Library_Audit;

CREATE TABLE Library (
    bookId INT PRIMARY KEY AUTO_INCREMENT,
    bookName VARCHAR(100),
    isIssued VARCHAR(1),
    issueStudentRollNo VARCHAR(10)
);

CREATE TABLE Library_Audit (
    bookId INT,
    bookName VARCHAR(100),
    isIssued VARCHAR(1),
    issueStudentRollNo VARCHAR(10),
    action VARCHAR(50)
);

INSERT INTO Library (bookName, isIssued, issueStudentRollNo) VALUES ('Introduction to Algorithms', 'Y', '101');
INSERT INTO Library (bookName, isIssued, issueStudentRollNo) VALUES ('Clean Code', 'N', NULL);
INSERT INTO Library (bookName, isIssued, issueStudentRollNo) VALUES ('Design Patterns', 'Y', '202');
INSERT INTO Library (bookName, isIssued, issueStudentRollNo) VALUES ('The Pragmatic Programmer', 'N', NULL);
INSERT INTO Library (bookName, isIssued, issueStudentRollNo) VALUES ('Artificial Intelligence: A Modern Approach', 'Y', '303');

DROP TRIGGGER IF EXISTS lib_before_update;
DROP TRIGGGER IF EXISTS lib_before_delete;

DELIMITER //

CREATE TRIGGER lib_before_update BEFORE UPDATE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (bookId, bookName, isIssued, issueStudentRollNo, action) 
    VALUES (OLD.bookId, OLD.bookName, OLD.isIssued, OLD.issueStudentRollNo, 'UPDATE');
END //

CREATE TRIGGER lib_before_delete BEFORE DELETE ON Library
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (bookId, bookName, isIssued, issueStudentRollNo, action) 
    VALUES (OLD.bookId, OLD.bookName, OLD.isIssued, OLD.issueStudentRollNo, 'DELETE');
END //

DELIMITER ;

SELECT * FROM Library_Audit;

UPDATE Library SET isIssued = 'N', issueStudentRollNo = NULL WHERE bookId = 1;
UPDATE Library SET isIssued = 'Y', issueStudentRollNo = '104' WHERE bookId = 2;
UPDATE Library SET isIssued = 'N', issueStudentRollNo = NULL WHERE bookId = 3;
UPDATE Library SET isIssued = 'Y', issueStudentRollNo = '107' WHERE bookId = 4;

DELETE FROM Library WHERE bookId = 1;
DELETE FROM Library WHERE bookId = 2;
DELETE FROM Library WHERE bookId = 3;
DELETE FROM Library WHERE bookId = 4;

SELECT * FROM Library_Audit;

/*

OUTPUT :-

mysql> DROP TABLE IF EXISTS Library;
Query OK, 0 rows affected (0.14 sec)

mysql> DROP TABLE IF EXISTS Library_Audit;
Query OK, 0 rows affected (0.14 sec)

mysql> 
mysql> CREATE TABLE Library (
    ->     bookId INT PRIMARY KEY AUTO_INCREMENT,
    ->     bookName VARCHAR(100),
    ->     isIssued VARCHAR(1),
    ->     issueStudentRollNo VARCHAR(10)
    -> );
Query OK, 0 rows affected (0.30 sec)

mysql> 
mysql> CREATE TABLE Library_Audit (
    ->     bookId INT,
    ->     bookName VARCHAR(100),
    ->     isIssued VARCHAR(1),
    ->     issueStudentRollNo VARCHAR(10),
    ->     action VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> 
mysql> INSERT INTO Library (bookName, isIssued, issueStudentRollNo) VALUES ('Introduction to Algorithms', 'Y', '101');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Library (bookName, isIssued, issueStudentRollNo) VALUES ('Clean Code', 'N', NULL);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Library (bookName, isIssued, issueStudentRollNo) VALUES ('Design Patterns', 'Y', '202');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO Library (bookName, isIssued, issueStudentRollNo) VALUES ('The Pragmatic Programmer', 'N', NULL);
Query OK, 1 row affected (0.07 sec)

mysql> INSERT INTO Library (bookName, isIssued, issueStudentRollNo) VALUES ('Artificial Intelligence: A Modern Approach', 'Y', '303');
Query OK, 1 row affected (0.03 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE TRIGGER lib_before_update BEFORE UPDATE ON Library
    -> FOR EACH ROW
    -> BEGIN
    ->     INSERT INTO Library_Audit (bookId, bookName, isIssued, issueStudentRollNo, action) 
    ->     VALUES (OLD.bookId, OLD.bookName, OLD.isIssued, OLD.issueStudentRollNo, 'UPDATE');
    -> END //
Query OK, 0 rows affected (0.06 sec)

mysql> 
mysql> CREATE TRIGGER lib_before_delete BEFORE DELETE ON Library
    -> FOR EACH ROW
    -> BEGIN
    ->     INSERT INTO Library_Audit (bookId, bookName, isIssued, issueStudentRollNo, action) 
    ->     VALUES (OLD.bookId, OLD.bookName, OLD.isIssued, OLD.issueStudentRollNo, 'DELETE');
    -> END //
Query OK, 0 rows affected (0.06 sec)

mysql> 
mysql> DELIMITER ;
mysql> 
mysql> SELECT * FROM Library_Audit;
Empty set (0.00 sec)

mysql> 
mysql> UPDATE Library SET isIssued = 'N', issueStudentRollNo = NULL WHERE bookId = 1;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Library SET isIssued = 'Y', issueStudentRollNo = '104' WHERE bookId = 2;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Library SET isIssued = 'N', issueStudentRollNo = NULL WHERE bookId = 3;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Library SET isIssued = 'Y', issueStudentRollNo = '107' WHERE bookId = 4;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> 
mysql> DELETE FROM Library WHERE bookId = 1;
Query OK, 1 row affected (0.03 sec)

mysql> DELETE FROM Library WHERE bookId = 2;
Query OK, 1 row affected (0.04 sec)

mysql> DELETE FROM Library WHERE bookId = 3;
Query OK, 1 row affected (0.04 sec)

mysql> DELETE FROM Library WHERE bookId = 4;
Query OK, 1 row affected (0.12 sec)

mysql> 
mysql> SELECT * FROM Library_Audit;
+--------+----------------------------+----------+--------------------+--------+
| bookId | bookName                   | isIssued | issueStudentRollNo | action |
+--------+----------------------------+----------+--------------------+--------+
|      1 | Introduction to Algorithms | Y        | 101                | UPDATE |
|      2 | Clean Code                 | N        | NULL               | UPDATE |
|      3 | Design Patterns            | Y        | 202                | UPDATE |
|      4 | The Pragmatic Programmer   | N        | NULL               | UPDATE |
|      1 | Introduction to Algorithms | N        | NULL               | DELETE |
|      2 | Clean Code                 | Y        | 104                | DELETE |
|      3 | Design Patterns            | N        | NULL               | DELETE |
|      4 | The Pragmatic Programmer   | Y        | 107                | DELETE |
+--------+----------------------------+----------+--------------------+--------+
8 rows in set (0.00 sec)

mysql> 

*/