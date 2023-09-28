/*
  Warnings:

  - You are about to drop the `Avaliacao_Aluno` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Avaliacao_Professor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `nota_aluno` on the `Aluno` table. All the data in the column will be lost.
  - The primary key for the `Grupo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `nota_grp` on the `Grupo` table. All the data in the column will be lost.
  - The primary key for the `Professor` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Estande` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `id_grp` to the `Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_estande` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_lider` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_nota` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email_prof` to the `Professor` table without a default value. This is not possible if the table is not empty.
  - The required column `id_estande` was added to the `Estande` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Avaliacao_Aluno";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Avaliacao_Professor";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "name" TEXT
);

-- CreateTable
CREATE TABLE "Post" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "content" TEXT,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "authorId" INTEGER NOT NULL,
    CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Avaliacao" (
    "id_avaliacao" TEXT NOT NULL PRIMARY KEY,
    "id_prof" TEXT NOT NULL,
    "id_aluno" TEXT NOT NULL,
    "id_nota" TEXT NOT NULL,
    "horario" DATETIME NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Avaliacao_id_prof_fkey" FOREIGN KEY ("id_prof") REFERENCES "Professor" ("id_prof") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Avaliacao_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "Aluno" ("id_aluno") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Avaliacao_id_nota_fkey" FOREIGN KEY ("id_nota") REFERENCES "Criterios" ("id_crit") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Criterios" (
    "id_crit" TEXT NOT NULL PRIMARY KEY,
    "inovacao" REAL NOT NULL,
    "maturidade" REAL NOT NULL,
    "atratividade" REAL NOT NULL,
    "apresentacao" REAL NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Aluno" (
    "id_aluno" TEXT NOT NULL PRIMARY KEY,
    "nome_aluno" TEXT NOT NULL,
    "matricula_aluno" INTEGER NOT NULL,
    "email_aluno" TEXT NOT NULL,
    "curso_aluno" TEXT NOT NULL,
    "id_grp" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Aluno_id_grp_fkey" FOREIGN KEY ("id_grp") REFERENCES "Grupo" ("id_grp") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Aluno" ("created_at", "curso_aluno", "email_aluno", "id_aluno", "matricula_aluno", "nome_aluno", "updated_at") SELECT "created_at", "curso_aluno", "email_aluno", "id_aluno", "matricula_aluno", "nome_aluno", "updated_at" FROM "Aluno";
DROP TABLE "Aluno";
ALTER TABLE "new_Aluno" RENAME TO "Aluno";
CREATE UNIQUE INDEX "Aluno_matricula_aluno_key" ON "Aluno"("matricula_aluno");
CREATE UNIQUE INDEX "Aluno_email_aluno_key" ON "Aluno"("email_aluno");
CREATE TABLE "new_Grupo" (
    "id_grp" TEXT NOT NULL PRIMARY KEY,
    "nome_grp" TEXT NOT NULL,
    "id_lider" TEXT NOT NULL,
    "id_estande" TEXT NOT NULL,
    "id_nota" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Grupo_id_lider_fkey" FOREIGN KEY ("id_lider") REFERENCES "Aluno" ("id_aluno") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Grupo_id_estande_fkey" FOREIGN KEY ("id_estande") REFERENCES "Estande" ("id_estande") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Grupo_id_nota_fkey" FOREIGN KEY ("id_nota") REFERENCES "Avaliacao" ("id_avaliacao") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Grupo" ("id_grp", "nome_grp") SELECT "id_grp", "nome_grp" FROM "Grupo";
DROP TABLE "Grupo";
ALTER TABLE "new_Grupo" RENAME TO "Grupo";
CREATE UNIQUE INDEX "Grupo_id_lider_key" ON "Grupo"("id_lider");
CREATE TABLE "new_Professor" (
    "id_prof" TEXT NOT NULL PRIMARY KEY,
    "nome_prof" TEXT NOT NULL,
    "email_prof" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Professor" ("id_prof", "nome_prof") SELECT "id_prof", "nome_prof" FROM "Professor";
DROP TABLE "Professor";
ALTER TABLE "new_Professor" RENAME TO "Professor";
CREATE UNIQUE INDEX "Professor_email_prof_key" ON "Professor"("email_prof");
CREATE TABLE "new_Estande" (
    "id_estande" TEXT NOT NULL PRIMARY KEY,
    "numero_estande" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Estande" ("numero_estande") SELECT "numero_estande" FROM "Estande";
DROP TABLE "Estande";
ALTER TABLE "new_Estande" RENAME TO "Estande";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
