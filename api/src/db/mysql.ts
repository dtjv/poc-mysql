import mysql, { Pool } from 'mysql'
import to from 'await-to-js'
import waitPort from 'wait-port'

import { host, port, user, password, database } from './config'
import { CREATE_TABLE, ALLOW_ROOT_USER, FLUSH_PRIVILEGES } from './sql'

let pool: Pool

export async function startup(): Promise<unknown> {
  const [err] = await to(waitPort({ host, port }))
  if (err) throw err

  pool = mysql.createPool({
    connectionLimit: 3,
    host,
    port,
    user,
    password,
    database,
  })

  return allowRootUser()
    .then(() => flushPrivileges())
    .then(() => createTodoTable())
    .then(() =>
      console.log(`MySQL: ${user}:${password}@${host}:${port}/${database}`)
    )
}

export async function createTodoTable(): Promise<unknown> {
  return new Promise<void>((resolve, reject) => {
    pool.query(CREATE_TABLE, (error) => (error ? reject(error) : resolve()))
  })
}

export async function allowRootUser(): Promise<unknown> {
  return new Promise<void>((resolve, reject) => {
    pool.query(ALLOW_ROOT_USER, (error) => (error ? reject(error) : resolve()))
  })
}

export async function flushPrivileges(): Promise<unknown> {
  return new Promise<void>((resolve, reject) => {
    pool.query(FLUSH_PRIVILEGES, (error) => (error ? reject(error) : resolve()))
  })
}

export async function shutdown(): Promise<unknown> {
  return new Promise<void>((resolve, reject) => {
    pool.end((error) => (error ? reject(error) : resolve()))
  })
}
