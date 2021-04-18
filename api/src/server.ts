import 'dotenv/config'
import to from 'await-to-js'
import { app } from './app'
import * as db from './db/mysql'

const host = process.env.SERVER_HOST || 'localhost'
const port = parseInt(process.env.SERVER_PORT || '3001')

async function startup() {
  const [err] = await to(db.startup())

  if (err) {
    console.error(err)
    process.exit(1)
  }

  app.listen(port, host, () =>
    console.log(`Server listening on ${host}:${port}.`)
  )
}

async function shutdown() {
  await to(db.shutdown())
  process.exit()
}

startup()

process.on('SIGINT', shutdown)
process.on('SIGTERM', shutdown)
