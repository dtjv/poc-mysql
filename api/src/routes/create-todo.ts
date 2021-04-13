import { Request, Response } from 'express'

export async function createTodo(_: Request, res: Response): Promise<void> {
  res.send('create')
}
