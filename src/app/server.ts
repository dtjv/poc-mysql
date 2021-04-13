import 'dotenv/config'
import { app } from './app'

const host = process.env.HOST
const port = process.env.PORT

app.listen(port, () => console.log(`Server listening on ${host}:${port}.`))
