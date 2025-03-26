-- EXERCICIO 1
CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

-- INSERINDO DADOS
INSERT INTO Atleta VALUES
	(1, 'João Tonhão', 'Futebol', 3),
    (2, 'Ivonildo', 'Futebol', 6),
    (3, 'Omar Cleides', 'Natação', 5),
    (4, 'Sérgio', 'Natação', 2),
    (5, 'Dunha da Silva', 'Basquete', 3),
    (6, 'Enzo', 'Basquete', 1);

-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM Atleta;
SELECT nome, qtdMedalha FROM Atleta;
SELECT * FROM Atleta WHERE modalidade = 'Basquete';
SELECT * FROM Atleta ORDER BY modalidade;
SELECT * FROM Atleta ORDER BY qtdMedalha DESC;
SELECT * FROM Atleta WHERE nome LIKE '%s%';
SELECT * FROM Atleta WHERE nome LIKE 'i%';
SELECT * FROM Atleta WHERE nome LIKE '%o';
SELECT * FROM Atleta WHERE nome LIKE '%r_';

DROP TABLE Atleta;

-- EXERCICIO 2
USE sprint1;

CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

-- INSERINDO DADOS
INSERT INTO Musica VALUES 
	(1, 'Black Star', 'Radiohead', 'Rock'),
    (2, 'High and Dry', 'Radiohead', 'Rock'),
    (3, 'Save That Shit', 'Lil Peep', 'Trap'),
    (4, 'The Real Slim Shady', 'Eminem', 'Rap'),
    (5, 'Mockingbird', 'Eminem', 'Rap'),
    (6, 'Shine', 'Spektrem', 'Eletrônica'),
    (7, 'Last Surprise', 'Lyn', 'Jazz');
    
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM Musica;
SELECT titulo, artista FROM Musica;
SELECT * FROM Musica WHERE genero = 'Rock';
SELECT * FROM Musica WHERE artista = 'Eminem';
SELECT * FROM Musica ORDER BY titulo;
SELECT * FROM Musica ORDER BY artista DESC;
SELECT * FROM Musica WHERE titulo LIKE 's%';
SELECT * FROM Musica WHERE artista LIKE '%m';
SELECT * FROM Musica WHERE genero LIKE '_a%';
SELECT * FROM Musica WHERE titulo LIKE '%r_';

DROP TABLE Musica;

-- EXERCICIO 3
USE sprint1;

CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);
    
-- INSERINDO DADOS
INSERT INTO Filme VALUES 
	(1, 'Interstellar', 'Ficção Cientifica', 'Christopher Nolan'),
    (2, 'Batman Begins', 'Ação', 'Christopher Nolan'),
    (3, 'Clube da Luta', 'Drama', 'David Fincher'),
    (4, 'Jurassic Park', 'Ficção Cientifica', 'Steven Spielberg'),
    (5, 'Se Beber Não Case', 'Comédia', 'Todd Phillips'),
    (6, 'Férias Frustadas', 'Comédia', 'Jonathan Goldstein'),
    (7, 'O Menino e a Garça', 'Animação/Fantasia', 'Hayao Miyazaki');
  
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM Filme;
SELECT titulo, diretor FROM Filme;
SELECT * FROM Filme WHERE genero = 'Comédia';
SELECT * FROM Filme WHERE diretor = 'Christopher Nolan';
SELECT * FROM Filme ORDER BY titulo;
SELECT * FROM Filme ORDER BY diretor DESC;
SELECT * FROM Filme WHERE titulo LIKE 'o%';
SELECT * FROM Filme WHERE diretor LIKE '%n';
SELECT * FROM Filme WHERE genero LIKE '_i%';
SELECT * FROM Filme WHERE titulo LIKE '%a_';

DROP TABLE Filme;

-- EXERCICIO 4 
USE sprint1;

CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

-- INSERINDO DADOS
INSERT INTO Professor VALUES 
	(1, 'Altair', 'História', '1976-12-01'),
	(2, 'José', 'História', '1974-08-15'),
	(3, 'Claúdio', 'Português', '1972-01-20'),
	(4, 'Junior', 'Educação Fisica', '1986-04-07'),
	(5, 'Hebert', 'Educação Fisica', '1989-07-02'),
	(6, 'Fabiano', 'Matemática', '1990-09-27');
    
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM Professor;
SELECT especialidade FROM Professor;
SELECT * FROM Professor WHERE especialidade = 'Educação Fisica';
SELECT * FROM Professor ORDER BY nome;
SELECT * FROM Professor ORDER BY dtNasc DESC;
SELECT * FROM Professor WHERE nome LIKE 'j%';
SELECT * FROM Professor WHERE nome LIKE '%o';
SELECT * FROM Professor WHERE nome LIKE '_l%';
SELECT * FROM Professor WHERE nome LIKE '%r_';

DROP TABLE Professor;

-- EXERCICIO 5
USE sprint1;

CREATE TABLE Jogo (
	idJogo INT PRIMARY KEY,
    nome VARCHAR(50),
    comentario VARCHAR(200),
    ranking INT
);

-- INSERINDO DADOS
INSERT INTO Jogo VALUES 
	(1, 'Dark Souls 1', 'Desafio brutal e mundo interconectado impecável. Cada vitória é uma conquista épica, e a atmosfera solitária é envolvente.', 1),
    (2, 'Persona 3 Reload', 'História profunda e personagens cativantes. A mistura de vida escolar com batalhas cria uma imersão única e viciante.', 2),
    (3, 'Blasphemous', 'Arte sombria e combate desafiador. A estética gótica e a trilha sonora tornam a experiência intensa e memorável.', 3),
    (4, 'Balatro', 'Pôquer com roguelike viciante. Cada partida traz novas estratégias e surpresas, garantindo horas de diversão.', 4),
    (5, 'Castle Crashers', 'Beat em up caótico e divertido, perfeito pra jogar com amigos. Humor leve e arte cartunesca garantem boas risadas.', 5);
    
-- SELECIONANDO DE ACORDO COM A ESPECIFICAÇÃO DESEJADA
SELECT * FROM Jogo;
SELECT nome FROM Jogo;
SELECT comentario FROM Jogo WHERE nome = 'Persona 3 Reload';
SELECT * FROM Jogo ORDER BY nome;
SELECT * FROM Jogo ORDER BY ranking DESC;
SELECT * FROM Jogo WHERE nome LIKE 'b%';
SELECT * FROM Jogo WHERE nome LIKE '%s';
SELECT * FROM Jogo WHERE nome LIKE '_a%';
SELECT * FROM Jogo WHERE nome LIKE '%r_';
SELECT * FROM Jogo WHERE nome != 'Minecraft';

DROP TABLE Jogo;



    