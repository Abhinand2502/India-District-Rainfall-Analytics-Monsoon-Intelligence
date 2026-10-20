create database exam;
use exam;

create table company(emp_id int primary key,name varchar(20),department varchar(10),city varchar(20), salary int ,experience int, joining_date date);
select * from company;
desc company;
# 1.Insert all 10 records.  
INSERT INTO company VALUES
(101, 'Arun', 'HR', 'Kochi', 25000, 2, '2022-05-10'),
(102, 'Neha', 'IT', 'Calicut', 45000, 5, '2020-03-15'),
(103, 'Rahul', 'Sales', 'Kochi', 32000, 3, '2021-08-20'),
(104, 'Divya', 'IT', 'Trivandrum', 50000, 6, '2019-11-01'),
(105, 'Akash', 'HR', 'Kannur', 28000, 2, '2023-01-12'),
(106, 'Sneha', 'Sales', 'Kochi', 40000, 4, '2020-09-18'),
(107, 'Manu', 'IT', 'Calicut', 55000, 7, '2018-07-22'),
(108, 'Asha', 'HR', 'Kannur', 30000, 3, '2022-10-05'),
(109, 'Anu', 'IT', 'Kochi', 48000, 5, '2021-06-12'),
(110, 'Hari', 'Sales', 'Trivandrum', 38000, 4, '2020-12-15');


# 2.Display employees whose salary is greater than 40000. 
select * from company where salary>40000;

#3.	Display employees from Kochi. 
select * from company where city = "kochi";

#4.	Display employees whose experience is between 3 and 6 years. 
select * from company where experience between 3 and 6;

#5.	Find the average salary of each department. 
select department, avg(salary) as Avg_Salary from company group by department;

#6.	Display departments having more than 2 employees. 
select department , count(*) from company group by department having count(*)>2;

#7.	Find the second highest salary. 
select max(salary) as second_highest_salary from company where salary<(select max(salary) from company);

#8.	Display employee names in ascending order. 
select name from company order by name asc;