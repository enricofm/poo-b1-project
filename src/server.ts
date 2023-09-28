import express, { Request, Response } from 'express';
import { PrismaClient } from '@prisma/client';
import dotenv from 'dotenv';

dotenv.config();
const app = express();
const prisma = new PrismaClient();

app.use(express.json());

app.get('/', (req: Request, res: Response) => {
  res.send('Bem vindo a API');
});

app.get('/aluno', async (req: Request, res: Response) => {
  const aluno = await prisma.aluno.findMany();
  res.json(aluno);
});

app.get('/professor', async (req: Request, res: Response) => {
  const professor = await prisma.professor.findMany();
  res.json(professor);
});

app.get('/grupo', async (req: Request, res: Response) => {
  const grupo = await prisma.grupo.findMany();
  res.json(grupo);
});

app.get('/estande', async (req: Request, res: Response) => {
  const estande = await prisma.estande.findMany();
  res.json(estande);
});

app.get('/avaliacao', async (req: Request, res: Response) => {
  const avaliacao = await prisma.avaliacao.findMany();
  res.json(avaliacao);
});

app.get('/criterios', async (req: Request, res: Response) => {
  const criterios = await prisma.criterios.findMany();
  res.json(criterios);
});

if (process.env.PORT) {
  app.listen(process.env.PORT, () => {
    console.log(`Server running on port ${process.env.PORT}`);
  });
} else {
  console.log('Fail to load environment');
}
