/*
  Warnings:

  - The primary key for the `Avaliacao_Aluno` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_avaliacao_alu` on the `Avaliacao_Aluno` table. All the data in the column will be lost.
  - You are about to drop the column `nota_ava_alu` on the `Avaliacao_Aluno` table. All the data in the column will be lost.
  - The primary key for the `Grupo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_grupo` on the `Grupo` table. All the data in the column will be lost.
  - You are about to drop the column `nome_grupo` on the `Grupo` table. All the data in the column will be lost.
  - You are about to drop the column `nota_grupo` on the `Grupo` table. All the data in the column will be lost.
  - The primary key for the `Aluno` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `id_avaliacao_aluno` to the `Avaliacao_Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nota_ava_aluno` to the `Avaliacao_Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_grp` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome_grp` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nota_grp` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `curso_aluno` to the `Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email_aluno` to the `Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `matricula_aluno` to the `Aluno` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Avaliacao_Aluno" (
    "id_avaliacao_aluno" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nota_ava_aluno" REAL NOT NULL,
    "horario" DATETIME NOT NULL
);
INSERT INTO "new_Avaliacao_Aluno" ("horario") SELECT "horario" FROM "Avaliacao_Aluno";
DROP TABLE "Avaliacao_Aluno";
ALTER TABLE "new_Avaliacao_Aluno" RENAME TO "Avaliacao_Aluno";
CREATE TABLE "new_Grupo" (
    "id_grp" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome_grp" TEXT NOT NULL,
    "nota_grp" REAL NOT NULL
);
DROP TABLE "Grupo";
ALTER TABLE "new_Grupo" RENAME TO "Grupo";
CREATE TABLE "new_Aluno" (
    "id_aluno" TEXT NOT NULL PRIMARY KEY,
    "nome_aluno" TEXT NOT NULL,
    "matricula_aluno" INTEGER NOT NULL,
    "email_aluno" TEXT NOT NULL,
    "curso_aluno" TEXT NOT NULL,
    "nota_aluno" REAL NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Aluno" ("id_aluno", "nome_aluno", "nota_aluno") SELECT "id_aluno", "nome_aluno", "nota_aluno" FROM "Aluno";
DROP TABLE "Aluno";
ALTER TABLE "new_Aluno" RENAME TO "Aluno";
CREATE UNIQUE INDEX "Aluno_matricula_aluno_key" ON "Aluno"("matricula_aluno");
CREATE UNIQUE INDEX "Aluno_email_aluno_key" ON "Aluno"("email_aluno");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
