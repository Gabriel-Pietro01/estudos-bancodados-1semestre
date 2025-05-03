CREATE DATABASE venda;
USE venda;

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    endereco VARCHAR(45),
    fkClienteIndicado INT,
    FOREIGN KEY (fkClienteIndicado) REFERENCES cliente(idCliente)
);

CREATE TABLE venda (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    totalVenda INT,
    dtVenda DATE,
    fkCliente INT,
    FOREIGN KEY (fkCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(45),
    preco DECIMAL(5,2)
);

CREATE TABLE produtoVendido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    idVendaDoProduto INT,
    idClienteComprador INT,
    idProdutoDaVenda INT,
    quantidade INT,
    FOREIGN KEY (idVendaDoProduto) REFERENCES venda(idVenda),
    FOREIGN KEY (idClienteComprador) REFERENCES cliente(idCliente),
    FOREIGN KEY (idProdutoDaVenda) REFERENCES produto(idProduto)
);

-- D)
INSERT INTO cliente (nome, email, endereco, fkClienteIndicado) VALUES
('Naruto Uzumaki', 'naruto@konoha.com', 'Rua da Vila 1', NULL),
('Sasuke Uchiha', 'sasuke@konoha.com', 'Rua do Clã 2', 1),
('Sakura Haruno', 'sakura@konoha.com', 'Rua Médica 3', 1),
('Kakashi Hatake', 'kakashi@konoha.com', 'Rua dos Senseis 4', NULL),
('Shikamaru Nara', 'shikamaru@konoha.com', 'Rua Estrategista 5', 4),
('Hinata Hyuga', 'hinata@konoha.com', 'Rua Byakugan 6', 1);

INSERT INTO produto (nome, descricao, preco) VALUES
('Kunai', 'Arma ninja básica', 15.00),
('Shuriken', 'Estrela ninja', 10.00),
('Pergaminho Explosivo', 'Explosão em papel', 25.00),
('Ramen', 'Comida favorita do Naruto', 30.00),
('Chakra Pill', 'Pílula para recuperar energia', 20.00);

INSERT INTO venda (totalVenda, dtVenda, fkCliente) VALUES
(60, '2025-04-01', 1), -- Naruto
(45, '2025-04-05', 1),

(30, '2025-04-02', 2), -- Sasuke
(55, '2025-04-07', 2),

(25, '2025-04-03', 3), -- Sakura
(40, '2025-04-08', 3),

(35, '2025-04-04', 4), -- Kakashi
(70, '2025-04-09', 4),

(20, '2025-04-06', 5), -- Shikamaru
(50, '2025-04-10', 5),

(65, '2025-04-11', 6), -- Hinata
(80, '2025-04-12', 6);

INSERT INTO produtoVendido (idVendaDoProduto, idClienteComprador, idProdutoDaVenda, quantidade) VALUES
(1, 1, 1, 2),  -- Naruto comprou 2 Kunais
(1, 1, 4, 1),  -- Naruto comprou 1 Ramen
(2, 1, 2, 3),  -- Naruto comprou 3 Shurikens

(3, 2, 1, 1),  -- Sasuke comprou 1 Kunai
(4, 2, 3, 2),  -- Sasuke comprou 2 Perg. Explosivos

(5, 3, 2, 2),  -- Sakura comprou 2 Shurikens
(6, 3, 5, 1),  -- Sakura comprou 1 Chakra Pill

(7, 4, 4, 1),  -- Kakashi comprou 1 Ramen
(8, 4, 1, 3),  -- Kakashi comprou 3 Kunais

(9, 5, 5, 1),  -- Shikamaru comprou 1 Chakra Pill
(10, 5, 2, 4), -- Shikamaru comprou 4 Shurikens

(11, 6, 1, 2), -- Hinata comprou 2 Kunais
(12, 6, 4, 2); -- Hinata comprou 2 Ramen

-- E)
SELECT * FROM cliente;
SELECT * FROM venda;
SELECT * FROM produto;
SELECT * FROM produtoVendido;

-- F) (FEITO NA CRIAÇÃO DA TABELA)

-- G)
SELECT
    c.idCliente,
    c.nome AS 'Nome do Cliente',
    c.email,
    c.endereco,
    v.idVenda,
    v.totalVenda,
    v.dtVenda
FROM cliente as c
JOIN venda as v ON c.idCliente = v.fkCliente
ORDER BY c.idCliente, v.dtVenda;

-- H)
SELECT
    c.idCliente,
    c.nome AS 'Nome do Cliente',
    c.email,
    c.endereco,
    v.idVenda,
    v.totalVenda,
    v.dtVenda
FROM cliente as c
JOIN venda as v ON c.idCliente = v.fkCliente
WHERE c.nome = 'Naruto Uzumaki'
ORDER BY v.dtVenda;

-- I)
SELECT
    indicante.idCliente AS idIndicante,
    indicante.nome AS nomeIndicante,
    indicado.idCliente AS idIndicado,
    indicado.nome AS nomeIndicado,
    indicado.email,
    indicado.endereco
FROM cliente as indicado
LEFT JOIN cliente as indicante ON indicado.fkClienteIndicado = indicante.idCliente
ORDER BY indicante.nome;

-- J)
SELECT
    indicante.idCliente AS idIndicante,
    indicante.nome AS nomeIndicante,
    indicado.idCliente AS idIndicado,
    indicado.nome AS nomeIndicado,
    indicado.email,
    indicado.endereco
FROM cliente as indicado
JOIN cliente as indicante ON indicado.fkClienteIndicado = indicante.idCliente
WHERE indicante.nome = 'Naruto Uzumaki'
ORDER BY indicado.nome;

-- L)
SELECT
    c.idCliente AS idCliente,
    c.nome AS 'Nome do Cliente',
    c.email,
    c.endereco,
    indicante.idCliente AS idIndicante,
    indicante.nome AS nomeIndicante,
    v.idVenda,
    v.dtVenda,
    v.totalVenda,
    p.idProduto,
    p.nome AS 'Produto',
    p.descricao,
    p.preco,
    pv.quantidade
FROM cliente as c
LEFT JOIN cliente as indicante ON c.fkClienteIndicado = indicante.idCliente
LEFT JOIN venda as v ON c.idCliente = v.fkCliente
LEFT JOIN produtoVendido as pv ON v.idVenda = pv.idVendaDoProduto
LEFT JOIN produto as p ON pv.idProdutoDaVenda = p.idProduto
ORDER BY c.nome, v.dtVenda;

-- M)
SELECT
    v.dtVenda,
    p.nome AS 'Produto',
    pv.quantidade
FROM produtoVendido as pv
JOIN venda as v ON pv.idVendaDoProduto = v.idVenda
JOIN produto as p ON pv.idProdutoDaVenda = p.idProduto
WHERE v.idVenda = 1;

-- N)
SELECT
    p.nome AS nomeProduto,
    p.preco AS valorProduto,
    SUM(pv.quantidade) AS totalQuantidadeVendida
FROM produto as p
JOIN produtoVendido as pv ON p.idProduto = pv.idProdutoDaVenda
GROUP BY p.nome, p.preco
ORDER BY totalQuantidadeVendida DESC;

-- O)
INSERT INTO cliente (nome, email, endereco, fkClienteIndicado)
VALUES ('Iruka Umino', 'iruka@konoha.com', 'Rua do Professor 7', 1);

SELECT c.idCliente, c.nome, c.email, c.endereco, v.idVenda, v.totalVenda, v.dtVenda
FROM cliente as c
LEFT JOIN venda as v ON c.idCliente = v.fkCliente
ORDER BY c.idCliente;

SELECT c.idCliente, c.nome, c.email, c.endereco
FROM cliente as c
LEFT JOIN venda as v ON c.idCliente = v.fkCliente
WHERE v.idVenda IS NULL;

-- P)
SELECT 
    MIN(preco) AS PrecoMinimo,
    MAX(preco) AS PrecoMaximo
FROM produto;

-- Q)
SELECT 
    SUM(preco) AS SomaPrecos,
    AVG(preco) AS MediaPrecos
FROM produto;

-- R)
SELECT COUNT(*) AS QuantidadeAcimaDaMedia
FROM produto
WHERE preco > (SELECT AVG(preco) FROM produto);

-- S)
SELECT SUM(DISTINCT preco) AS SomaPrecosDistintos -- USEI DISTINT POIS FOI O QUE ACHEI
FROM produto;									-- QUANDO ESTAVA PESQUISANDO SOBRE PRECO DISTINTO

-- T)
SELECT pv.idVendaDoProduto, SUM(p.preco * pv.quantidade) AS SomaPrecosPorVenda
FROM produtoVendido as pv
JOIN produto as p ON pv.idProdutoDaVenda = p.idProduto
GROUP BY pv.idVendaDoProduto;