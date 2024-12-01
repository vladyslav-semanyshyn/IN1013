-- 1

SELECT 
restStaff.first_name, 
restStaff.surname, 
restBill.bill_date, 
COUNT(restBill.bill_no) AS bill_count
FROM restBill
INNER JOIN restStaff 
ON restBill.waiter_no = restStaff.staff_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 2;
-- 2

SELECT room_name, COUNT(table_no) AS table_count
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3

SELECT 
restRest_table.room_name, 
SUM(restBill.bill_total) AS total_bills
FROM restBill
INNER JOIN restRest_table 
ON restBill.table_no = restRest_table.table_no
GROUP BY restRest_table.room_name;

-- 4

SELECT 
headwaiters.first_name AS headwaiter_name, 
headwaiters.surname AS headwaiter_surname, 
SUM(restBill.bill_total) AS total_bill_amount
FROM restStaff AS waiters
INNER JOIN restStaff AS headwaiters 
ON waiters.headwaiter = headwaiters.staff_no
INNER JOIN restBill 
ON waiters.staff_no = restBill.waiter_no
GROUP BY headwaiters.first_name, headwaiters.surname
ORDER BY total_bill_amount DESC;

-- 5

SELECT 
cust_name, 
AVG(bill_total) AS average_spent
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6

SELECT 
restStaff.first_name, 
restStaff.surname, 
restBill.bill_date, 
COUNT(restBill.bill_no) AS bill_count
FROM restBill
INNER JOIN restStaff 
ON restBill.waiter_no = restStaff.staff_no
GROUP BY restStaff.first_name, restStaff.surname, restBill.bill_date
HAVING COUNT(restBill.bill_no) >= 3;