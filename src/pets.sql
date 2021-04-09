DROP TABLE IF EXISTS dogs;
DROP TABLE IF EXISTS cats;
DROP TABLE IF EXISTS owners;


CREATE TABLE owners (
  owner_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (owner_id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


INSERT INTO
  owners (name)
VALUES
  ('joe');


INSERT INTO
  owners (name)
VALUES
  ('may');


INSERT INTO
  owners (name)
VALUES
  ('ben');


CREATE TABLE dogs (
  dog_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  age INT(2) NOT NULL,
  breed VARCHAR(100) NOT NULL,
  owner_id INT(9) UNSIGNED NOT NULL,
  PRIMARY KEY (dog_id),
  FOREIGN KEY (owner_id)
    REFERENCES owners(owner_id)
    ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;


INSERT INTO
  dogs (name, age, breed, owner_id)
VALUES
  ('fido', 2, 'collie', 10);


INSERT INTO
  dogs (name, age, breed, owner_id)
VALUES
  ('misty', 5, 'shelty', 11);


INSERT INTO
  dogs (name, age, breed, owner_id)
VALUES
  ('odie', 3, 'terrier', 10);


INSERT INTO
  dogs (name, age, breed, owner_id)
VALUES
  ('snoopy', 10, 'beagle', 12);


CREATE TABLE cats (
  cat_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  age INT(2) NOT NULL,
  breed VARCHAR(100) NOT NULL,
  PRIMARY KEY (cat_id)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;


INSERT INTO
  cats (name, age, breed)
VALUES
  ('garfield', 12, 'tabby');


INSERT INTO
  cats (name, age, breed)
VALUES
  ('tom', 8, 'shorthair');


INSERT INTO
  cats (name, age, breed)
VALUES
  ('tiger', 12, 'bengal');


INSERT INTO
  cats (name, age, breed)
VALUES
  ('peaches', 15, 'calico');


CREATE TABLE cats_owners (
  cat_id INT(9) UNSIGNED NOT NULL,
  owner_id INT(9) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO
  cats_owners (cat_id, owner_id)
VALUES
  (30, 10);


INSERT INTO
  cats_owners (cat_id, owner_id)
VALUES
  (31, 10);


INSERT INTO
  cats_owners (cat_id, owner_id)
VALUES
  (32, 10);


INSERT INTO
  cats_owners (cat_id, owner_id)
VALUES
  (33, 10);


INSERT INTO
  cats_owners (cat_id, owner_id)
VALUES
  (30, 11);


INSERT INTO
  cats_owners (cat_id, owner_id)
VALUES
  (32, 11);


INSERT INTO
  cats_owners (cat_id, owner_id)
VALUES
  (31, 12);


INSERT INTO
  cats_owners (cat_id, owner_id)
VALUES
  (33, 12);

