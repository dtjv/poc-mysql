import { Router, Response } from 'express'

export { createTodo } from './create-todo'
export { getTodos } from './get-todos'
export { updateTodo } from './update-todo'
export { deleteTodo } from './delete-todo'

const router: Router = Router()

router.get('*', async (_, res: Response) => {
  res.send({})
})

export { router as catchAll }
