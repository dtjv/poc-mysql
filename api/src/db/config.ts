import fs from 'fs'

const {
  MYSQL_HOST: HOST,
  MYSQL_HOST_FILE: HOST_FILE,
  MYSQL_PORT: PORT,
  MYSQL_PORT_FILE: PORT_FILE,
  MYSQL_USER: USER,
  MYSQL_USER_FILE: USER_FILE,
  MYSQL_PASSWORD: PASSWORD,
  MYSQL_PASSWORD_FILE: PASSWORD_FILE,
  MYSQL_DATABASE: DATABASE,
  MYSQL_DATABASE_FILE: DATABASE_FILE,
} = process.env

export const host = HOST_FILE ? fs.readFileSync(HOST_FILE, 'utf8') : HOST
export const user = USER_FILE ? fs.readFileSync(USER_FILE, 'utf8') : USER

export const password = PASSWORD_FILE
  ? fs.readFileSync(PASSWORD_FILE, 'utf8')
  : PASSWORD

export const database = DATABASE_FILE
  ? fs.readFileSync(DATABASE_FILE, 'utf8')
  : DATABASE

export const port = parseInt(
  (PORT_FILE ? fs.readFileSync(PORT_FILE, 'utf8') : PORT) || '3306'
)
