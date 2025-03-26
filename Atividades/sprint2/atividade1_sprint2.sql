-- EXERCICIO 01

CREATE DATABASE Sprint2;
USE Sprint2;

CREATE TABLE atleta (
	idAtleta int primary key auto_increment,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

-- INSERÇÃO DE DADOS DA TABELA ATLETA
INSERT INTO atleta(nome, modalidade, qtdMedalha) VALUES 
	('João Dunha', 'Natação', 4),
	('Zena dos Santos', 'Natação', 2),
	('Felipe Costa', 'Atletismo', 1),
	('Luis Cunha', 'Atletismo', 3),
	('Bruce Wayne', 'Escalada', 5);
    
CREATE TABLE pais (
	idPais int primary key auto_increment,
    nome varchar(30),
    capital varchar(40)
);

-- INSERÇÃO DE DADOS DA TABELA PAÍS
INSERT INTO pais(nome, capital) VALUES 
	('Brasil', 'Brasília'),
	('Argentina', 'Buenos Aires'),
	('Japão', 'Tokyo'),
	('Canadá', 'Ottawa');
    
-- REALIZANDO AS ALTERAÇÕES E SELECTS
ALTER TABLE atleta ADD COLUMN fkIdPaís int;
ALTER TABLE atleta ADD CONSTRAINT foreign key (fkIdPaís) references pais(idPais);
UPDATE atleta SET fkIdPaís = 1 WHERE idAtleta = 1;
UPDATE atleta SET fkIdPaís = 2 WHERE idAtleta = 2;
UPDATE atleta SET fkIdPaís = 1 WHERE idAtleta = 3;
UPDATE atleta SET fkIdPaís = 3 WHERE idAtleta = 4;
UPDATE atleta SET fkIdPaís = 4 WHERE idAtleta = 5;
SELECT * FROM atleta JOIN pais ON idPais = fkIdPaís;
SELECT atleta.nome AS NomeAtleta, pais.nome AS País 
		FROM atleta JOIN pais ON idPais = fkIdPaís;
SELECT * FROM atleta JOIN pais ON idPais = fkIdPaís WHERE pais.capital = 'Brasília';


-- EXERCICIO 02
USE Sprint2;

CREATE TABLE Musica (
	idMusica int primary key auto_increment,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

-- INSERÇÃO DE DADOS NA TABELA MUSICA
INSERT INTO Musica(titulo, artista, genero) VALUES 
	('Amiga da Minha Mulher', 'Seu Jorge', 'Samba'),
	('Break Stuff', 'Limp Bizkit', 'Rock'),
	('Just Drop Dead', 'limp Bizkit', 'Rock');
    
CREATE TABLE album (
	idAlbum int primary key auto_increment,
    nome varchar(30),
    tipo varchar(15),
    constraint chkTipo
		check (tipo in ('Digital', 'Fisico')),
	dtLancamento date
);

-- INSERÇÃO DE DADOS NA TABELA MUSICA
INSERT INTO album(nome, tipo, dtLancamento) VALUES 
	('Significant Other', 'Digital', '1999-02-27'),
	('Musica para Churrasco, Vol. 1', 'Fisico', '2011-02-01');
    
-- REALIZANDO AS ALTERAÇÕES 
SELECT * FROM Musica;
SELECT * FROM album;
ALTER TABLE Musica ADD COLUMN fkIdAlbum int;
ALTER TABLE Musica ADD CONSTRAINT foreign key (fkIdAlbum) references album(idAlbum);
UPDATE Musica SET fkIdAlbum = 2 WHERE idMusica = 1;
UPDATE Musica SET fkIdAlbum = 1 WHERE idMusica = 2;
UPDATE Musica SET fkIdAlbum = 1 WHERE idMusica = 3;
SELECT * FROM Musica JOIN album ON idAlbum = fkIdAlbum;
SELECT Musica.titulo AS TituloMúsica, album.nome AS NomeAlbum 
		FROM Musica JOIN album ON idAlbum = fkIdAlbum;
SELECT * FROM Musica JOIN album ON idAlbum = fkIdAlbum WHERE album.tipo = 'Digital';


-- EXERCICIO 03
USE sprint2;

CREATE TABLE pessoa (
	idPessoa int primary key auto_increment,
    nome varchar(45),
    cpf char(11)
);

CREATE TABLE reserva (
	idReserva int primary key auto_increment,
    dtReserva datetime,
	dtRetirada datetime,
    dtDevolucao datetime,
    fkPessoa int
);

-- INSERÇÃO DE DADOS NAS TABELAS
INSERT INTO pessoa (nome, cpf) VALUES
    ('Carlos Silva', '12345678901'),
    ('Ana Souza', '23456789012'),
    ('Bruno Lima', '34567890123'),
    ('Mariana Rocha', '45678901234'),
    ('Fernanda Alves', '56789012345');

INSERT INTO reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES
    ('2024-03-20 10:00:00', '2024-03-21 08:00:00', '2024-03-25 18:00:00', 1),
    ('2024-03-21 12:30:00', '2024-03-22 09:00:00', '2024-03-26 15:00:00', 2),
    ('2024-03-22 14:00:00', '2024-03-23 10:00:00', '2024-03-27 16:00:00', 3),
    ('2024-03-23 16:45:00', '2024-03-24 11:00:00', '2024-03-28 12:00:00', 4),
    ('2024-03-24 18:20:00', '2024-03-25 07:30:00', '2024-03-29 14:30:00', 5);

ALTER TABLE reserva ADD CONSTRAINT foreign key (fkPessoa) references pessoa(idPessoa);

SELECT * FROM pessoa JOIN reserva ON fkPessoa = idPessoa;
SELECT pessoa.idPessoa AS Identificacao,
		pessoa.nome AS Nome,
		pessoa.cpf AS CPF,
        reserva.idReserva AS NumeroDaReserva,
        reserva.dtReserva AS DataDaReserva,
        reserva.dtRetirada AS DataDaRetirada,
		reserva.dtDevolucao AS DataDaDevolucao,
        reserva.fkPessoa AS IdenficacaoDeQuemResevou
			FROM pessoa JOIN reserva ON fkPessoa = idPessoa;
            
SELECT *, CASE 
		WHEN reserva.dtDevolucao < '2024-03-27 00:00:00' THEN 'Devolvida'
		WHEN reserva.dtDevolucao >= '2024-03-27 00:00:00' THEN 'Pendente'
        ELSE 'Sem Informação'
	END AS StatusDaReserva
FROM pessoa JOIN reserva ON fkPessoa = idPessoa;

SELECT *, IFNULL(reserva.dtReserva, 'Não reservou ainda') AS ReservaValida
	FROM pessoa JOIN reserva ON fkPessoa = idPessoa;
    
    
-- EXERCICIO 04
USE sprint2;

CREATE TABLE Pessoa1 (
	idPessoa1 int primary key auto_increment,
    nome varchar(45),
    dtNascimento date
);

CREATE TABLE Pessoa2 (
	idPessoa2 int primary key auto_increment,
    nome varchar(45),
    dtNascimento date,
    fkPessoa1 int
);

-- INSERÇÃO DOS DADOS NAS TABELAS
INSERT INTO Pessoa1 (nome, dtNascimento) VALUES
    ('Carlos Silva', '1985-07-12'),
    ('Ana Souza', '1990-03-25'),
    ('Bruno Lima', '1988-09-10'),
    ('Mariana Rocha', '1995-11-05'),
    ('Fernanda Alves', '2000-06-18');
    
INSERT INTO Pessoa2 (nome, dtNascimento, fkPessoa1) VALUES
    ('João Silva', '2010-08-15', 1),
    ('Beatriz Souza', '2012-05-20', 2),
    ('Lucas Lima', '2015-02-18', 3),
    ('Camila Rocha', '2018-10-30', 4),
    ('Gustavo Alves', '2020-12-25', 5);
    
ALTER TABLE Pessoa2 ADD CONSTRAINT foreign key (fkPessoa1) references Pessoa1(idPessoa1);
SELECT * FROM Pessoa1 JOIN Pessoa2 ON fkPessoa1 = idPessoa1;
SELECT Pessoa1.idPessoa1 AS IdentificacaoResponsavel,
		Pessoa1.nome AS Nome,
        Pessoa1.dtNascimento AS Nascimento,
        Pessoa2.idPessoa2 AS IdentificacaoFilhoOuFilha,
        Pessoa2.nome AS Nome,
        Pessoa2.dtNascimento AS Nascimento,
        Pessoa2.fkPessoa1 AS IdentificacaoDeQuemCuidou
			FROM Pessoa1 JOIN Pessoa2 ON fkPessoa1 = idPessoa1;
            
SELECT *, CASE
		WHEN Pessoa1.dtNascimento < '1990-01-01' THEN 'Nasceu antes dos anos 90'
        WHEN Pessoa1.dtNascimento >= '1990-01-01' THEN 'Nasceu depois dos anos 90'
        ELSE 'Data de Nascimento não informada'
	END AS MetricaNascimento
FROM Pessoa1 JOIN Pessoa2 ON fkPessoa1 = idPessoa1;

SELECT *, IFNULL(Pessoa2.nome, 'Nome não registrado') AS NomeValido
	FROM Pessoa1 JOIN Pessoa2 ON fkPessoa1 = idPessoa1;


-- EXERCICIO 05
-- FEITO PELO TERMINAL

-- EXERCICIO 06
USE sprint2;

CREATE TABLE endereco (
	idEndereco int primary key auto_increment,
    nomeRua varchar(45),
    cidade varchar(45),
    siglaEstado char(2)
);

CREATE TABLE farmacia (
	idFarmacia int primary key auto_increment,
    nome varchar(45),
    telefone varchar(12)
);

CREATE TABLE farmaceutico (
	idFarmaceutico int primary key auto_increment,
    nome varchar(45),
    dtNascimento date
);

-- INSERÇÃO DE DADOS NAS TABELAS
INSERT INTO endereco (nomeRua, cidade, siglaEstado) VALUES
    ('Rua das Flores', 'São Paulo', 'SP'),
    ('Avenida Central', 'Rio de Janeiro', 'RJ'),
    ('Rua da Paz', 'Belo Horizonte', 'MG'),
    ('Praça das Águas', 'Curitiba', 'PR'),
    ('Alameda dos Pinheiros', 'Porto Alegre', 'RS');
    
INSERT INTO farmacia (nome, telefone) VALUES
    ('Farmácia São João', '11987654321'),
    ('Drogaria Saúde', '21965432178'),
    ('Farmácia Bem-Estar', '31987651234'),
    ('Drogaria Vida', '41976543210'),
    ('Farmácia Popular', '51965437890');

INSERT INTO farmaceutico (nome, dtNascimento) VALUES
    ('Carlos Lima', '1980-05-15'),
    ('Ana Souza', '1985-08-22'),
    ('Mariana Rocha', '1990-02-10'),
    ('Bruno Almeida', '1992-11-30'),
    ('Fernanda Alves', '1995-07-18');
    
ALTER TABLE farmacia ADD COLUMN fkEndereco int;
ALTER TABLE farmacia ADD CONSTRAINT foreign key(fkEndereco) references endereco(idEndereco);
ALTER TABLE farmaceutico ADD COLUMN fkFarmacia int;
ALTER TABLE farmaceutico ADD CONSTRAINT foreign key(fkFarmacia) references farmacia(idFarmacia);

UPDATE farmacia SET fkEndereco = 1 WHERE idFarmacia = 1;
UPDATE farmacia SET fkEndereco = 2 WHERE idFarmacia = 2;
UPDATE farmacia SET fkEndereco = 3 WHERE idFarmacia = 3;
UPDATE farmacia SET fkEndereco = 4 WHERE idFarmacia = 4;
UPDATE farmacia SET fkEndereco = 5 WHERE idFarmacia = 5;

UPDATE farmaceutico SET fkFarmacia = 1 WHERE idFarmaceutico = 1;
UPDATE farmaceutico SET fkFarmacia = 2 WHERE idFarmaceutico = 2;
UPDATE farmaceutico SET fkFarmacia = 3 WHERE idFarmaceutico = 3;
UPDATE farmaceutico SET fkFarmacia = 4 WHERE idFarmaceutico = 4;
UPDATE farmaceutico SET fkFarmacia = 5 WHERE idFarmaceutico = 5;

SELECT * FROM farmacia JOIN endereco ON farmacia.fkEndereco = endereco.idEndereco
			JOIN farmaceutico ON farmaceutico.fkFarmacia = farmacia.idFarmacia;
            
SELECT 
    farmacia.idFarmacia AS ID_Farmacia,
    farmacia.nome AS Nome_Farmacia,
    farmacia.telefone AS Telefone_Farmacia,
    endereco.nomeRua AS Rua,
    endereco.cidade AS Cidade,
    endereco.siglaEstado AS Estado,
    farmaceutico.idFarmaceutico AS ID_Farmaceutico,
    farmaceutico.nome AS Nome_Farmaceutico,
    farmaceutico.dtNascimento AS Data_Nascimento
FROM farmacia 
JOIN endereco ON farmacia.fkEndereco = endereco.idEndereco
JOIN farmaceutico ON farmaceutico.fkFarmacia = farmacia.idFarmacia;

SELECT 
    farmacia.idFarmacia,
    farmacia.nome,
    farmacia.telefone,
    endereco.nomeRua,
    endereco.cidade,
    endereco.siglaEstado,
    farmaceutico.idFarmaceutico,
    farmaceutico.nome,
    farmaceutico.dtNascimento,
    CASE 
        WHEN endereco.siglaEstado = 'SP' THEN 'Farmacia em SP'
        ELSE 'Farmacia fora de SP'
    END AS Localizacao_Farmacia
FROM farmacia 
JOIN endereco ON farmacia.fkEndereco = endereco.idEndereco
JOIN farmaceutico ON farmaceutico.fkFarmacia = farmacia.idFarmacia;

SELECT 
    farmacia.idFarmacia,
    farmacia.nome,
    IFNULL(farmacia.telefone, 'Telefone não informado') AS Telefone,
    endereco.nomeRua,
    endereco.cidade,
    endereco.siglaEstado,
    farmaceutico.idFarmaceutico,
    farmaceutico.nome,
    IFNULL(farmaceutico.dtNascimento, 'Data não informada') AS Data_Nascimento
FROM farmacia 
JOIN endereco ON farmacia.fkEndereco = endereco.idEndereco
JOIN farmaceutico ON farmaceutico.fkFarmacia = farmacia.idFarmacia;