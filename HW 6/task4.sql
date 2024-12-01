-- 1

SELECT DISTINCT restBill.cust_name
FROM restBill
INNER JOIN restStaff AS waiters 
ON restBill.waiter_no = waiters.staff_no
INNER JOIN restStaff AS headwaiters 
ON waiters.headwaiter = headwaiters.staff_no
WHERE headwaiters.first_name = 'Charles' 
AND restBill.bill_total > 450.00;
-- 2

SELECT DISTINCT headwaiters.first_name, headwaiters.surname
FROM restBill
INNER JOIN restStaff AS waiters 
ON restBill.waiter_no = waiters.staff_no
INNER JOIN restStaff AS headwaiters 
ON waiters.headwaiter = headwaiters.staff_no
WHERE restBill.cust_name = 'Nerida Smith' 
AND restBill.bill_date = 160111;

-- 3

SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4

SELECT restStaff.first_name, restStaff.surname
FROM restStaff
LEFT JOIN restBill 
ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.waiter_no IS NULL;

-- 5

SELECT 
restBill.cust_name, 
headwaiters.first_name AS headwaiter_first_name, 
headwaiters.surname AS headwaiter_surname, 
restRest_table.room_name
FROM restBill
INNER JOIN restStaff AS waiters 
ON restBill.waiter_no = waiters.staff_no
INNER JOIN restStaff AS headwaiters 
ON waiters.headwaiter = headwaiters.staff_no
INNER JOIN restRest_table 
ON restBill.table_no = restRest_table.table_no
WHERE restBill.bill_total = (SELECT MAX(bill_total) FROM restBill);