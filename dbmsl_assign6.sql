DROP TABLE IF EXISTS OldEmp;
DROP TABLE IF EXISTS NewEmp;

CREATE TABLE OldEmp(
    empId INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE NewEmp(
    empId INT PRIMARY KEY,
    name VARCHAR(255)
);


INSERT INTO OldEmp values(1, 'VARAD');
INSERT INTO OldEmp values(2, 'SHREYAS');
INSERT INTO OldEmp values(3, 'PRANAV');
INSERT INTO OldEmp values(4, 'SHREYASH');
INSERT INTO OldEmp values(5, 'CHAITANYA');

INSERT INTO NewEmp values(3, 'PRANAV');
INSERT INTO NewEmp values(1, 'VARAD');

DROP PROCEDURE IF EXISTS merge_emp;

DELIMITER //

CREATE PROCEDURE merge_emp()
BEGIN
    -- Declare variables for cursor
    DECLARE done INT DEFAULT FALSE;
    DECLARE count INT DEFAULT 0;
    DECLARE n_id INT;
    DECLARE n_name VARCHAR(255);

    -- Declare a cursor to select records from OldEmp
    DECLARE cursor_n CURSOR FOR SELECT empId, name FROM OldEmp;

    -- Declare a continue handler to set done to TRUE when cursor is finished
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the cursor
    OPEN cursor_n;

    -- Loop through each record
    read_loop: LOOP
        -- Fetch the current row from the cursor into variables
        FETCH cursor_n INTO n_id, n_name;

        -- If the cursor is done, exit the loop
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT COUNT(*) INTO count FROM NewEmp WHERE empId = n_id;

        IF count = 0 THEN

            SELECT n_id, n_name;

            INSERT INTO NewEmp (empId, name) VALUES (n_id, n_name);
        END IF;
    END LOOP;

    -- Close the cursor
    CLOSE cursor_n;
END //

DELIMITER ;

SELECT * FROM OldEmp;

SELECT * FROM NewEmp;

CALL merge_emp();

SELECT * FROM NewEmp;

/*

OUTPUT :-

mysql> DROP TABLE IF EXISTS OldEmp;
NewEmp;

CREATE TABLE OldEmp(
    empId INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE NewEmp(
    empId INT PRIMARY KEY,
    name VARCHAR(255)
);


INSERT INTO OldEmp values(1, 'VARAD');
INSERT INTO OldEmp values(2, 'SHREYAS');
INSERT INTO OldEmp values(3, 'PRANAV');
INSERT INTO OldEmp values(4, 'SHREYASH');
INSERT INTO OldEmp values(5, 'CHAITANYA');

INSERT INTO NewEmp values(3, 'PRANAV');
INSERT INTO NewEmp values(1, 'VARAD');

DROP PROCEDURE IF EXISTS merge_emp;

DELIMITER //

CREATE PROCEDURE merge_emp()
BEGIN
    -- Declare variables for cursor
    DECLARE done INT DEFAULT FALSE;
    DECLARE count INT DEFAULT 0;
    DECLARE n_id INT;
    DECLARE n_name VARCHAR(255);

    -- Declare a cursor to select records from OldEmp
    DECLARE cursor_n CURSOR FOR SELECT empId, name FROM OldEmp;

    -- Declare a continue handler to set done to TRUE when cursor is finished
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 Query OK, 0 rows affected (0.10 sec)

mysql> DROP TABLE IF EXISTS NewEmp;
   -- Open the cursor
    OPEN cursor_n;

    -- Loop through each record
    read_loop: LOOP
        -- Fetch the current row from the cursor into variables
        FETCH cursor_n INTO n_id, n_name;

        SELECT n_id, n_name;

        -- If the cursor is done, exit the loop
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT COUNT(*) INTO count FROM NewEmp WHERE empId = n_id;

        IF count = 0 THEN
            INSERT INTO NewEmp (empId, name) VALUES (n_id, n_name);
        END IF;
    END LOOP;

    -- Close the cursor
    CLOSE cursor_n;
END //

DELIMITER ;

SELECT * FROM OldEmp;

SELECT * FROM NewEmp;

CALL merge_emp();

SELECT * FROM NewEmp;Query OK, 0 rows affected (0.12 sec)

mysql> 
mysql> CREATE TABLE OldEmp(
    ->     empId INT PRIMARY KEY,
    ->     name VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> 
mysql> CREATE TABLE NewEmp(
    ->     empId INT PRIMARY KEY,
    ->     name VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> 
mysql> 
mysql> INSERT INTO OldEmp values(1, 'VARAD');
Query OK, 1 row affected (0.07 sec)

mysql> INSERT INTO OldEmp values(2, 'SHREYAS');
Query OK, 1 row affected (0.08 sec)

mysql> INSERT INTO OldEmp values(3, 'PRANAV');
Query OK, 1 row affected (0.08 sec)

mysql> INSERT INTO OldEmp values(4, 'SHREYASH');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO OldEmp values(5, 'CHAITANYA');
Query OK, 1 row affected (0.03 sec)

mysql> 
mysql> INSERT INTO NewEmp values(3, 'PRANAV');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO NewEmp values(1, 'VARAD');
Query OK, 1 row affected (0.03 sec)

mysql> 
mysql> DROP PROCEDURE IF EXISTS merge_emp;
Query OK, 0 rows affected (0.05 sec)

mysql> 
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE merge_emp()
    -> BEGIN
    ->     -- Declare variables for cursor
    ->     DECLARE done INT DEFAULT FALSE;
    ->     DECLARE count INT DEFAULT 0;
    ->     DECLARE n_id INT;
    ->     DECLARE n_name VARCHAR(255);
    -> 
    ->     -- Declare a cursor to select records from OldEmp
    ->     DECLARE cursor_n CURSOR FOR SELECT empId, name FROM OldEmp;
    -> 
    ->     -- Declare a continue handler to set done to TRUE when cursor is finished
    ->     DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> 
    ->     -- Open the cursor
    ->     OPEN cursor_n;
    -> 
    ->     -- Loop through each record
    ->     read_loop: LOOP
    ->         -- Fetch the current row from the cursor into variables
    ->         FETCH cursor_n INTO n_id, n_name;
    -> 
    ->         SELECT n_id, n_name;
    -> 
    ->         -- If the cursor is done, exit the loop
    ->         IF done THEN
    ->             LEAVE read_loop;
    ->         END IF;
    -> 
    ->         SELECT COUNT(*) INTO count FROM NewEmp WHERE empId = n_id;
    -> 
    ->         IF count = 0 THEN
    ->             INSERT INTO NewEmp (empId, name) VALUES (n_id, n_name);
    ->         END IF;
    ->     END LOOP;
    -> 
    ->     -- Close the cursor
    ->     CLOSE cursor_n;
    -> END //
Query OK, 0 rows affected (0.06 sec)

mysql> 
mysql> DELIMITER ;
mysql> 
mysql> SELECT * FROM OldEmp;
+-------+-----------+
| empId | name      |
+-------+-----------+
|     1 | VARAD     |
|     2 | SHREYAS   |
|     3 | PRANAV    |
|     4 | SHREYASH  |
|     5 | CHAITANYA |
+-------+-----------+
5 rows in set (0.00 sec)

mysql> 
mysql> SELECT * FROM NewEmp;
+-------+--------+
| empId | name   |
+-------+--------+
|     1 | VARAD  |
|     3 | PRANAV |
+-------+--------+
2 rows in set (0.00 sec)

mysql> 
mysql> CALL merge_emp();
+------+--------+
| n_id | n_name |
+------+--------+
|    1 | VARAD  |
+------+--------+
1 row in set (0.00 sec)

+------+---------+
| n_id | n_name  |
+------+---------+
|    2 | SHREYAS |
+------+---------+
1 row in set (0.00 sec)

+------+--------+
| n_id | n_name |
+------+--------+
|    3 | PRANAV |
+------+--------+
1 row in set (0.08 sec)

+------+----------+
| n_id | n_name   |
+------+----------+
|    4 | SHREYASH |
+------+----------+
1 row in set (0.08 sec)

+------+-----------+
| n_id | n_name    |
+------+-----------+
|    5 | CHAITANYA |
+------+-----------+
1 row in set (0.12 sec)

+------+-----------+
| n_id | n_name    |
+------+-----------+
|    5 | CHAITANYA |
+------+-----------+
1 row in set (0.15 sec)

Query OK, 8 rows affected (0.15 sec)

mysql> 
mysql> SELECT * FROM NewEmp;
+-------+-----------+
| empId | name      |
+-------+-----------+
|     1 | VARAD     |
|     2 | SHREYAS   |
|     3 | PRANAV    |
|     4 | SHREYASH  |
|     5 | CHAITANYA |
+-------+-----------+
5 rows in set (0.00 sec)

*/