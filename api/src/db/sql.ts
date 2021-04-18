export const CREATE_TABLE = `
  CREATE TABLE todos (
    todo_id INT(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    task VARCHAR(255) NOT NULL,
    completed BOOLEAN
  )
`
