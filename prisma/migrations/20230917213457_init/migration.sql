/*
  Warnings:

  - The primary key for the `Aluno` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `matricula` on the `Aluno` table. All the data in the column will be lost.
  - Added the required column `horario` to the `Avaliacao_Professor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nota_ava_prof` to the `Avaliacao_Professor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome_grupo` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nota_grupo` to the `Grupo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome_prof` to the `Professor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `horario` to the `Avaliacao_Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nota_ava_alu` to the `Avaliacao_Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_aluno` to the `Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nome_aluno` to the `Aluno` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nota_aluno` to the `Aluno` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Avaliacao_Professor" (
    "id_avaliacao_prof" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nota_ava_prof" REAL NOT NULL,
    "horario" DATETIME NOT NULL
);
INSERT INTO "new_Avaliacao_Professor" ("id_avaliacao_prof") SELECT "id_avaliacao_prof" FROM "Avaliacao_Professor";
DROP TABLE "Avaliacao_Professor";
ALTER TABLE "new_Avaliacao_Professor" RENAME TO "Avaliacao_Professor";
CREATE TABLE "new_Grupo" (
    "id_grupo" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome_grupo" TEXT NOT NULL,
    "nota_grupo" REAL NOT NULL
);
INSERT INTO "new_Grupo" ("id_grupo") SELECT "id_grupo" FROM "Grupo";
DROP TABLE "Grupo";
ALTER TABLE "new_Grupo" RENAME TO "Grupo";
CREATE TABLE "new_Professor" (
    "id_prof" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome_prof" TEXT NOT NULL
);
INSERT INTO "new_Professor" ("id_prof") SELECT "id_prof" FROM "Professor";
DROP TABLE "Professor";
ALTER TABLE "new_Professor" RENAME TO "Professor";
CREATE TABLE "new_Avaliacao_Aluno" (
    "id_avaliacao_alu" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nota_ava_alu" REAL NOT NULL,
    "horario" DATETIME NOT NULL
);
INSERT INTO "new_Avaliacao_Aluno" ("id_avaliacao_alu") SELECT "id_avaliacao_alu" FROM "Avaliacao_Aluno";
DROP TABLE "Avaliacao_Aluno";
ALTER TABLE "new_Avaliacao_Aluno" RENAME TO "Avaliacao_Aluno";
CREATE TABLE "new_Aluno" (
    "id_aluno" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome_aluno" TEXT NOT NULL,
    "nota_aluno" REAL NOT NULL
);
DROP TABLE "Aluno";
ALTER TABLE "new_Aluno" RENAME TO "Aluno";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
