-- CreateTable
CREATE TABLE "Aluno" (
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

-- CreateTable
CREATE TABLE "Professor" (
    "id_prof" TEXT NOT NULL PRIMARY KEY,
    "nome_prof" TEXT NOT NULL,
    "email_prof" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "Grupo" (
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

-- CreateTable
CREATE TABLE "Estande" (
    "id_estande" TEXT NOT NULL PRIMARY KEY,
    "numero_estande" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
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
    "apresentacao" REAL NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_matricula_aluno_key" ON "Aluno"("matricula_aluno");

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_email_aluno_key" ON "Aluno"("email_aluno");

-- CreateIndex
CREATE UNIQUE INDEX "Professor_email_prof_key" ON "Professor"("email_prof");

-- CreateIndex
CREATE UNIQUE INDEX "Grupo_id_lider_key" ON "Grupo"("id_lider");
