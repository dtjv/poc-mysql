import { Request, Response } from 'express'

export async function updateTodo(_: Request, res: Response): Promise<void> {
  res.send('update')
}
