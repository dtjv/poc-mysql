import express, { json, urlencoded } from 'express'
import { routes } from './routes'

const API_PREFIX = process.env.API_PREFIX || ''

const app = express()

app.use(json())
app.use(urlencoded({ extended: true }))
app.use(API_PREFIX, routes)

export { app }
