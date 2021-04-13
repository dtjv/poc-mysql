import { Router } from 'express'

import { createTodo } from './create-todo'
import { getTodos } from './get-todos'
import { updateTodo } from './update-todo'
import { deleteTodo } from './delete-todo'

const router: Router = Router()

router.post('/todos', createTodo)
router.get('/todos', getTodos)
router.patch('/todos/:id', updateTodo)
router.delete('/todos/:id', deleteTodo)

export { router as routes }
