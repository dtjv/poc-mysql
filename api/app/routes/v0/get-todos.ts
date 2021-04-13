import { Router, Request, Response } from 'express'

const router: Router = Router()

router.get('/todo', async (_: Request, res: Response) => {
  res.send('read')
})

export { router as getTodos }
