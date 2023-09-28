/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `tipo` to the `Avaliacao` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "User_email_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Post";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "User";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Avaliacao" (
    "id_avaliacao" TEXT NOT NULL PRIMARY KEY,
    "tipo" BOOLEAN NOT NULL,
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
INSERT INTO "new_Avaliacao" ("created_at", "horario", "id_aluno", "id_avaliacao", "id_nota", "id_prof", "updated_at") SELECT "created_at", "horario", "id_aluno", "id_avaliacao", "id_nota", "id_prof", "updated_at" FROM "Avaliacao";
DROP TABLE "Avaliacao";
ALTER TABLE "new_Avaliacao" RENAME TO "Avaliacao";
CREATE TABLE "new_Criterios" (
    "id_crit" TEXT NOT NULL PRIMARY KEY,
    "inovacao" REAL NOT NULL,
    "maturidade" REAL NOT NULL,
    "atratividade" REAL NOT NULL,
    "apresentacao" REAL NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Criterios" ("apresentacao", "atratividade", "id_crit", "inovacao", "maturidade") SELECT "apresentacao", "atratividade", "id_crit", "inovacao", "maturidade" FROM "Criterios";
DROP TABLE "Criterios";
ALTER TABLE "new_Criterios" RENAME TO "Criterios";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
