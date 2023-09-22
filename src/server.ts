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

app.get('/estande', async (req: Request, res: Response) => {
  const estande = await prisma.estande.findMany();
  res.json(estande);
});

app.get('/avaliacaoprofessor', async (req: Request, res: Response) => {
  const avaliacaoprofessor = await prisma.avaliacao_Professor.findMany();
  res.json(avaliacaoprofessor);
});

app.get('/avaliacaoaluno', async (req: Request, res: Response) => {
  const avaliacaoaluno = await prisma.avaliacao_Aluno.findMany();
  res.json(avaliacaoaluno);
});

if (process.env.PORT) {
  app.listen(process.env.PORT, () => {
    console.log(`Server running on port ${process.env.PORT}`);
  });
} else {
  console.log('Fail to load environment');
}
