import { Router, Request, Response } from 'express'

const router: Router = Router()

router.delete('/todo/:id', async (_: Request, res: Response) => {
  res.send('delete')
})

export { router as deleteTodo }
