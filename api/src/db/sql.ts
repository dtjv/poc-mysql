export const CREATE_TABLE = `
  CREATE TABLE IF NOT EXISTS todos (
    todo_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    task VARCHAR(255) NOT NULL,
    completed BOOLEAN,
    PRIMARY KEY (todo_id)
  ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
`
