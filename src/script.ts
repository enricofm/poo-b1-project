import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  try {
    const novoRegistro = await prisma.professor.create({
      data: {
        id_prof: 1,
        nome_prof: 'teste',
      },
    });
    console.log('Registro criado:', novoRegistro);
  } catch (error) {
    console.error('Erro ao criar registro:', error);
  }
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
