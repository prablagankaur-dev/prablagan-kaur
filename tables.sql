-- Departments Table
CREATE TABLE Departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(50),
    manager_id NUMBER
);

-- Employees Table
CREATE TABLE Employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    phone VARCHAR2(20),
    department_id NUMBER REFERENCES Departments(department_id),
    designation VARCHAR2(50),
    date_of_joining DATE
);

-- Salaries Table
CREATE TABLE Salaries (
    salary_id NUMBER PRIMARY KEY,
    employee_id NUMBER REFERENCES Employees(employee_id),
    basic_pay NUMBER,
    allowances NUMBER,
    deductions NUMBER,
    tax NUMBER,
    net_pay NUMBER,
    pay_date DATE
);

-- Leaves Table
CREATE TABLE Leaves (
    leave_id NUMBER PRIMARY KEY,
    employee_id NUMBER REFERENCES Employees(employee_id),
    leave_type VARCHAR2(20),
    start_date DATE,
    end_date DATE,
    status VARCHAR2(20)
);

-- Pay_Slips Table
CREATE TABLE Pay_Slips (
    payslip_id NUMBER PRIMARY KEY,
    employee_id NUMBER REFERENCES Employees(employee_id),
    salary_id NUMBER REFERENCES Salaries(salary_id),
    generated_date DATE
);