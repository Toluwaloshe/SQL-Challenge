CREATE TABLE department (
    dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE employee (
    emp_no INTEGER NOT NULL PRIMARY KEY,
    birth_date date NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE dept_employee (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES department(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

CREATE TABLE manager (
    dept_no VARCHAR(30) NOT NULL,
    emp_no INTEGER NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES department(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);


CREATE TABLE salary (
    emp_no INTEGER NOT NULL,
    salary INTEGER,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

CREATE TABLE title (
    emp_no INTEGER NOT NULL,
    title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS dept_employee;
DROP TABLE IF EXISTS manager;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS salarY;
DROP TABLE IF EXISTS title;


#QUESTION # 1
CREATE TABALE question_1_table AS (
SELECT
e.emp_no, first_name, last_name, gender, salary
FROM
employee e
JOIN
salary s
ON
e.emp_no = s.emp_no
ORDER BY
e.emp_no
);

QUESTION #2
CREATE TABLE question_2_table AS(
SELECT
first_name,last_name, hire_date
FROM
employee
WHERE
hire_date BETWEEN '12-31-1985' AND '1-1-1987'
);

#QUESTION #3
CREATE TABLE question_3_table AS(
SELECT
m.dept_no, dept_name, m.emp_no, first_name, last_name, from_date, to_date
FROM
manager m
JOIN
employee e
ON
m.emp_no = e.emp_no
JOIN
department d
ON
m.dept_no = d.dept_no
);

#QUESTION 4
CREATE TABLE question_4_table AS (
SELECT
e.emp_no, first_name, last_name, dept_name
FROM
dept_employee de
JOIN
employee e
ON
de.emp_no = e.emp_no
JOIN
department d
ON
de.dept_no = d.dept_no
ORDER BY
de.emp_no
);

#QUESTION 5
CREATE TABLE question_5_table AS(
SELECT
*
FROM
employee
WHERE
first_name = 'Hercules'
AND last_name LIKE '%B%'
);

QUESTION 6
CREATE TABLE question_6_table AS (
SELECT
e.emp_no, first_name, last_name, dept_name
FROM 
dept_employee de
JOIN
employee e
ON 
de.emp_no = e.emp_no
JOIN
department d
ON
de.dept_no = d.dept_no
Where
de.dept_no = 'd007'
);

QUESTION #7
CREATE TABLE question_7_table AS (
SELECT
e.emp_no, first_name, last_name, d.dept_no
FROM 
dept_employee de
FULL JOIN
employee e
ON 
de.emp_no = e.emp_no
FULL JOIN
department d
ON
de.dept_no = d.dept_no
WHERE
d.dept_no = 'd007'
AND d.dept_no = 'd005'
);

QUESTION #8
CREATE TABLE question_8_table AS (
SELECT
last_name, COUNT(last_name) AS last_name_count
FROM 
employee
GROUP BY
last_name
ORDER BY 
last_name_count DESC
);