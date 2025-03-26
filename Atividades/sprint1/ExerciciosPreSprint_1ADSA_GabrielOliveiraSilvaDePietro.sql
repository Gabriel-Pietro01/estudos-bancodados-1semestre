-- EXERCICIO 01 - LOJA DE JOGOS
CREATE DATABASE game_store;
    
USE game_store;
    
CREATE TABLE jogo (
		idJogo int primary key auto_increment,
        nome varchar(30),
        diretor varchar(30),
        genero varchar(30),
        dtLancamento date,
        nota int,
        constraint chkNota
			check(nota in (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
        quantidade int
    );
    
INSERT INTO jogo (nome, diretor, genero, dtLancamento, nota, quantidade) VALUES 
		('Dark Souls 1', 'Hidetaka Miyazaki', 'Souls Like', '2011-09-12', '9', '326'),
		('Persona 3 Reload', 'Takuya Yamaguchi', 'JRPG', '2024-04-11', '10', '172'),
		('Blasphemous', 'Enrique Cabeza', 'Metroidvania', '2019-08-09', '8', '721'),
		('Balatro', 'Johnatan', 'Rogue Like', '2024-03-13', '10', '423'),
		('Castle Crashers', 'John Baez', 'Hack n Slash', '2009-10-08', '7', '543');
        
-- REALIZANDO OS SELECTS E ALTERACOES
ALTER TABLE jogo ADD COLUMN tipo varchar(20), ADD constraint chkTipo check(tipo in ('fisico', 'digital'));
UPDATE jogo SET tipo = 'fisico' WHERE idJogo = 1;
UPDATE jogo SET tipo = 'digital' WHERE idJogo = 2;
UPDATE jogo SET tipo = 'fisico' WHERE idJogo = 3;
UPDATE jogo SET tipo = 'digital' WHERE idJogo = 4;
UPDATE jogo SET tipo = 'fisico' WHERE idJogo = 5;
SELECT * FROM jogo WHERE dtLancamento > '2015-01-01';
SELECT * FROM jogo WHERE nome LIKE '%a%' AND tipo = 'fisico';
SELECT * FROM jogo WHERE diretor NOT LIKE '%e%';

-- FAZENDO NOVAMENTE CHECAGEM DA NOTA
ALTER TABLE jogo DROP CONSTRAINT chkNota;
ALTER TABLE jogo ADD CONSTRAINT chkNota check(nota between 0 and 10);

SELECT * FROM jogo WHERE genero = 'Souls Like' AND quantidade > 0;

-- REALIZANDO O 9, FOI ATUALIZADO A QUANTIDADE DE 2 JOGOS DEVIDO A NENHUM TER 0 UNIDADES ANTES
UPDATE jogo SET quantidade = 0 WHERE idJogo = 4;
UPDATE jogo SET quantidade = 0 WHERE idJogo = 5;
SELECT * FROM jogo;
DELETE FROM jogo WHERE idJogo = 4;
DELETE FROM jogo WHERE idJogo = 5;

ALTER TABLE jogo RENAME COLUMN diretor to criador;
DESCRIBE jogo;


-- EXERCICIO 02 - ESPORTES OLIMPICOS
CREATE DATABASE olimpiadas;

USE olimpiadas;

CREATE TABLE esporte (
	idEsporte int primary key auto_increment,
    nome varchar(40),
    categoria varchar(20),
    constraint chkCategoria
		check(categoria in('Individual', 'Coletivo')),
	numeroJogadores int,
    estreia date,
    paisOrigem varchar(30)
);

INSERT INTO esporte (nome, categoria, numeroJogadores, estreia, paisOrigem) VALUES 
	('Futebol', 'Coletivo', 11, '1900-04-02', 'Inglaterra'),
    ('Volei', 'Coletivo', 6, '1964-07-24', 'Estados Unidos'),
    ('Natação', 'Individual', 1, '1896-09-13', 'Grécia'),
    ('Basquete', 'Coletivo', 5, '1936-08-03', 'Estados Unidos'),
    ('Judo', 'Individual', 1, '1964-09-01', 'Japão');
    
-- REALIZANDO OS SELECTS E ALTERACOES
ALTER TABLE esporte ADD COLUMN popularidade int;
ALTER TABLE esporte ADD CONSTRAINT chkPopularidade check(popularidade in (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
DESCRIBE esporte;

UPDATE esporte SET popularidade = 10 WHERE idEsporte = 1;
UPDATE esporte SET popularidade = 8 WHERE idEsporte = 2;
UPDATE esporte SET popularidade = 6 WHERE idEsporte = 3;
UPDATE esporte SET popularidade = 9 WHERE idEsporte = 4;
UPDATE esporte SET popularidade = 4 WHERE idEsporte = 5;

SELECT * FROM esporte ORDER BY popularidade ASC;
SELECT * FROM esporte WHERE estreia > '2000-01-01';

ALTER TABLE esporte ADD CONSTRAINT chkEstreia check(estreia between '1896-04-06' and '2025-01-01');
ALTER TABLE esporte DROP CONSTRAINT chkCategoria;
SELECT * FROM esporte WHERE paisOrigem LIKE '_a%';
SELECT * FROM esporte WHERE numeroJogadores BETWEEN 4 AND 11;
DELETE FROM esporte WHERE idEsporte = 1;
DELETE FROM esporte WHERE idEsporte = 3;
DELETE FROM esporte WHERE idEsporte = 5;


-- EXERCICIO 03 - DESENHOS ANIMADOS
CREATE DATABASE desenho;

USE desenho;

CREATE TABLE desenhosExibidos (
	idDesenho int primary key auto_increment,
    tituloDesenho varchar(50),
    dtLancamento date,
    emissora varchar(50),
    classificacao int,
    statusDesenho varchar(15),
    nota int,
    constraint chkNota 
		check(nota between 1 and 5)
);
ALTER TABLE desenhosExibidos AUTO_INCREMENT = 10;

INSERT INTO desenhosExibidos (tituloDesenho, dtLancamento, emissora, classificacao, statusDesenho, nota) VALUES
	('Avatar: A Lenda de Aang', '2005-02-21', 'Nickelodeon', 10, 'Finalizado', 5),
	('Hora de Aventura', '2010-04-05', 'Cartoon Network', 10, 'Exibindo', 4),
	('Os Jovens Titãs em Ação', '2013-04-23', 'Cartoon Network', 0, 'Exibindo', 3),
	('Gravity Falls: Um Verão de Mistérios', '2012-06-15', 'Disney Channel', 0, 'Finalizado', 5),
	('O Incrível Mundo de Gumball', '2011-05-03', 'Cartoon Network', 0, 'Finalizado', 4);
    
-- REALIZANDO OS SELECTS E ALTERACOES
SELECT * FROM desenhosExibidos;
SELECT * FROM desenhosExibidos WHERE classificacao <= 14;
SELECT * FROM desenhosExibidos WHERE emissora = "Cartoon Network";

ALTER TABLE desenhosExibidos ADD CONSTRAINT chkStatus check(statusDesenho in('Exibindo','Finalizado','Cancelado'));
INSERT INTO desenhosExibidos (tituloDesenho, dtLancamento, emissora, classificacao, statusDesenho, nota) VALUES
	('Sendokai 2', '2025-02-21', 'Nickelodeon', 10, 'Vai lançar ainda', 1);
    
UPDATE desenhosExibidos SET statusDesenho = 'Finalizado' WHERE idDesenho = 11;
UPDATE desenhosExibidos SET statusDesenho = 'Finalizado' WHERE idDesenho = 12;
DELETE FROM desenhosExibidos WHERE idDesenho = 12;
SELECT * FROM desenhosExibidos WHERE tituloDesenho LIKE 'A%';
ALTER TABLE desenhosExibidos RENAME COLUMN classificacao TO classificacaoIndicativa;
UPDATE desenhosExibidos SET nota = 3 WHERE idDesenho = 11;
UPDATE desenhosExibidos SET dtLancamento = '2008-03-05' WHERE idDesenho = 11;

TRUNCATE TABLE desenhosExibidos;
ALTER TABLE desenhosExibidos DROP CONSTRAINT chkStatus;


-- EXERCICIO 04 - DISPENSA DO SCOOBY DOO
CREATE DATABASE estoque;

USE estoque;

CREATE TABLE MisteriosSA (
	idProduto int primary key auto_increment,
    nomeProduto varchar(30),
    dtCompra date,
    preco float,
    peso int,
    dtRetirada date
);

INSERT INTO MisteriosSA (nomeProduto, dtCompra, preco, peso) VALUES
	('Biscoitos', '2025-01-14', 14.99, 600),
	('Hamburguer', '2025-02-20', 19.99, 250),
	('Mussarela', '2024-09-03', 4.25, 20),
	('Queijo', '2024-12-30', 2.50, 30),
	('Banana', '2025-01-05', 3.99, 50);
    
-- REALIZANDO OS SELECTS E ALTERACOES
SELECT * FROM MisteriosSA;
SELECT idProduto, dtCompra, dtRetirada FROM MisteriosSA ORDER BY dtCompra ASC;
UPDATE MisteriosSA SET dtRetirada = '2025-02-21' WHERE idProduto = 1;
ALTER TABLE MisteriosSA RENAME COLUMN idProduto TO idComida;
ALTER TABLE MisteriosSA ADD CONSTRAINT chkAlimento check(nomeProduto in ('Biscoitos Scooby', 'Cachorro-Quente')) NOT ENFORCED;
SELECT idComida, nomeProduto, dtCompra AS 'Data de Compra', dtRetirada AS 'Data da Retirada', preco, peso FROM MisteriosSA WHERE nomeProduto = 'Biscoitos Scooby';
SELECT * FROM MisteriosSA WHERE dtCompra < '2024-07-25';
SELECT * FROM MisteriosSA WHERE preco >= 30.50;

TRUNCATE TABLE MisteriosSA;


-- EXERCICIO 05 - HEROIS
CREATE DATABASE vingadores;

USE vingadores;

CREATE TABLE heroi (
	idHeroi int primary key auto_increment,
    nome varchar(45),
    versao varchar(45),
    habilidade varchar(50),
    altura int
);

INSERT INTO heroi (nome, versao, habilidade, altura) VALUES 
	('Hulk', 'O Incrivel Hulk', 'Super força', 300),
	('Homem Aranha', 'Homem Aranha 1', 'Soltar teia, Sexto sentido', 169),
	('Capitão América', 'Capitão América 2', 'Super soldado', 180),
	('Homem de Ferro', 'Homem de Ferro 3', 'Armadura Tecnológica', 175),
	('Homem Formiga', 'Homem Formiga 1', 'Diminuir seu tamanho', 170);
    
-- REALIZANDO OS SELECTS E ALTERACOES
SELECT * FROM heroi;
ALTER TABLE heroi ADD COLUMN regeneracao bool;
ALTER TABLE heroi MODIFY COLUMN versao varchar(100);
DELETE FROM heroi WHERE idHeroi = 3;

INSERT INTO heroi (nome, versao, habilidade, altura) VALUES
	('Doutor Estranho', 'Doutor Estranho 2: A verdade', 'Ver o futuro', 160);
    
SELECT * FROM heroi WHERE nome LIKE 'C%' OR nome LIKE 'H%';
SELECT * FROM heroi WHERE nome NOT LIKE '%a%';
SELECT nome FROM heroi WHERE altura > 190;
SELECT * FROM heroi WHERE altura > 180 ORDER BY nome DESC;

TRUNCATE TABLE heroi;