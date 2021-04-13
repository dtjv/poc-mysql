import { Request, Response } from 'express'

export async function getTodos(_: Request, res: Response): Promise<void> {
  res.send('get all')
}
