import { PrismaClient, Aluno, Professor, Grupo, Avaliacao, Estande, Criterios } from '@prisma/client';

const prisma = new PrismaClient();

class main {
  constructor() {}

  async criar(newDado: Aluno, nome_aluno: String) {
    try {
      const criar = await prisma.aluno.create({
        data: newDado

      });
      return criar;
    } catch (error) {
      console.log(error);
    }
  }
}
