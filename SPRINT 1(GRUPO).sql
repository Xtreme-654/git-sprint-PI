-- Criação de um DB e entrar

CREATE DATABASE tcc1sprint;
USE tcc1sprint;

-- Criar a tabela "empresas", cujo irá conter na mesma
-- id INT PK AUTO_INCREMENT
-- nomeEmpresa VARCHAR(60)
-- emailEmpresa VARCHAR(80) NOT NULL
-- senha VARCHAR(32) NOT NULL,
-- CNPJ DECIMAL(14,0) NOT NULL
-- logradouro VARCHAR(200)
-- tradução TRYTINCATE(0 falso e 1 verdadeiro)
-- check verificando vdd ou false

-- A Tabela Empresas será a parte institucional do Site para conter dados menos relevantes/concretos

CREATE TABLE empresas (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT, -- Id do usuário auto incrementado
nomeEmpresa VARCHAR(60), -- Nome da Empresa
emailEmpresa VARCHAR(80) UNIQUE, -- Email da Empresa(não pode valor nulo)
nomefuncionario VARCHAR(100),
sobrenomefuncionario VARCHAR(100),
senha VARCHAR(32) NOT NULL, -- Senha não pode ser nula
cnpj CHAR(14) NOT NULL UNIQUE, -- CHAR faz obrigatoriamente ser 14 Caracteres
logradouro VARCHAR(200), -- Endereço da empresa
traducaoBr TINYINT DEFAULT 0, -- TINYINT limita numeros entre 127 até -127, CONSTRAINT para ser apenas 0(falso) e 1(verdadeiro), valor base caso não tenha nada seŕa 0;
 CONSTRAINT chkTraducao
            CHECK(traducaoBr IN(0, 1))
qtdempregados int,
qtdmaquinarios int,
uf CHAR(2),
municipio VARCHAR(50),
telefone VARCHAR(25),
nomefantasia varchar(60),
razaosocial varchar(50),

);
-- tabela de adm

    CREATE TABLE Adm(
idAdm INT PRIMARY KEY AUTO_INCREMENT,
nomeAdm VARCHAR (100),
emailAdm VARCHAR(80) UNIQUE,
senhaAdm VARCHAR(25),
telefone VARCHAR(11)
);

-- _____________
-- Adicionar Colunas de Empregados e Maquinários nas Empresas
ALTER TABLE empresas ADD COLUMN qtdEmpregados INT;
ALTER TABLE empresas ADD COLUMN qtdMaquinarios INT;

CREATE TABLE sensores (
idSensor INT PRIMARY KEY,
modeloArduino VARCHAR(40) NOT NULL,
modeloSensor VARCHAR(40) NOT NULL,
qtdEmpresa INT,
funcionamento TINYINT, -- Irá constar se o sensor está funcionando ou não, necessitando de reparos/atualizações ou não, 0 é quebrado/reparo/atualização e 1 é funcionando
      CONSTRAINT chkFuncionamento
            CHECK(funcionamento IN(0, 1)),
empresaSensor VARCHAR(60) -- Cita a empresa cujo o sensor de tal modelo está lá sua quantidade
);

CREATE TABLE maquinarios(
id_maquinario INT PRIMARY KEY auto_increment,
maquinario VARCHAR(50) NOT NULL,
modelo_mqn VARCHAR(30),
trabalhador VARCHAR(100) UNIQUE,
tmpoperacao TIME,
statuss VARCHAR(50) constraint chkstatus CHECK(status IN('OPERANDO', 'MANUTENCAO','OBSOLETO')),
dtinicio DATE NOT NULL,
ton_descarregada DECIMAL(5,2));

CREATE TABLE temperaturas (
idTemperaturas INT PRIMARY KEY AUTO_INCREMENT,
temperatura DECIMAL(5,2) NOT NULL, -- Temperatura do local
dtHora DATETIME DEFAULT current_timestamp, -- Data e Hora da temperatura
Numeracao INT NOT NULL, -- Numeracao do Sensor
localEmpresa VARCHAR(60) NOT NULL -- A empresa na qual o sensor se encontra
);
