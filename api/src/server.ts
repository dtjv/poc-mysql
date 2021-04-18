import 'dotenv/config'
import to from 'await-to-js'
import { app } from './app'
import * as db from './db/mysql'

const host = process.env.HOST
const port = process.env.PORT

async function startup() {
  const [err] = await to(db.init())

  if (err) {
    console.error(err)
    process.exit(1)
  }

  app.listen(port, () => console.log(`Server listening on ${host}:${port}.`))
}

async function shutdown() {
  await to(db.teardown())
  process.exit()
}

startup()

process.on('SIGINT', shutdown)
process.on('SIGTERM', shutdown)
