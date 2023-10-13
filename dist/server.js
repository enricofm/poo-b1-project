"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const client_1 = require("@prisma/client");
const dotenv_1 = __importDefault(require("dotenv"));
dotenv_1.default.config();
const app = (0, express_1.default)();
const prisma = new client_1.PrismaClient();
app.use(express_1.default.json());
app.get('/', (req, res) => {
    res.send('Bem vindo a API');
});
app.get('/aluno', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const aluno = yield prisma.aluno.findMany();
    res.json(aluno);
}));
app.get('/professor', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const professor = yield prisma.professor.findMany();
    res.json(professor);
}));
app.get('/grupo', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const grupo = yield prisma.grupo.findMany();
    res.json(grupo);
}));
app.get('/estande', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const estande = yield prisma.estande.findMany();
    res.json(estande);
}));
app.get('/avaliacao', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const avaliacao = yield prisma.avaliacao.findMany();
    res.json(avaliacao);
}));
app.get('/criterios', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const criterios = yield prisma.criterios.findMany();
    res.json(criterios);
}));
if (process.env.PORT) {
    app.listen(process.env.PORT, () => {
        console.log(`Server running on port ${process.env.PORT}`);
    });
}
else {
    console.log('Fail to load environment');
}
