import mysql, { Pool } from 'mysql'
import util from 'util'
import to from 'await-to-js'
import waitPort from 'wait-port'

import { host, port, user, password, database } from './config'
import { CREATE_TABLE } from './sql'

let pool: Pool

export async function init(): Promise<unknown> {
  const [err] = await to(waitPort({ host, port }))
  if (err) throw err

  pool = mysql.createPool({
    connectionLimit: 10,
    host,
    user,
    password,
    database,
  })

  return util.promisify(pool.query)(CREATE_TABLE)
}

export async function teardown(): Promise<unknown> {
  return util.promisify(pool.end)()
}
