import 'dotenv/config'
import to from 'await-to-js'
import { app } from './app'
import * as db from './db/mysql'

const port = parseInt(process.env.API_PORT || '3001')

async function startup() {
  const [err] = await to(db.startup())

  if (err) {
    console.error(err)
    process.exit(1)
  }

  app.listen(port, () => console.log(`Server listening on port ${port}.`))
}

async function shutdown() {
  await to(db.shutdown())
  process.exit()
}

startup()

process.on('SIGINT', shutdown)
process.on('SIGTERM', shutdown)
