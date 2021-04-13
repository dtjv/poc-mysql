import { Router, Request, Response } from 'express'

const router: Router = Router()

router.post('/todo', async (_: Request, res: Response) => {
  res.send('create')
})

export { router as createTodo }
