import { Request, Response } from 'express'

export async function deleteTodo(_: Request, res: Response): Promise<void> {
  res.send('delete')
}
