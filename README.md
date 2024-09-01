# TechTFQ-30DaysSQLChallenge-DAY14

Finding Missing Data SQL challenge

going through the challenge of SQL interview questions featured in the TechTFQ channel



In this repository we will be going through the SQL interview questions featured in the following YouTube video [SQL Interview Query 14 | SQL Problem Level "MEDIUM"](https://www.youtube.com/watch?v=WBqTj-FYux8&list=PLavw5C92dz9Hxz0YhttDniNgKejQlPoAn&index=14).

### Day 14: The problem statement: Finding Missing Data


**PROBLEM STATEMENT:** In the given input table, some of the invoices are missing, write a SQL query to identify the missing serial no.
As an assumption, consider the serial no with the lowest value to be the first generated invoice and the highest serial no value to be the last generated invoice.

![image](https://github.com/user-attachments/assets/e311b424-0b63-4b1a-afa3-4f5ac1fa9ebb)

**DDL & DML**

```
-- Drop the table if it exists
DROP TABLE IF EXISTS InvoiceTable;

-- Create the table
CREATE TABLE InvoiceTable (
    SERIAL_NO INT PRIMARY KEY,
    INVOICE_DATE DATE
);

-- Insert data into the table
INSERT INTO InvoiceTable (SERIAL_NO, INVOICE_DATE) VALUES
(330115, '2024-03-01'),
(330120, '2024-03-01'),
(330121, '2024-03-01'),
(330122, '2024-03-02'),
(330125, '2024-03-02');


```


**DQL**

**Solution that I've gave**

```
-- The logic behind this was to create a table containing one column computing invoice numbers from 330115 to 330125
WITH RECURSIVE SERIALNUMBERS AS
	(SELECT 330115 AS SERIAL_NO
		UNION ALL SELECT SERIAL_NO + 1
		FROM SERIALNUMBERS
		WHERE SERIAL_NO < 330125 )

-- Then we've joined the 2 tables together to  select only missing SERIAL Numbers in thz InvoiceTable
SELECT L.SERIAL_NO AS MISSING_SERTIAL_NO
FROM SERIALNUMBERS L
LEFT JOIN INVOICETABLE R ON L.SERIAL_NO = R.SERIAL_NO
WHERE R.SERIAL_NO IS NULL
ORDER BY L.SERIAL_NO;
```

**Simple Solution**

```
-- Solution 2: Simple approach

SELECT GENERATE_SERIES(330115, 330125) AS MISSING_SERTIAL_NO
EXCEPT
SELECT SERIAL_NO
FROM INVOICETABLE
ORDER BY 1;


-- Solution 3: Another simple approach

SELECT GENERATE_SERIES(min(SERIAL_NO), max(SERIAL_NO)) AS MISSING_SERTIAL_NO
FROM INVOICETABLE
EXCEPT 
SELECT SERIAL_NO
FROM INVOICETABLE
ORDER BY 1;
```
