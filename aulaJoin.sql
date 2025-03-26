CREATE DATABASE adsa2;

USE adsa2;

CREATE TABLE empresa (
	idEmpresa int primary key auto_increment,
    nome varchar(45)
);

INSERT INTO empresa (nome) VALUES 
	('C6 Bank'),
    ('Safra');
    
SELECT * FROM empresa;

CREATE TABLE aluno (
	ra char(8) primary key,
    nome varchar(45),
    fkEmpresa int,
    constraint fkEmpresaAluno
		foreign key (fkEmpresa)
        references empresa(idEmpresa)
);

INSERT INTO aluno (ra, nome, fkEmpresa) VALUES 
	('01251100', 'Isabelle', 2),
    ('01251101', 'Henrique', 2),
    ('01251102', 'Vique', 1);
    
SELECT * FROM aluno;

-- NOSSO PRIMEIRO JOIN
-- JOIN = INNER JOIN
SELECT * FROM empresa JOIN aluno
	ON idEmpresa = fkEmpresa;
    
SELECT empresa.nome as EmpresaNome,
	aluno.nome as AlunoNome
    FROM empresa JOIN aluno
		ON aluno.fkEmpresa = empresa.idEmpresa;
        
CREATE TABLE responsavel (
	idResponsavel int primary key auto_increment,
	nome varchar(45)
) auto_increment = 1000;

ALTER TABLE responsavel ADD COLUMN fkEmpResponsavel int unique, ADD constraint fkEmpresaResponsavel
															foreign key (fkEmpResponsavel)
															references empresa(idEmpresa);

DESCRIBE responsavel;

INSERT INTO responsavel (nome, fkEmpResponsavel) VALUES 
	('Andresa', 1),
    ('Thalita', 2);
    
SELECT * FROM responsavel;

SELECT * FROM empresa JOIN responsavel
		ON idEmpresa = fkEmpResponsavel;

SELECT a.nome as 'Nome Aluno', 
	e.nome as 'Nome Empresa', 
    r.nome as 'Nome Responsa'
    FROM aluno as a JOIN empresa as e
    ON a.fkEmpresa = e.idEmpresa
    JOIN responsavel as r
    ON e.idEmpresa = r.fkEmpResponsavel
		WHERE r.nome = 'Thalita';