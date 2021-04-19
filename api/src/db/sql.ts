export const CREATE_TABLE = `
  CREATE TABLE IF NOT EXISTS todos (
    todo_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    task VARCHAR(255) NOT NULL,
    completed BOOLEAN,
    PRIMARY KEY (todo_id)
  ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8
`

export const ALLOW_ROOT_USER = `
  ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'root'
`

export const FLUSH_PRIVILEGES = `
  FLUSH PRIVILEGES
`
