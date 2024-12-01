-- 1

SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restBill
JOIN restStaff 
ON restBill.waiter_no = restStaff.staff_no
WHERE restBill.cust_name = 'Tanya Singh';

-- 2

SELECT room_date
FROM restRoom_management
JOIN restStaff ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles'
AND restRoom_management.room_name = 'Green'
AND room_date LIKE '1602%';

-- 3

SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
WHERE headwaiter = (
SELECT headwaiter
FROM restStaff
WHERE first_name = 'Zoe' AND surname = 'Ball');

-- 4

SELECT 
restBill.cust_name, 
restBill.bill_total, 
restStaff.first_name, 
restStaff.surname
FROM restBill
INNER JOIN restStaff 
ON restBill.waiter_no = restStaff.staff_no
ORDER BY restBill.bill_total DESC;

-- 5

SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restBill AS b1
INNER JOIN restBill AS b2 
ON b1.table_no = b2.table_no
INNER JOIN restStaff 
ON b2.waiter_no = restStaff.staff_no
WHERE b1.bill_no IN (00014, 00017);

-- 6

SELECT DISTINCT first_name, surname
FROM restStaff 
INNER JOIN restRoom_management 
ON restStaff.staff_no = restRoom_management.headwaiter
WHERE room_name = 'Blue' 
AND room_date = 160312

UNION

SELECT DISTINCT first_name, surname
FROM restStaff 
INNER JOIN restBill 
ON restStaff.staff_no = restBill.waiter_no
INNER JOIN restRest_table 
ON restBill.table_no = restRest_table.table_no
WHERE room_name = 'Blue' 
AND bill_date = 160312
