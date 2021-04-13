import express, { json, urlencoded } from 'express'
import * as routes from './routes/v0'

const API_PREFIX = process.env.API_PREFIX || '/api/v0'

const app = express()

app.use(json())
app.use(urlencoded({ extended: true }))
app.use(API_PREFIX, routes.createTodo)
app.use(API_PREFIX, routes.getTodos)
app.use(API_PREFIX, routes.updateTodo)
app.use(API_PREFIX, routes.deleteTodo)
app.use(routes.catchAll)

export { app }
