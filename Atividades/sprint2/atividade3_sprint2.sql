-- EXERCICIO 01 --
CREATE DATABASE AlunoProjeto;

USE AlunoProjeto;

CREATE TABLE projeto (
	idProjeto int primary key auto_increment,
    nome varchar(45),
    descricao varchar(85)
);

CREATE TABLE aluno (
	ra int primary key auto_increment,
    nome varchar(45),
    telefone varchar(12),
    fkResponsavel int,
    constraint fkResponsavelAluno foreign key (fkResponsavel)
		references aluno(ra),
	fkProjeto int,
    constraint fkResponsavelProjeto foreign key (fkProjeto)
		references projeto(idProjeto)
);

-- INSERINDO VALORES --
INSERT INTO projeto (nome, descricao) VALUES
('Sistema de Monitoramento de Estufas', 'Controle de temperatura e umidade em estufas agrícolas'),
('Aplicativo de Estudo Colaborativo', 'Plataforma para alunos trocarem materiais e dicas'),
('Detector de Gases para Pets', 'Dispositivo para alertar sobre gases tóxicos em ambientes fechados');

INSERT INTO aluno (nome, telefone, fkResponsavel, fkProjeto) VALUES
('Ana Silva', '11999999999', NULL, 1), 
('Bruno Souza', '11988888888', NULL, 2), 
('Carla Lima', '11977777777', NULL, 3);

INSERT INTO aluno (nome, telefone, fkResponsavel, fkProjeto) VALUES
('Diego Martins', '11966666666', 1, 1), 
('Eduarda Costa', '11955555555', 1, 1),
('Felipe Ramos', '11944444444', 2, 2), 
('Giovana Alves', '11933333333', 3, 3); 

SELECT * FROM aluno;
SELECT * FROM projeto;

SELECT aluno.nome AS Nome,
		aluno.telefone AS Telefone,
        aluno.fkProjeto AS 'Projeto designado',
        projeto.nome AS 'Nome do Projeto',
        projeto.descricao AS 'Descrição'
        FROM aluno JOIN projeto
			ON aluno.fkProjeto = projeto.idProjeto;
            
SELECT a.nome AS 'Nome Aluno',
		a.telefone AS Telefone,
        r.nome AS 'Responsável',
        r.telefone AS 'Telefone do Responsável'
        FROM aluno as a JOIN aluno as r
			ON a.fkResponsavel = r.ra;
            
SELECT aluno.nome AS Nome,
		aluno.telefone AS Telefone,
        aluno.fkProjeto AS 'Projeto Designado',
        projeto.nome AS 'Nome do Projeto',
        projeto.descricao AS 'Descrição'
        FROM aluno JOIN projeto
			ON aluno.fkProjeto = projeto.idProjeto
				WHERE projeto.nome = 'Sistema de Monitoramento de Estufas';

-- EXERCICIO 02 --
CREATE DATABASE Campanha;

USE Campanha;

CREATE TABLE organizador (
	idOrganizador int primary key auto_increment,
    nome varchar(45),
    rua varchar(45),
    bairro varchar(45),
    email varchar(45),
    fkOrientador int,
    constraint fkOrientadorOrganizador foreign key(fkOrientador)
		references organizador(idOrganizador)
) AUTO_INCREMENT = 30;

CREATE TABLE campanha (
	idCampanha int auto_increment,
    id_Organizador int,
		constraint pkComposta primary key (idCampanha, id_Organizador),
    categoria varchar(45),
	instituicao_1 varchar(45),
    instituicao_2 varchar(45),
    dtFinal date,
		constraint fkIdOrganizador foreign key (id_Organizador)
			references organizador(idOrganizador)
) AUTO_INCREMENT = 500;

-- INSERINDO VALORES --
INSERT INTO organizador (nome, rua, bairro, email, fkOrientador) VALUES
('Marcos Vieira', 'Rua das Flores', 'Centro', 'marcos@eventos.com', NULL),  
('Luciana Alves', 'Av. Brasil', 'Jardim América', 'luciana@eventos.com', NULL);

INSERT INTO organizador (nome, rua, bairro, email, fkOrientador) VALUES
('Tiago Santos', 'Rua Azul', 'Vila Nova', 'tiago@eventos.com', 30),   
('Juliana Rocha', 'Rua Verde', 'Centro', 'juliana@eventos.com', 31), 
('Fernanda Lima', 'Av. Paulista', 'Bela Vista', 'fernanda@eventos.com', 30), 
('Paulo Henrique', 'Rua das Palmeiras', 'Jardins', 'paulo@eventos.com', 31);

INSERT INTO campanha (id_Organizador, categoria, instituicao_1, instituicao_2, dtFinal) VALUES
(30, 'Alimentos', 'Banco de Alimentos', 'Cozinha Solidária', '2025-06-30'),
(30, 'Educação', 'Escola Esperança', 'Biblioteca Livre', '2025-08-15'),

(31, 'Saúde', 'Hospital Vida', 'Clínica Popular', '2025-07-20'),
(31, 'Cultura', 'Museu da Cidade', 'Teatro Popular', '2025-09-05'),

(32, 'Meio Ambiente', 'EcoVida', 'ReciclaMais', '2025-05-22'),
(33, 'Infância', 'Creche Amor', 'Brinquedoteca Mágica', '2025-07-10'),

(34, 'Animais', 'Abrigo Patinhas', 'Veterinária Popular', '2025-06-18'),
(35, 'Doações', 'Igreja Solidária', 'Associação Luz', '2025-10-01');

SELECT * FROM organizador;
SELECT * FROM campanha;

SELECT organizador.nome AS Organizador,
		organizador.rua AS Rua,
        organizador.bairro AS Bairro,
        organizador.email AS Email,
        campanha.categoria AS 'Categoria da Campanha',
        campanha.instituicao_1 AS 'Instituição Primária',
        campanha.instituicao_2 AS 'Instituição Secundária',
        campanha.dtFinal AS Termino
        FROM organizador JOIN campanha
			ON campanha.id_Organizador = organizador.idOrganizador;

SELECT organizador.nome AS Organizador,
		organizador.rua AS Rua,
        organizador.bairro AS Bairro,
        organizador.email AS Email,
        campanha.categoria AS 'Categoria da Campanha',
        campanha.instituicao_1 AS 'Instituição Primária',
        campanha.instituicao_2 AS 'Instituição Secundária',
        campanha.dtFinal AS Termino
        FROM organizador JOIN campanha
			ON campanha.id_Organizador = organizador.idOrganizador
				WHERE organizador.nome = 'Luciana Alves';
                
SELECT o.nome AS Organizador,
		o.rua AS Rua,
        o.bairro AS Bairro,
        o.email AS Email,
        CASE
			WHEN r.nome IS NULL THEN 'Sem Orientador'
            ELSE r.nome 
		END AS Orientador,
        r.rua AS Rua,
        r.bairro AS Bairro,
        r.email AS 'Email do Orientador'
        FROM organizador AS o LEFT JOIN organizador AS R
			ON o.fkOrientador = r.idOrganizador;
            
SELECT o.nome AS Organizador,
		o.rua AS Rua,
        o.bairro AS Bairro,
        o.email AS Email,
        CASE
			WHEN r.nome IS NULL THEN 'Sem Orientador'
            ELSE r.nome 
		END AS Orientador,
        r.rua AS Rua,
        r.bairro AS Bairro,
        r.email AS 'Email do Orientador'
        FROM organizador AS o LEFT JOIN organizador AS r
			ON o.fkOrientador = r.idOrganizador
				WHERE r.nome = 'Marcos Vieira';
                
SELECT o.nome AS Organizador,
		o.rua AS Rua,
        o.bairro AS Bairro,
        o.email AS Email,
        CASE
			WHEN r.nome IS NULL THEN 'Sem Orientador'
            ELSE r.nome 
		END AS Orientador,
        r.rua AS Rua,
        r.bairro AS Bairro,
        r.email AS 'Email do Orientador',
		c.categoria AS 'Categoria da Campanha',
        c.instituicao_1 AS 'Instituição Primária',
        c.instituicao_2 AS 'Instituição Secundária',
        c.dtFinal AS Termino
        FROM organizador AS o LEFT JOIN organizador AS r
			ON o.fkOrientador = r.idOrganizador
		JOIN campanha AS c 
			ON c.id_Organizador = o.idOrganizador;

SELECT o.nome AS Organizador,
		o.rua AS Rua,
        o.bairro AS Bairro,
        o.email AS Email,
        CASE
			WHEN r.nome IS NULL THEN 'Sem Orientador'
            ELSE r.nome 
		END AS Orientador,
        r.rua AS Rua,
        r.bairro AS Bairro,
        r.email AS 'Email do Orientador',
		c.categoria AS 'Categoria da Campanha',
        c.instituicao_1 AS 'Instituição Primária',
        c.instituicao_2 AS 'Instituição Secundária',
        c.dtFinal AS Termino
        FROM organizador AS o LEFT JOIN organizador AS r
			ON o.fkOrientador = r.idOrganizador
		JOIN campanha AS c 
			ON c.id_Organizador = o.idOrganizador
				WHERE o.nome = 'Juliana Rocha';

		
 
