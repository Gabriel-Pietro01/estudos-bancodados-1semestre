-- EXERCICIO 01

USE sprint2;

-- CRIANDO AS TABELAS
CREATE TABLE area (
	idArea int primary key auto_increment,
    setor varchar(45)
);

CREATE TABLE funcionario (
	idFuncionario int primary key auto_increment,
    nome varchar(45),
    idade int,
    fkSupervisor int,
    constraint fkSupervisorFuncionario
		foreign key (fkSupervisor)
			references funcionario(idFuncionario),
	fkIdArea int,
    constraint fkAreaFuncionario
		foreign key (fkIdArea)
			references area(idArea)
);

-- INSERINDO VALORES
INSERT INTO area (setor) VALUES 
	('Banco de Dados'),
    ('Algoritmo'),
    ('Infraestrutura');
    
INSERT INTO funcionario (nome, idade, fkIdArea) VALUES 
	('Vivian', 30, 1),
    ('Edinho', 24, 1),
    ('Marcio', 29, 3),
    ('Brandão', 34, 2),
    ('Jotapê', 28, 2),
    ('Lucas', 20, 2),
    ('Davi', 22, 3);
    
UPDATE funcionario SET fkSupervisor = 4 WHERE idFuncionario = 1;
UPDATE funcionario SET fkSupervisor = 1 WHERE idFuncionario = 2;
UPDATE funcionario SET fkSupervisor = 4 WHERE idFuncionario = 3;
UPDATE funcionario SET fkSupervisor = 2 WHERE idFuncionario = 4;
UPDATE funcionario SET fkSupervisor = 4 WHERE idFuncionario = 5;
UPDATE funcionario SET fkSupervisor = 5 WHERE idFuncionario = 6;
UPDATE funcionario SET fkSupervisor = 3 WHERE idFuncionario = 7;
    
-- REALIZANDO OS SELECTS

-- SELECT JOIN
SELECT f.nome as NomeFuncionario,
		f.idade as IdadeFuncionario,
        s.nome as Supervisor,
        s.idade as IdadeSupervisor,
        a.setor as Area
        FROM funcionario as f 
        JOIN funcionario as s
			ON f.fkSupervisor = s.idFuncionario
		JOIN area as a
			ON f.fkIdArea = a.idArea;
            
-- SELECT JOIN + WHERE
SELECT f.nome as NomeFuncionario,
		f.idade as IdadeFuncionario,
        s.nome as Supervisor,
        s.idade as IdadeSupervisor,
        a.setor as Area
        FROM funcionario as f 
        JOIN funcionario as s
			ON f.fkSupervisor = s.idFuncionario
		JOIN area as a
			ON f.fkIdArea = a.idArea
		WHERE a.setor = 'Algoritmo';

-- SELECT JOIN + CASE
SELECT f.nome as NomeFuncionario,
        s.nome as Supervisor,
        a.setor as Area,
        CASE 
			WHEN f.nome = 'Edinho' THEN 'Monitor de Banco de Dados'
            WHEN f.nome = 'Lucas' THEN 'Monitor de Algoritmos'
            WHEN f.nome = 'Davi' THEN 'Monitor de SO'
            ELSE 'Lider Pedagógico ou Coordenador'
		END AS Cargo
        FROM funcionario as f 
        JOIN funcionario as s
			ON f.fkSupervisor = s.idFuncionario
		JOIN area as a
			ON f.fkIdArea = a.idArea;
		
-- EXERCICIO 02
 USE sprint2;
 
 -- CRIANDO AS TABELAS
 CREATE TABLE usuario (
	idUsuario int primary key auto_increment,
    nome varchar(45),
    fkUsuarioGerenciador int,
    constraint fkIdUsuarioGerenciador
		foreign key (fkUsuarioGerenciador)
			references usuario(idUsuario)
 );
 
 CREATE TABLE email (
	idEmail int primary key auto_increment,
    enderecoEmail varchar(80),
    fkIdUsuario int,
    constraint fkIdUsuarioDono
		foreign key (fkIdUsuario)
			references usuario(idUsuario)
 );
 
-- INSERINDO VALORES
INSERT INTO usuario (nome, fkUsuarioGerenciador) VALUES
	('root', null),
    ('Gabriel', null),
    ('Zeca', null),
    ('Josep', null),
    ('Nhonho', null);

UPDATE usuario SET fkUsuarioGerenciador = 3 WHERE idUsuario = 2;
UPDATE usuario SET fkUsuarioGerenciador = 5 WHERE idUsuario = 4;

INSERT INTO email (enderecoEmail, fkIdUsuario) VALUES 
	('adm@gmail.com', 1),
    ('gabriel@gmail.com', 2),
    ('gabigol.sp@gmail.com', 2),
    ('zedupao@gmail.com', 3),
    ('zeca.sp@gmail.com', 3),
    ('josepio.sp@gmail.com', 4),
    ('gordinchavoso@gmail.com', 5);

-- REALIZANDO OS SELECTS 

-- SELECT JOIN 
SELECT  u.nome as Username,
		g.nome as UsuarioQueGerencia,
        e.enderecoEmail as Email
        FROM usuario as u
        JOIN usuario as G
			ON u.fkUsuarioGerenciador = g.idUsuario
		JOIN email as e
			ON e.fkIdUsuario = u.idUsuario;
            
-- SELECT JOIN + WHERE
SELECT u.nome as Username,
	   g.nome as UsuarioQueGerencia,
       e.enderecoEmail as Email 
       FROM usuario as u
       JOIN usuario as g
			ON u.fkUsuarioGerenciador = g.idUsuario
       JOIN email as e
			ON e.fkIdUsuario = u.idUsuario
		WHERE e.enderecoEmail LIKE '%.sp%';
        
-- SELECT JOIN + CASE
SELECT u.nome as Username,
	   g.nome as UsuarioQueGerencia,
       e.enderecoEmail as Email,
       CASE 
			WHEN u.nome = 'Josep' OR 'root' THEN 'Estrangeiro/Sistema'
            ELSE 'Brasileiro'
	   END AS 'Origem'
       FROM usuario as u
       JOIN usuario as g
			ON u.fkUsuarioGerenciador = g.idUsuario
	   JOIN email as e
			ON e.fkIdUsuario = u.idUsuario;