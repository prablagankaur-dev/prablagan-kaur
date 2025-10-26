-- Total salary expenditure
SELECT SUM(net_pay) AS total_expenditure
FROM Salaries
WHERE EXTRACT(MONTH FROM pay_date) = 10
  AND EXTRACT(YEAR FROM pay_date) = 2025;

-- Generate pay slip for employee 101
SELECT e.first_name, e.last_name, s.basic_pay, s.allowances, s.deductions, s.tax, s.net_pay
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id
WHERE e.employee_id = 101
  AND s.pay_date = TO_DATE('2025-10-31','YYYY-MM-DD');

-- Employees with pending leaves
SELECT e.first_name, e.last_name, l.leave_type, l.start_date, l.end_date
FROM Employees e
JOIN Leaves l ON e.employee_id = l.employee_id
WHERE l.status = 'Pending';

-- List all employees in Finance department
SELECT e.first_name, e.last_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';
