import express, { json, urlencoded, Response } from 'express'

const app = express()

app.use(json())
app.use(urlencoded({ extended: true }))

app.get('/', async (_, res: Response) => res.send('api/v0/'))
app.listen(3000, () => console.log(`Server listening on 3000.\n`))
