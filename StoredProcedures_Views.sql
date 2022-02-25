USE TechLogica;

-- Stored Procedure:
DELIMITER $$
CREATE PROCEDURE `aumentar_salario` (IN porcentagem INT)
BEGIN
	START TRANSACTION;
	UPDATE Empregado SET salario = (salario + salario * (porcentagem / 100));
    COMMIT;
END $$
CALL aumentar_salario(10);

-- View:
-- Empregados com dependentes:
CREATE VIEW Dependentes_dos_Empregados AS
SELECT
	Empregado.cpfEmpregado, Empregado.nome 'nomeEmpregado', GROUP_CONCAT(Dependente.nomeDependente) 'Dependentes'
FROM Empregado
JOIN Dependente ON (Empregado.cpfEmpregado = Dependente.cpfResponsavel)
GROUP BY Empregado.cpfEmpregado;      

SELECT * FROM Dependentes_dos_Empregados;

-- SELECTS:
-- Empregado com o maior salário:
SELECT 
	cpfEmpregado, nome, salario 
FROM
	Empregado
WHERE
	salario = (SELECT MAX(salario) FROM Empregado);

-- Salários dos empregados em ordem decrescente:
SELECT nome, salario FROM Empregado ORDER BY salario DESC;

-- Média de salário de todos os empregados:
SELECT AVG(salario) FROM Empregado;

-- Média de salário por gênero:
SELECT 
	genero, AVG(salario)
FROM Empregado
GROUP BY genero;

-- Empregados gerentes:
SELECT 
	Departamento.cpfGerente, empregado.nome, Departamento.nomeDepartamento
FROM Departamento
INNER JOIN Empregado ON Departamento.cpfGerente = Empregado.cpfEmpregado;

-- Participantes de projetos:
SELECT 
	empregado.cpfempregado, empregado.nome, GROUP_CONCAT(projeto_has_empregado.idProjeto) AS projeto
FROM Empregado
JOIN Projeto_has_Empregado USING (cpfEmpregado)
GROUP BY Empregado.cpfempregado;


