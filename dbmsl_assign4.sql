DROP TABLE Fine;
DROP TABLE Borrower;

CREATE TABLE Borrower(
    rollNo      INT             PRIMARY KEY,
    name        VARCHAR(50)     NOT NULL,
    dateOfIssue DATE            NOT NULL,
    nameOfBook  VARCHAR(100)    NOT NULL,
    status      CHAR            NOT NULL
);

CREATE TABLE Fine(
    rollNo INT,
    date DATE,
    amt FLOAT,
    FOREIGN KEY(rollNo) REFERENCES Borrower(rollNo)
);


INSERT INTO Borrower VALUES(1, 'Shrihari', '2024-06-24', 'Hitchhikers Guide To The Galaxy', 'I'), (2, 'Chaitanya', '2024-07-18', 'Percy Jackson: The Sea of Monsters', 'I'), (3, 'Varad', '2024-06-26', 'Maze Runner 3', 'I'), (4, 'Shreyas', '2024-07-31', 'Harry Potter and the Deathly Hallows', 'I'), (5, 'Pranav', '2024-05-21', 'The War of Lanka', 'I');

SELECT * FROM Borrower;
SELECT * FROM Fine;

DROP PROCEDURE IF EXISTS MyProc;

DELIMITER //

CREATE PROCEDURE MyProc(IN rno INT)
BEGIN
    DECLARE dayDiff INT;
    DECLARE fineAmt FLOAT DEFAULT 0;
    DECLARE issue_date DATE;
    DECLARE borrower_not_found INT DEFAULT 0;

    -- Exception handler for when no row is found
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET borrower_not_found = 1;

    -- Fetch issue date
    SELECT dateOfIssue INTO issue_date FROM Borrower WHERE rollNo = rno;

    -- Check if borrower exists
    IF borrower_not_found = 1 THEN
        SELECT 'Borrower not found' AS 'Message';
    ELSE
        -- Calculate day difference
        SET dayDiff = DATEDIFF(CURDATE(), issue_date);

        -- Calculate fine amount
        IF dayDiff > 0 THEN
            IF dayDiff <= 15 THEN
                SET fineAmt = 0;
            ELSEIF dayDiff <= 30 THEN
                SET fineAmt = (dayDiff - 15) * 5;
            ELSE
                SET fineAmt = (30 * 5) + ((dayDiff - 30) * 50);
            END IF;
        ELSE
            SET fineAmt = 0;
        END IF;

        -- Notify Fine Amount Payable
        SELECT fineAmt AS 'Amt. Payable';

        -- Insert fine if applicable
        IF fineAmt > 0 THEN
            INSERT INTO Fine (rollNo, date, amt) VALUES (rno, CURDATE(), fineAmt);
        END IF;

        -- Update borrower status
        UPDATE Borrower SET status = 'R' WHERE rollNo = rno;

        -- Notify book return
        SELECT '!! Book Submitted !!' AS 'Message';
    END IF;
END;
//

DELIMITER ;

CALL MyProc(5);

SELECT * FROM Fine;
SELECT * FROM Borrower;

DROP PROCEDURE IF EXISTS CircleArea;

DELIMITER //

CREATE PROCEDURE CircleArea(IN radius INT)
BEGIN
    DECLARE area FLOAT;

    -- Exception handler for invalid radius
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- This block will be executed if an exception occurs
        SELECT 'An error occurred, please check the input values.' AS 'Error';
    END;

    -- Check if the radius is valid
    IF radius <= 0 OR radius >= 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Radius must be greater than 0 and less than 10';
    ELSE
        -- Calculate the area if radius is greater than 0
        SET area = radius * radius * PI();
        SELECT radius as 'Radius', area AS 'Area of Circle';
    END IF;
END;
//

DELIMITER ;

CALL CircleArea(7);

/*

OUTPUT :- 

mysql> DROP TABLE Fine;
Query OK, 0 rows affected (0.11 sec)

mysql> DROP TABLE Borrower;
Query OK, 0 rows affected (0.14 sec)

mysql> CREATE TABLE Borrower(
    ->     rollNo      INT             PRIMARY KEY,
    ->     name        VARCHAR(50)     NOT NULL,
    ->     dateOfIssue DATE            NOT NULL,
    ->     nameOfBook  VARCHAR(100)    NOT NULL,
    ->     status      CHAR            NOT NULL
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> CREATE TABLE Fine(
    ->     rollNo INT,
    ->     date DATE,
    ->     amt FLOAT,
    ->     FOREIGN KEY(rollNo) REFERENCES Borrower(rollNo)
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql> INSERT INTO Borrower VALUES(1, 'Shrihari', '2024-06-24', 'Hitchhikers Guide To The Galaxy', 'I'), (2, 'Chaitanya', '2024-07-18', 'Percy Jackson: The Sea of Monsters', 'I'), (3, 'Varad', '2024-06-26', 'Maze Runner 3', 'I'), (4, 'Shreyas', '2024-07-31', 'Harry Potter and the Deathly Hallows', 'I'), (5, 'Pranav', '2024-05-21', 'The War of Lanka', 'I');
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Borrower;
+--------+-----------+-------------+--------------------------------------+--------+
| rollNo | name      | dateOfIssue | nameOfBook                           | status |
+--------+-----------+-------------+--------------------------------------+--------+
|      1 | Shrihari  | 2024-06-24  | Hitchhikers Guide To The Galaxy      | I      |
|      2 | Chaitanya | 2024-07-18  | Percy Jackson: The Sea of Monsters   | I      |
|      3 | Varad     | 2024-06-26  | Maze Runner 3                        | I      |
|      4 | Shreyas   | 2024-07-31  | Harry Potter and the Deathly Hallows | I      |
|      5 | Pranav    | 2024-05-21  | The War of Lanka                     | I      |
+--------+-----------+-------------+--------------------------------------+--------+
5 rows in set (0.01 sec)

mysql> 
mysql> SELECT * FROM Fine;
Empty set (0.00 sec)

mysql> DROP PROCEDURE IF EXISTS MyProc;
Query OK, 0 rows affected (0.05 sec)

mysql> DELIMITER //
mysql> CREATE PROCEDURE MyProc(IN rno INT)
    -> BEGIN
    ->     DECLARE dayDiff INT;
    ->     DECLARE fineAmt FLOAT DEFAULT 0;
    ->     DECLARE issue_date DATE;
    ->     DECLARE borrower_not_found INT DEFAULT 0;
    -> 
    ->     -- Exception handler for when no row is found
    ->     DECLARE CONTINUE HANDLER FOR NOT FOUND SET borrower_not_found = 1;
    -> 
    ->     -- Fetch issue date
    ->     SELECT dateOfIssue INTO issue_date FROM Borrower WHERE rollNo = rno;
    -> 
    ->     -- Check if borrower exists
    ->     IF borrower_not_found = 1 THEN
    ->         SELECT 'Borrower not found' AS 'Message';
    ->     ELSE
    ->         -- Calculate day difference
    ->         SET dayDiff = DATEDIFF(CURDATE(), issue_date);
    -> 
    ->         -- Calculate fine amount
    ->         IF dayDiff > 0 THEN
    ->             IF dayDiff <= 15 THEN
    ->                 SET fineAmt = 0;
    ->             ELSEIF dayDiff <= 30 THEN
    ->                 SET fineAmt = (dayDiff - 15) * 5;
    ->             ELSE
    ->                 SET fineAmt = (30 * 5) + ((dayDiff - 30) * 50);
    ->             END IF;
    ->         ELSE
    ->             SET fineAmt = 0;
    ->         END IF;
    -> 
    ->         -- Notify Fine Amount Payable
    ->         SELECT fineAmt AS 'Amt. Payable';
    -> 
    ->         -- Insert fine if applicable
    ->         IF fineAmt > 0 THEN
    ->             INSERT INTO Fine (rollNo, date, amt) VALUES (rno, CURDATE(), fineAmt);
    ->         END IF;
    -> 
    ->         -- Update borrower status
    ->         UPDATE Borrower SET status = 'R' WHERE rollNo = rno;
    -> 
    ->         -- Notify book return
    ->         SELECT '!! Book Submitted !!' AS 'Message';
    ->     END IF;
    -> END;
    -> //
Query OK, 0 rows affected (0.06 sec)

mysql> DELIMITER ;
mysql> CALL MyProc(5);
+--------------+
| Amt. Payable |
+--------------+
|         2550 |
+--------------+
1 row in set (0.00 sec)

+----------------------+
| Message              |
+----------------------+
| !! Book Submitted !! |
+----------------------+
1 row in set (0.07 sec)

Query OK, 3 rows affected (0.07 sec)

mysql> SELECT * FROM Fine;
+--------+------------+------+
| rollNo | date       | amt  |
+--------+------------+------+
|      5 | 2024-08-07 | 2550 |
+--------+------------+------+
1 row in set (0.00 sec)

mysql> SELECT * FROM Borrower;
+--------+-----------+-------------+--------------------------------------+--------+
| rollNo | name      | dateOfIssue | nameOfBook                           | status |
+--------+-----------+-------------+--------------------------------------+--------+
|      1 | Shrihari  | 2024-06-24  | Hitchhikers Guide To The Galaxy      | I      |
|      2 | Chaitanya | 2024-07-18  | Percy Jackson: The Sea of Monsters   | I      |
|      3 | Varad     | 2024-06-26  | Maze Runner 3                        | I      |
|      4 | Shreyas   | 2024-07-31  | Harry Potter and the Deathly Hallows | I      |
|      5 | Pranav    | 2024-05-21  | The War of Lanka                     | R      |
+--------+-----------+-------------+--------------------------------------+--------+
5 rows in set (0.00 sec)

mysql> DROP PROCEDURE IF EXISTS CircleArea;
Query OK, 0 rows affected (0.10 sec)

mysql> DELIMITER //
mysql> CREATE PROCEDURE CircleArea(IN radius INT)
    -> BEGIN
    ->     DECLARE area FLOAT;
    -> 
    ->     -- Exception handler for invalid radius
    ->     DECLARE EXIT HANDLER FOR SQLEXCEPTION
    ->     BEGIN
    ->         -- This block will be executed if an exception occurs
    ->         SELECT 'An error occurred, please check the input values.' AS 'Error';
    ->     END;
    -> 
    ->     -- Check if the radius is valid
    ->     IF radius <= 0 OR radius >= 10 THEN
    ->         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Radius must be greater than 0 and less than 10';
    ->     ELSE
    ->         -- Calculate the area if radius is greater than 0
    ->         SET area = radius * radius * PI();
    ->         SELECT radius as 'Radius', area AS 'Area of Circle';
    ->     END IF;
    -> END;
    -> //
Query OK, 0 rows affected (0.08 sec)

mysql> DELIMITER ;
mysql> CALL CircleArea(7);
+--------+----------------+
| Radius | Area of Circle |
+--------+----------------+
|      7 |        153.938 |
+--------+----------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

*/