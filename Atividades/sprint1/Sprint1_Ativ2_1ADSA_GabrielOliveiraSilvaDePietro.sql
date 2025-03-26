-- EX 01
USE sprint1;

CREATE TABLE atleta (
	idAtleta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

INSERT INTO atleta (nome, modalidade, qtdMedalha) VALUES
	('Zinho da Silva', 'Atletismo', 6),
    ('Pedro Antonio', 'Atletismo', 9),
    ('João Feijão', 'Volei', 8),
    ('Ivan Pereira', 'Volei', 4),
    ('Neilton Camargo', 'Futsal', 2);
    
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM atleta;
UPDATE atleta SET qtdMedalha = 10 WHERE idAtleta = 1;
UPDATE atleta SET qtdMedalha = 11 WHERE idAtleta = 2;
UPDATE atleta SET qtdMedalha = 9 WHERE idAtleta = 3;
UPDATE atleta SET nome = 'Mario Bragantino' WHERE idAtleta = 4;
ALTER TABLE atleta ADD COLUMN dtNasc DATE;
UPDATE atleta SET dtNasc = '2002-09-11' WHERE idAtleta = 1;
UPDATE atleta SET dtNasc = '1999-12-01' WHERE idAtleta = 2;
UPDATE atleta SET dtNasc = '2003-02-07' WHERE idAtleta = 3;
UPDATE atleta SET dtNasc = '1988-05-20' WHERE idAtleta = 4;
UPDATE atleta SET dtNasc = '1990-07-17' WHERE idAtleta = 5;
DELETE FROM atleta WHERE idAtleta = 5;
SELECT * FROM atleta WHERE modalidade != 'Natação';
SELECT * FROM atleta WHERE qtdMedalha >= 3;
ALTER TABLE atleta MODIFY COLUMN modalidade VARCHAR(60);
DESCRIBE atleta;

-- LIMPANDO OS DADOS
TRUNCATE TABLE atleta;


-- EX 02
USE sprint1;

CREATE TABLE musica (
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

INSERT INTO musica (titulo, artista, genero) VALUES 
	('Black Star', 'Radiohead', 'Rock'),
    ('High and Dry', 'Radiohead', 'Rock'),
    ('Save That Shit', 'Lil Peep', 'Trap'),
    ('The Real Slim Shady', 'Eminem', 'Rap'),
    ('Mockingbird', 'Eminem', 'Rap'),
    ('Shine', 'Spektrem', 'Eletrônica'),
    ('Last Surprise', 'Lyn', 'Jazz');
    
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM musica;
ALTER TABLE musica ADD COLUMN curtidas INT;
UPDATE musica SET curtidas = 812 WHERE idMusica = 1;
UPDATE musica SET curtidas = 712 WHERE idMusica = 2;
UPDATE musica SET curtidas = 678 WHERE idMusica = 3;
UPDATE musica SET curtidas = 924 WHERE idMusica = 4;
UPDATE musica SET curtidas = 643 WHERE idMusica = 5;
UPDATE musica SET curtidas = 213 WHERE idMusica = 6;
UPDATE musica SET curtidas = 345 WHERE idMusica = 7;
ALTER TABLE musica MODIFY COLUMN artista VARCHAR(80);
UPDATE musica SET curtidas = 1024 WHERE idMusica = 1;
UPDATE musica SET curtidas = 680 WHERE idMusica = 2;
UPDATE musica SET curtidas = 600 WHERE idMusica = 3;
UPDATE musica SET titulo = 'Gangnam Style' WHERE idMusica = 5;
DELETE FROM musica WHERE idMusica = 4;
SELECT * FROM musica WHERE genero != 'Funk';
SELECT * FROM musica WHERE curtidas >= 20;
DESCRIBE musica;

-- LIMPANDO OS DADOS
TRUNCATE TABLE musica;


-- EX 03
USE sprint1;

CREATE TABLE filme (
	idFilme INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);

INSERT INTO filme (titulo, genero, diretor) VALUES 
	('Interstellar', 'Ficção Cientifica', 'Christopher Nolan'),
    ('Batman Begins', 'Ação', 'Christopher Nolan'),
    ('Clube da Luta', 'Drama', 'David Fincher'),
    ('Jurassic Park', 'Ficção Cientifica', 'Steven Spielberg'),
    ('Se Beber Não Case', 'Comédia', 'Todd Phillips'),
    ('Férias Frustadas', 'Comédia', 'Jonathan Goldstein'),
    ('O Menino e a Garça', 'Animação/Fantasia', 'Hayao Miyazaki');
    
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM filme;
ALTER TABLE filme ADD COLUMN protagonista VARCHAR(50);
UPDATE filme SET protagonista = 'Cooper' WHERE idFilme = 1;
UPDATE filme SET protagonista = 'Bruce Wayne' WHERE idFilme = 2;
UPDATE filme SET protagonista = 'Tyler Durden' WHERE idFilme = 3;
UPDATE filme SET protagonista = 'Alan' WHERE idFilme = 4;
UPDATE filme SET protagonista = 'Phil' WHERE idFilme = 5;
UPDATE filme SET protagonista = 'Russel' WHERE idFilme = 6;
UPDATE filme SET protagonista = 'Mahito Maki' WHERE idFilme = 7;
ALTER TABLE filme MODIFY COLUMN diretor VARCHAR(150);
UPDATE filme SET diretor = 'Tim Maia' WHERE idFilme = 5;
UPDATE filme SET diretor = 'Zeca Pagodinho' WHERE idFilme = 2;
UPDATE filme SET diretor = 'Son Goku' WHERE idFilme = 7;
UPDATE filme SET titulo = 'De volta para o futuro' WHERE idFilme = 6;
DELETE FROM filme WHERE idFilme = 3;
SELECT * FROM filme WHERE genero != 'Drama';
SELECT * FROM filme WHERE genero = 'Suspense';
DESCRIBE filme;

-- LIMPANDO OS DADOS 
TRUNCATE TABLE filme;


-- EX 04
USE sprint1;

CREATE TABLE professor (
	idProfessor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

INSERT INTO professor (nome, especialidade, dtNasc) VALUES 
	('Altair', 'História', '1976-12-01'),
	('José', 'História', '1974-08-15'),
	('Claúdio', 'Português', '1972-01-20'),
	('Junior', 'Educação Fisica', '1986-04-07'),
	('Hebert', 'Educação Fisica', '1989-07-02'),
	('Fabiano', 'Matemática', '1990-09-27');
    
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM professor;
ALTER TABLE professor ADD COLUMN funcao VARCHAR(50) CHECK (funcao in ('monitor', 'assistente', 'titular'));
UPDATE professor SET funcao = 'titular' WHERE idProfessor = 1;
UPDATE professor SET funcao = 'assistente' WHERE idProfessor = 2;
UPDATE professor SET funcao = 'titular' WHERE idProfessor = 3;
UPDATE professor SET funcao = 'titular' WHERE idProfessor = 4;
UPDATE professor SET funcao = 'monitor' WHERE idProfessor = 5;
UPDATE professor SET funcao = 'titular' WHERE idProfessor = 6;
INSERT INTO professor (nome, especialidade, dtNasc, funcao) VALUES
	('Joca', 'Informática', '1994-04-08', 'assistente');
DELETE FROM professor WHERE idProfessor = 5;
SELECT nome FROM professor WHERE funcao = 'titular';
SELECT especialidade, dtNasc FROM professor WHERE funcao = 'monitor';
UPDATE professor SET dtNasc = '1980-03-13' WHERE idProfessor = 3;

-- LIMPANDO OS DADOS
TRUNCATE TABLE professor;


-- EX 05
USE sprint1;

CREATE TABLE curso (
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sigla CHAR(3),
    coordenador VARCHAR(50)
);

INSERT INTO curso (nome, sigla, coordenador) VALUES 
	('Análise e Desenvolvimento de Sistemas', 'ADS', 'Alex'),
    ('Ciência da Computação', 'CCO', 'Joana'),
    ('Sistema de Informação', 'SSI', 'Paulo');
    
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM curso;
SELECT coordenador FROM curso;
SELECT * FROM curso WHERE sigla = 'ADS';
SELECT * FROM curso ORDER BY nome;
SELECT * FROM curso ORDER BY coordenador DESC;
SELECT * FROM curso WHERE nome LIKE 'S%';
SELECT * FROM curso WHERE nome LIKE '%o';
SELECT * FROM curso WHERE nome LIKE '_i%'; 
SELECT * FROM curso WHERE nome LIKE '%a_';

-- LIMPANDO DADOS
TRUNCATE TABLE curso;


-- EX 06
USE sprint1;

CREATE TABLE revista (
	idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

INSERT INTO revista (nome) VALUES 
	('Recreio'),
    ('Veja'),
    ('Quatro Rodas'),
    ('Vogue');
    
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM revista;
UPDATE revista SET categoria = 'Entretetimento' WHERE idRevista = 1;
UPDATE revista SET categoria = 'Informativa' WHERE idRevista = 2;
UPDATE revista SET categoria = 'Automotivos' WHERE idRevista = 3;
SELECT * FROM revista;
INSERT INTO revista (nome, categoria) VALUES 
	('Forbes', 'Economia'),
    ('Placar', 'Futebol'),
    ('Elle', 'Moda');
SELECT * FROM revista;
DESCRIBE revista;
ALTER TABLE revista MODIFY COLUMN categoria VARCHAR(40);
DESCRIBE revista;
ALTER TABLE revista ADD COLUMN periodicidade VARCHAR(15);
SELECT * FROM revista;
ALTER TABLE revista DROP COLUMN periodicidade;


-- EX 07
USE sprint1;

CREATE TABLE carro (
	idCarro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    placa CHAR(7)
);
ALTER TABLE carro AUTO_INCREMENT = 1000;

INSERT INTO carro (nome, placa) VALUES
	('Fusca', '6744590'),
	('Uno', '1445905'),
	('Vectra', '9854663'),
	('Monza', '9988123');
    
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM carro;
INSERT INTO carro (nome) VALUES 
	('Corola'),
	('Fiesta'),
	('Gol');
SELECT * FROM carro;
DESCRIBE carro;
ALTER TABLE carro MODIFY COLUMN nome VARCHAR(28);
DESCRIBE carro;
ALTER TABLE carro ADD COLUMN ano CHAR(4);
UPDATE carro SET ano = '1976' WHERE idCarro = 1000;
UPDATE carro SET ano = '1986' WHERE idCarro = 1001;
UPDATE carro SET ano = '1998' WHERE idCarro = 1002;
UPDATE carro SET ano = '1994' WHERE idCarro = 1003;
UPDATE carro SET ano = '2016' WHERE idCarro = 1004;
UPDATE carro SET ano = '2010' WHERE idCarro = 1005;
UPDATE carro SET ano = '2004' WHERE idCarro = 1006;
UPDATE carro SET placa = '7722490' WHERE idCarro = 1004;
UPDATE carro SET placa = '2274395' WHERE idCarro = 1005;
UPDATE carro SET placa = '0124537' WHERE idCarro = 1006;