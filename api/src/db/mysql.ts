import mysql, { Pool } from 'mysql'
import to from 'await-to-js'
import waitPort from 'wait-port'

import { host, port, user, password, database } from './config'
import { CREATE_TABLE } from './sql'

let pool: Pool

export async function startup(): Promise<unknown> {
  const [err] = await to(waitPort({ host, port }))
  if (err) throw err

  pool = mysql.createPool({
    connectionLimit: 10,
    host,
    port,
    user,
    password,
    database,
  })

  return new Promise<void>((resolve, reject) => {
    pool.query(CREATE_TABLE, (error) => (error ? reject(error) : resolve()))
  })
}

export async function shutdown(): Promise<unknown> {
  return new Promise<void>((resolve, reject) => {
    pool.end((error) => (error ? reject(error) : resolve()))
  })
}
