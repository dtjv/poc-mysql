DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS classes_students;


CREATE TABLE departments (
  department_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (department_id)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

CREATE TABLE students (
  student_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (student_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

CREATE TABLE teachers (
  teacher_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  department_id INT(9) UNSIGNED NOT NULL,
  PRIMARY KEY (teacher_id),
  FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
    ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

CREATE TABLE classes (
  class_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  department_id INT(9) UNSIGNED NOT NULL,
  PRIMARY KEY (class_id),
  FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
    ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

CREATE TABLE classes_students (
  class_id INT(9) UNSIGNED NOT NULL,
  student_id INT(9) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO departments (name) VALUES ('csc');
INSERT INTO departments (name) VALUES ('psy');
INSERT INTO departments (name) VALUES ('eng');
INSERT INTO departments (name) VALUES ('his');

INSERT INTO students (name) VALUES ('joe');
INSERT INTO students (name) VALUES ('tom');
INSERT INTO students (name) VALUES ('may');
INSERT INTO students (name) VALUES ('dan');

INSERT INTO teachers (name, department_id) VALUES ('prof. smith', 40);
INSERT INTO teachers (name, department_id) VALUES ('prof. jones', 41);
INSERT INTO teachers (name, department_id) VALUES ('prof. mason', 42);
INSERT INTO teachers (name, department_id) VALUES ('prof. baker', 43);

INSERT INTO classes (name, department_id) VALUES ('learn python', 40);
INSERT INTO classes (name, department_id) VALUES ('database design', 40);
INSERT INTO classes (name, department_id) VALUES ('pycho 201', 41);
INSERT INTO classes (name, department_id) VALUES ('pycho 301', 41);
INSERT INTO classes (name, department_id) VALUES ('writing 101', 42);
INSERT INTO classes (name, department_id) VALUES ('intro to poetry', 42);
INSERT INTO classes (name, department_id) VALUES ('biz writing', 42);
INSERT INTO classes (name, department_id) VALUES ('our ancestors', 43);

INSERT INTO classes_students (class_id, student_id) VALUES (30, 10);
INSERT INTO classes_students (class_id, student_id) VALUES (30, 11);
INSERT INTO classes_students (class_id, student_id) VALUES (30, 12);
INSERT INTO classes_students (class_id, student_id) VALUES (30, 13);
INSERT INTO classes_students (class_id, student_id) VALUES (31, 10);
INSERT INTO classes_students (class_id, student_id) VALUES (31, 12);
INSERT INTO classes_students (class_id, student_id) VALUES (32, 10);
INSERT INTO classes_students (class_id, student_id) VALUES (32, 11);
INSERT INTO classes_students (class_id, student_id) VALUES (32, 13);
INSERT INTO classes_students (class_id, student_id) VALUES (33, 11);
INSERT INTO classes_students (class_id, student_id) VALUES (33, 12);

