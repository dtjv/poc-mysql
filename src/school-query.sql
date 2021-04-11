USE db_demo;


SELECT * FROM students;
SELECT * FROM teachers;
SELECT * FROM classes;
SELECT * FROM departments;
SELECT * FROM classes_students;


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
  WHERE name = 'prof. smith'
);


