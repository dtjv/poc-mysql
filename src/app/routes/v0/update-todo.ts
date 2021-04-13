import { Router, Request, Response } from 'express'

const router: Router = Router()

router.put('/todo/:id', async (_: Request, res: Response) => {
  res.send('update')
})

export { router as updateTodo }
