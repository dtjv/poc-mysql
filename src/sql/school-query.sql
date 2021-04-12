USE db_demo;

SELECT * FROM students;
SELECT * FROM teachers;
SELECT * FROM classes;
SELECT * FROM departments;
SELECT * FROM classes_students;

/*

SELECT departments.department_id, classes.class_id
FROM departments, classes;


SELECT name
FROM students
WHERE name != 'joe';


SELECT teacher_id, name
FROM teachers
WHERE teacher_id > 21
      OR name = 'prof. smith';


SELECT name
FROM teachers
WHERE teacher_id NOT IN (20, 22);


SELECT name
FROM teachers
WHERE department_id IN (41, 43);
*/


/* Use sub-query */


SELECT teacher_id, name
FROM teachers
WHERE department_id IN
(
  SELECT department_id
  FROM departments
  WHERE name = 'psy'
);


SELECT name
FROM departments
WHERE department_id IN
(
  SELECT department_id
  FROM teachers
  WHERE name = 'prof. jones'
);


/* Use mutiple tables (aka, CROSS JOIN or cartesian product) */


SELECT t.teacher_id, t.name
FROM teachers t, departments d
WHERE t.department_id = d.department_id
      AND d.name = 'psy';


SELECT d.name
FROM departments d, teachers t
WHERE d.department_id = t.department_id
      AND t.name = 'prof. jones';


/* Use inner join */


SELECT t.teacher_id, t.name
FROM teachers t
INNER JOIN departments d
  ON t.department_id = d.department_id
WHERE d.name = 'psy';


SELECT d.name
FROM departments d
INNER JOIN teachers t
  ON t.department_id = d.department_id
WHERE t.name = 'prof. jones';


/* List classes 'may' is taking. */
SELECT c.name
FROM classes c
INNER JOIN classes_students cs
  ON c.class_id = cs.class_id
INNER JOIN students s
  ON cs.student_id = s.student_id
WHERE s.name = 'may';


/* List student names taking any class in the 'cs' department. */
SELECT DISTINCT s.name
FROM students s
INNER JOIN classes_students cs
  ON s.student_id = cs.student_id
INNER JOIN classes c
  ON cs.class_id = c.class_id
INNER JOIN departments d
  ON c.department_id = d.department_id
WHERE d.name = 'csc';

