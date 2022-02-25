CREATE DATABASE TechLogica;
USE TechLogica;

-- Criar tabelas:
CREATE TABLE Projeto (
	idProjeto INT NOT NULL,
    dataInicio DATE NOT NULL,
    PRIMARY KEY(idProjeto)
);

CREATE TABLE Etapas (
	idEtapa INT NOT NULL,
    descricao VARCHAR(45) NULL,
    PRIMARY KEY(idEtapa)
);

CREATE TABLE Atas (
	idAta INT NOT NULL,
	data_reuniao DATE NOT NULL,
    tema VARCHAR(45) NULL,
    PRIMARY KEY(idAta)
);


CREATE TABLE Departamento (
	idDepartamento INT NOT NULL,
    nomeDepartamento VARCHAR(45) NOT NULL,
    cpfGerente INT NULL,
    PRIMARY KEY (idDepartamento)
);

CREATE TABLE Empregado (
	cpfEmpregado INT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    salario FLOAT NOT NULL,
    genero VARCHAR(45),
    cpfSupervisor INT NULL,
    idDepartamento INT NULL,
    PRIMARY KEY(cpfEmpregado),
    FOREIGN KEY(cpfSupervisor) REFERENCES Empregado(cpfEmpregado) 
);

ALTER TABLE Departamento ADD FOREIGN KEY (cpfGerente) REFERENCES Empregado(cpfEmpregado);
ALTER TABLE Empregado ADD FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento);


CREATE TABLE Dependente (
	cpfDependente INT NOT NULL,
    nomeDependente VARCHAR(45) NOT NULL,
    cpfResponsavel INT NOT NULL,
    PRIMARY KEY(cpfDependente),
    FOREIGN KEY(cpfResponsavel) REFERENCES Empregado(cpfEmpregado)
);


CREATE TABLE Projeto_has_Empregado (
	idProjeto INT NOT NULL,
    cpfEmpregado INT NOT NULL,
    PRIMARY KEY(idProjeto, cpfEmpregado),
    FOREIGN KEY(idProjeto) REFERENCES Projeto(idProjeto),
    FOREIGN KEY(cpfEmpregado) REFERENCES Empregado(cpfEmpregado)
);

CREATE TABLE Projeto_has_Departamento (
	idProjeto INT NOT NULL,
    idDepartamento INT NOT NULL,
    PRIMARY KEY(idProjeto, idDepartamento),
    FOREIGN KEY(idProjeto) REFERENCES Projeto(idProjeto),
    FOREIGN KEY(idDepartamento) REFERENCES Departamento(idDepartamento)
);

CREATE TABLE Projeto_has_Etapas(
	idProjeto INT NOT NULL,
    idEtapa INT NOT NULL,
    PRIMARY KEY(idProjeto, idEtapa),
    FOREIGN KEY(idProjeto) REFERENCES Projeto(idProjeto),
    FOREIGN KEY(idEtapa) REFERENCES Etapas(idEtapa)
);


CREATE TABLE Projeto_has_Atas(
	idProjeto INT NOT NULL,
	idAta INT NOT NULL,
    PRIMARY KEY(idProjeto, idAta),
    FOREIGN KEY(idProjeto) REFERENCES Projeto(idProjeto),
    FOREIGN KEY(idAta) REFERENCES Atas(idAta)
);

-- Inserindo dados
-- Projetos:
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(1, '2020-05-20');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(2, '2018-01-20');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(3, '2017-03-19');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(4, '2019-10-20');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(5, '2015-10-30');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(6, '2020-10-30');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(7, '2018-10-30');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(8, '2017-10-30');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(9, '2016-10-30');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(10, '2013-10-30');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(11, '2011-10-30');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(12, '2010-10-30');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(13, '2018-10-30');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(14, '2014-10-30');
INSERT INTO Projeto(idProjeto, dataInicio) VALUES(15, '2010-10-30');


-- Etapas:
INSERT INTO Etapas(idEtapa, descricao) VALUES (1, 'Planejamento');
INSERT INTO Etapas(idEtapa, descricao) VALUES (2, 'Desenvolvimento');
INSERT INTO Etapas(idEtapa, descricao) VALUES (3, 'Implementação');
INSERT INTO Etapas(idEtapa, descricao) VALUES (4, 'Conclusão');
INSERT INTO Etapas(idEtapa, descricao) VALUES (5, 'Análise');
INSERT INTO Etapas(idEtapa, descricao) VALUES (6, 'Otimização');
INSERT INTO Etapas(idEtapa, descricao) VALUES (7, 'Revisão');
INSERT INTO Etapas(idEtapa, descricao) VALUES (8, 'Inauguração');
INSERT INTO Etapas(idEtapa, descricao) VALUES (9, 'Produção');
INSERT INTO Etapas(idEtapa, descricao) VALUES (10, 'Controle de Qualidade');
INSERT INTO Etapas(idEtapa, descricao) VALUES (11, 'Comercialização');
INSERT INTO Etapas(idEtapa, descricao) VALUES (12, 'Aprendizado');
INSERT INTO Etapas(idEtapa, descricao) VALUES (13, 'Melhoria');
INSERT INTO Etapas(idEtapa, descricao) VALUES (14, 'Validação');
INSERT INTO Etapas(idEtapa, descricao) VALUES (15, 'Cancelado');

-- Atas:
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (1, '2019-08-23', 'Corte de Gastos');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (2, '2019-02-21', 'Análise de Indicadores');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (3, '2018-04-30', 'Investimentos');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (4, '2020-07-31', 'Estratégia');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (5, '2018-05-14', 'Verbas');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (6, '2017-12-10', 'Design Sprint');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (7, '2019-06-14', 'Estratégia Publicitária');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (8, '2020-05-11', 'Ações');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (9, '2018-11-21', 'Acionistas');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (10, '2015-05-17', 'Novos Mercados');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (11, '2018-05-14', 'Corte de Verbas');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (12, '2017-02-20', 'Realocação de Sedes');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (13, '2015-06-14', 'Inauguração de Filiais');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (14, '2018-08-14', 'Cancelamento de Projetos');
INSERT INTO Atas(idAta, data_reuniao, tema) VALUES (15, '2018-07-14', 'Promoções');


-- Departamento:
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (1, 'Contabilidade', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (2, 'Informática', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (3, 'Relações Públicas', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (4, 'Recursos Humanos', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (5, 'Administração', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (6, 'Gerência', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (7, 'Desenvolvimento', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (8, 'Comercial', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (9, 'Financeiro', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (10, 'Vendas', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (11, 'Diretoria', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (12, 'Telemarketing', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (13, 'Jurídico', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (14, 'Treinamento', NULL);
INSERT INTO Departamento(idDepartamento, nomeDepartamento, cpfGerente) VALUES (15, 'Atendimento', NULL);


-- Empregado:
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (1, 'João', 5000, 'M', NULL, 7);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (2, 'Maria', 5000, 'F', 1, 7);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (3, 'Paulo', 7000, 'M', 2, 8);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (4, 'César', 4500, 'M', 3, 9);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (5, 'Ana', 6000, 'F', 3, 1);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (6, 'Edgar', 3000, 'M', 2, 3);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (7, 'Cristina', 6000, 'F', 2, 4);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (8, 'Luiza', 4500, 'F', 2, 4);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (9, 'Felipe', 5500, 'M', 3, 5);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (10, 'Lara', 7000, 'F', 3, 10);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (11, 'José', 6500, 'M', 1, 15);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (12, 'Janaína', 5000, 'F', 3, 11);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (13, 'Carol', 7300, 'F', 2, 9);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (14, 'Camila', 7300, 'F', 3, 9);
INSERT INTO Empregado(cpfEmpregado, nome, salario, genero, cpfSupervisor, idDepartamento) VALUES (15, 'Nicholas', 7300, 'M', 3, 12);


-- Gerente do Departamento:
UPDATE Departamento SET cpfGerente = 1 WHERE idDepartamento = 1;
UPDATE Departamento SET cpfGerente = 3 WHERE idDepartamento = 2;
UPDATE Departamento SET cpfGerente = 2 WHERE idDepartamento = 3;
UPDATE Departamento SET cpfGerente = 5 WHERE idDepartamento = 4;
UPDATE Departamento SET cpfGerente = 6 WHERE idDepartamento = 5;
UPDATE Departamento SET cpfGerente = 7 WHERE idDepartamento = 6;
UPDATE Departamento SET cpfGerente = 8 WHERE idDepartamento = 7;
UPDATE Departamento SET cpfGerente = 9 WHERE idDepartamento = 8;
UPDATE Departamento SET cpfGerente = 10 WHERE idDepartamento = 9;
UPDATE Departamento SET cpfGerente = 11 WHERE idDepartamento = 10;
UPDATE Departamento SET cpfGerente = 12 WHERE idDepartamento = 11;
UPDATE Departamento SET cpfGerente = 13 WHERE idDepartamento = 12;
UPDATE Departamento SET cpfGerente = 14 WHERE idDepartamento = 13;
UPDATE Departamento SET cpfGerente = 15 WHERE idDepartamento = 14;
UPDATE Departamento SET cpfGerente = 12 WHERE idDepartamento = 15;


-- Dependente:
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (1, 'Ana', 1);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (2, 'Roberto', 1);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (3, 'Sara', 2);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (4, 'Erica', 3);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (5, 'João', 3);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (6, 'Artur', 4);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (7, 'Edilson', 5);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (8, 'Elton', 6);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (9, 'Lilian', 6);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (10, 'Clara', 7);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (11, 'Lara', 8);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (12, 'Margarida', 9);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (13, 'Maria', 9);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (14, 'Roberta', 10);
INSERT INTO Dependente(cpfDependente, nomeDependente, cpfResponsavel) VALUES (15, 'Bruno', 10);


-- Projeto_has_Empregado:
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (1, 1);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (1, 2);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (2, 1);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (3, 4);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (3, 5);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (3, 6);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (3, 7);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (4, 4);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (4, 5);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (4, 6);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (5, 1);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (5, 3);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (5, 5);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (7, 2);
INSERT INTO Projeto_has_Empregado(idProjeto, cpfEmpregado) VALUES (8, 9);



-- Projeto_has_Departamento:
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (1, 7);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (1, 8);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (2, 9);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (3, 7);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (4, 8);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (5, 9);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (6, 7);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (7, 6);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (8, 1);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (9, 15);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (9, 13);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (10, 2);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (11, 6);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (12, 11);
INSERT INTO Projeto_has_Departamento(idProjeto, idDepartamento) VALUES (15, 14);

-- Projeto_has_Etapas:
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(1, 2);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(2, 3);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(3, 2);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(4, 3);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(5, 1);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(10, 5);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(11, 8);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(8, 9);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(7, 11);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(7, 12);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(9, 15);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(10, 12);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(12, 8);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(15, 7);
INSERT INTO Projeto_has_Etapas(idProjeto, idEtapa) VALUES(6, 4);

-- Projeto_has_Atas:
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(1, 2);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(1, 3);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(2, 2);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(3, 1);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(4, 1);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(5, 3);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(5, 4);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(7, 15);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(8, 3);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(10, 6);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(13, 7);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(12, 11);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(15, 10);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(11, 9);
INSERT INTO Projeto_has_Atas(idProjeto, idAta) VALUES(9, 1);


-- Select de todas as tabelas:
SELECT * FROM Projeto;
SELECT * FROM Etapas;
SELECT * FROM Atas;
SELECT * FROM Departamento;
SELECT * FROM Empregado;
SELECT * FROM Dependente;
SELECT * FROM Projeto_has_Empregado;
SELECT * FROM Projeto_has_Departamento;
SELECT * FROM Projeto_has_Etapas;
SELECT * FROM Projeto_has_Atas;

-- Deletando dados de todas as tabelas:
DELETE FROM Projeto_has_Empregado;
DELETE FROM Projeto_has_Departamento;
DELETE FROM Projeto_has_Etapas;
DELETE FROM Projeto_has_Atas;
DELETE FROM Etapas;
DELETE FROM Atas;
DELETE FROM Projeto;
DELETE FROM Dependente;
ALTER TABLE Departamento DROP FOREIGN KEY departamento_ibfk_1;
ALTER TABLE Empregado DROP FOREIGN KEY empregado_ibfk_1;
ALTER TABLE Empregado DROP FOREIGN KEY empregado_ibfk_2;
DELETE FROM Empregado;
DELETE FROM Departamento;
ALTER TABLE Departamento ADD FOREIGN KEY (cpfGerente) REFERENCES Empregado(cpfEmpregado);
ALTER TABLE Empregado ADD FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento);
ALTER TABLE Empregado ADD FOREIGN KEY (cpfSupervisor) REFERENCES Empregado(cpfEmpregado);

