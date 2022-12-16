CREATE DATABASE seminar3_dz;
USE seminar3_dz;
CREATE TABLE staff
(id INT NOT NULL PRIMARY KEY,
 name VARCHAR(20),
 surname VARCHAR(20),
 specialty VARCHAR(20),
 seniority INT NOT NULL,
 salary INT NOT NULL,
 age INT NOT NULL 
);
INSERT staff
VALUES
(1, 'Вася', 'Васькин', 'начальник', 40, 100000, 60),
(2, 'Петя', 'Петькин', 'начальник', 8, 70000, 30),
(3, 'Катя', 'Каткина', 'инженер', 2, 70000, 25),
(4, 'Саша', 'Сашкин', 'инженер', 12, 50000, 35),
(5, 'Иван', 'Иванов', 'рабочий', 40, 30000, 59),
(6, 'Петр', 'Петров', 'рабочий', 20, 25000, 40),
(7, 'Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
(8, 'Антон', 'Антонов', 'рабочий', 8, 19000, 28),
(9, 'Юра', 'Юркин', 'рабочий', 5, 15000, 25),
(10, 'Максим', 'Воронин', 'рабочий', 2, 11000, 22),
(11, 'Юра', 'Галкин', 'рабочий', 3, 12000, 24),
(12, 'Люся', 'Люськина', 'уборщик', 10, 10000, 49);
SELECT * FROM staff;

SELECT * FROM staff
ORDER BY salary;                --
                                -- Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
SELECT * FROM staff             --
ORDER BY salary DESC;

SELECT * FROM staff             -- Выведите 5 максимальных зарплат (salary)
ORDER BY salary DESC
LIMIT 5;

SELECT specialty, SUM(salary)   -- Подсчитать суммарную зарплату(salary) по каждой специальности (specialty)  
FROM staff
GROUP BY specialty;

SELECT COUNT(*) AS workers_count
FROM staff
WHERE specialty = 'рабочий' AND age >= 24 AND age < 42; -- Найти количество сотрудников
                                                        -- по специальности “Рабочий” (speciality)
SELECT COUNT(*) AS workers_count                        -- в возрасте от 24 до 42 лет  
FROM staff
WHERE age >= 24 AND age < 42
GROUP BY specialty
HAVING specialty = 'рабочий';

SELECT COUNT(DISTINCT specialty) AS specialty_count     -- Найти количество специальностей
FROM staff;

SELECT specialty               -- Вывести специальности, у которых средний возраст сотрудника меньше 44 лет      
FROM staff
GROUP BY specialty
HAVING AVG(age) < 44