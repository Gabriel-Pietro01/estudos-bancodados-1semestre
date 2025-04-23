CREATE DATABASE erros;
USE erros;

-- EXERCICIO 01 --
CREATE TABLE usuarios (
    id INT PRIMARY KEY, -- ERRO NA SINTAXE (PRIMARI KEY X)
    nome VARCHAR(100),
    email VARCHAR(100), -- ERRO NA SINTAXE (VCHAR X)
    data_nascimento DATE
); 

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    id_usuario INT,
    data_pedido DATETIME,
    valor DECIMAL(10,2),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id) -- ERRO NA REFERÊNCIA DA FOREIGN KEY PARA OUTRA TABELA
);

-- Inserção de dados
INSERT INTO usuarios (id, nome, email, data_nascimento)
VALUES (1, 'João Silva', 'joao@email.com', '1988-05-12'),
       (2, 'Maria Souza', 'maria@email', '1992-08-23');

INSERT INTO pedidos (id, id_usuario, data_pedido, valor)
VALUES (1, 1, '2023-03-10 14:30', 259.90),
       (2, 2, '2023-04-02 10:45', '399.50');

-- Atualização de dados
UPDATE usuarios
SET email = 'joao.silva@email.com'
WHERE id = 1; -- ERRO, POIS UPDATE SÓ PODE SER COM PRIMARY KEY

-- Remoção de pedidos com valor menor que 300
DELETE FROM pedidos
WHERE id = 1 AND id_usuario = 1; -- ERRO, POIS DELETE É COM FROM

-- Consulta com JOIN
SELECT u.nome, p.data_pedido, p.valor
FROM usuarios AS u
JOIN pedidos AS p ON u.id = p.id_usuario; -- ERRO AO REFERENCIAR OUTRA TABELA NO ON

-- Consulta com LEFT JOIN
SELECT u.nome, p.data_pedido
FROM usuarios AS u
LEFT JOIN pedidos AS p ON u.id = p.id_usuario; -- ERRO NA SINTAXE POIS O ON P.USUARIO_ID ESTAVA INVERTIDO

-- Consulta com RIGHT JOIN
SELECT u.nome, p.data_pedido
FROM usuarios AS u
RIGHT JOIN pedidos AS p ON u.id = p.id_usuario; -- ERRO NA SINTAXE POIS O ON ESTAVA INVERTIDO

-- Alteração da tabela
ALTER TABLE usuarios
MODIFY email VARCHAR(150),
ADD COLUMN telefone VARCHAR(20); -- ERRO POIS FALTOU A VIRGULA



-- EXERCICIO 02 --
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100), -- ERRO NA SINTAXE (VARCH X)
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE vendas (
    id INT PRIMARY KEY,
    id_cliente INT,
    data_venda DATE,
    valor_total DECIMAL(10,2), -- ERRO NA SINTAXE (DECIML X)
    FOREIGN KEY (id_cliente) REFERENCES clientes(id) -- ERRO NA REFERÊNCIA DA FOREIGN KEY E ADICIONAR PARENTESES
);

-- Inserção de dados
INSERT INTO clientes (id, nome, telefone, email)
VALUES (1, 'Carlos Lima', '1199999999', 'carlos@email.com'),
       (2, 'Fernanda Dias', NULL, 'fernanda@email.com');

INSERT INTO vendas (id, id_cliente, data_venda, valor_total)
VALUES (1, 1, '2023-02-15', 150.00),
       (2, 2, '2023-03-01', NULL);

-- Consulta com WHERE e ORDER BY
SELECT nome, valor_total
FROM vendas AS v JOIN clientes AS c ON v.id_cliente = c.id
WHERE valor_total >= 100
ORDER BY valor_total DESC; -- ERRO NA SINTAXE (ORDER SEM O BY)

-- Uso de IFNULL
SELECT nome, IFNULL(telefone, 'Sem telefone') AS 'Possui Telefone'
FROM clientes;

-- Uso de CONCAT
SELECT CONCAT(nome, ' - ', email) AS contato -- ERRO NA SINTAXE (CONCAT NÃO É COM + E SIM COM VIRGULA)
FROM clientes;

-- Uso de CASE
SELECT nome, valor_total,
    CASE 
        WHEN valor_total > 200 THEN 'Alto' -- ERRO NA SINTAXE (SEM WHEN)
        WHEN valor_total BETWEEN 100 AND 200 THEN 'Médio'-- ERRO NA SINTAXE (SEM WHEN)
        ELSE 'Baixo'
    END AS categoria
FROM vendas AS v
JOIN clientes AS c ON c.id = v.id_cliente;



-- EXERCICIO 03 --
CREATE TABLE livros (
    id INT PRIMARY KEY, -- ERRO NA SINTAXE (PRIMARY X)
    titulo VARCHAR(150),
    autor VARCHAR(100),
    ano_publicacao INT,
    disponivel BOOL
);

CREATE TABLE emprestimos (
    id INT PRIMARY KEY,
    livro_id INT,
    nome_leitor VARCHAR(100),
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Inserção de dados
INSERT INTO livros (id, titulo, autor, ano_publicacao, disponivel)
VALUES (1, '1984', 'George Orwell', 1949, true),
       (2, 'Dom Casmurro', 'Machado de Assis', 1899, false);

INSERT INTO emprestimos (id, livro_id, nome_leitor, data_emprestimo, data_devolucao)
VALUES (1, 2, 'Ana Paula', '2023-01-10', NULL),
       (2, 1, 'Carlos Alberto', '2023-02-05', '2023-02-20');

-- Consulta com WHERE e ORDER BY
SELECT titulo, ano_publicacao
FROM livros
WHERE disponivel = 'true'
ORDER BY ano_publicacao DESC; -- ERRO NA SINTAXE (ORDER SEM O BY)

-- Uso de IFNULL
SELECT nome_leitor, IFNULL(data_devolucao, 'Não devolvido') AS 'Devolução'
FROM emprestimos;

-- Uso de CONCAT
SELECT CONCAT(nome_leitor, ' - ', titulo) AS leitura -- ERRO NA SINTAXE (CONCAT NÃO É COM + E SIM COM VIRGULA)
FROM emprestimos AS e
JOIN livros AS l ON e.livro_id = l.id;

-- Uso de CASE
SELECT titulo, disponivel,
    CASE 
        WHEN disponivel = true THEN 'Disponível' -- ERRO NA SINTAXE (SEM WHEN)
        WHEN disponivel = false THEN 'Emprestado' -- ERRO NA SINTAXE (SEM WHEN)
        ELSE 'Desconhecido'
    END AS status
FROM livros;



-- EXERCICIO 04 --
CREATE TABLE alunos (
    id INT PRIMARY KEY, -- ERRO NA SINTAXE (PRIMERY KEY X)
    nome VARCHAR(100),
    data_nascimento DATE,
    peso FLOAT,
    altura FLOAT,
    telefone VARCHAR(15)
);

CREATE TABLE treinos (
    id INT PRIMARY KEY,
    aluno_id INT,
    tipo VARCHAR(50),
    duracao INT, -- em minutos
    data DATE,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) -- ERRO NA SINTAXE (FALTOU OS PARENTESES NO ALUNO_ID)
);

-- Inserção de dados
INSERT INTO alunos (id, nome, data_nascimento, peso, altura, telefone)
VALUES (1, 'Lucas Nogueira', '1995-09-12', 78.5, 1.75, '11988776655'),
       (2, 'Patrícia Alves', '1988-03-22', 65.3, NULL, '11999887766');

INSERT INTO treinos (id, aluno_id, tipo, duracao, data)
VALUES (1, 1, 'Cardio', '45', '2023-05-10'), -- ERRO NA FORMATAÇÃO DA DURAÇÃO (ESPERA SE RECEBER EM STRING, NÃO INT)
       (2, 2, 'Musculação', '60', '2023-05-12'); -- valor numérico como string

-- Consulta com WHERE e ORDER BY
SELECT nome, peso, altura
FROM alunos
WHERE peso > 70 AND altura IS NOT NULL
ORDER BY altura DESC; -- ERRO NA SINTAXE (ORDER SEM O BY)

-- IFNULL para altura
SELECT nome, IFNULL(altura, 0) AS altura
FROM alunos;

-- CONCAT para mensagem personalizada
SELECT CONCAT('Aluno: ', nome, ' - Telefone: ', telefone) AS 'Informações Completas dos Alunos'
FROM alunos;

-- CASE para avaliação do treino
SELECT tipo, duracao,
    CASE
        WHEN duracao < 30 THEN 'Curto' -- ERRO NA SINTAXE (CASE SEM WHEN)
        WHEN duracao BETWEEN 30 AND 60 THEN 'Moderado' -- ERRO NA SINTAXE (CASE SEM WHEN)
        ELSE 'Longo'
    END AS intensidade
FROM treinos;



-- EXERCICIO 05 --
CREATE TABLE jogadores (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    nickname VARCHAR(50),
    pais_origem VARCHAR(50)
);

CREATE TABLE torneios (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    premiacao DECIMAL(8,2),
    data_torneio DATE
);

CREATE TABLE inscricoes (
    jogador_id INT,
    torneio_id INT,
    data_inscricao DATE,
    status VARCHAR(20),
    CONSTRAINT pksTabela PRIMARY KEY (jogador_id, torneio_id),
    FOREIGN KEY (jogador_id) REFERENCES jogadores(id), -- ERRO NA SINTAXE (REFERENCE X)
    FOREIGN KEY (torneio_id) REFERENCES torneios(id)
);

-- Inserção de dados
INSERT INTO jogadores (id, nome, nickname, pais_origem)
VALUES (1, 'Lucas Pereira', 'Lukao', 'Brasil'),
       (2, 'Emily Chan', 'ShadowQueen', 'China');

INSERT INTO torneios (id, nome, premiacao, data_torneio)
VALUES (1, 'Summer Cup', 5000, '2023-07-10'),
       (2, 'Winter Clash', 7500.00, '2023-12-15');

INSERT INTO inscricoes (jogador_id, torneio_id, data_inscricao, status)
VALUES (1, 1, '2023-06-01', 'confirmado'),
       (2, 2, '2023-11-20', NULL);

-- Atualização
UPDATE inscricoes
SET status = 'confirmado' -- ERRO NA SINTAXE (CONFIRMADO TEM QUE SER STRING COLOCANDO '')
WHERE jogador_id = 2 AND torneio_id = 2;

-- Exclusão
DELETE FROM inscricoes -- ERRO NA SINTAXE (FALTOU FROM EM DELETE)
WHERE status IS NULL;

-- Consulta com JOIN
SELECT j.nome, t.nome, i.status
FROM jogadores AS j
JOIN inscricoes AS i ON i.jogador_id = j.id
JOIN torneios AS t ON t.id = i.torneio_id;

-- LEFT JOIN
SELECT j.nome, t.nome
FROM jogadores AS j
LEFT JOIN inscricoes AS i ON j.id = i.jogador_id
LEFT JOIN torneios AS t ON i.torneio_id = t.id;

-- RIGHT JOIN
SELECT j.nome, t.nome
FROM jogadores AS j
RIGHT JOIN inscricoes AS i ON j.id = i.jogador_id
RIGHT JOIN torneios AS t ON i.torneio_id = t.id;

-- WHERE e ORDER BY
SELECT nickname, pais_origem
FROM jogadores
WHERE pais_origem = 'Brasil'
ORDER BY pais_origem; -- ERRO NA SINTAXE (ORDER SEM O BY)

-- IFNULL e CONCAT
SELECT CONCAT(nome, ' (', nickname, ')') AS Jogador,
       IFNULL(pais_origem, 'Não informado') AS Pais
FROM jogadores;

-- CASE
SELECT j.nome, i.status,
    CASE
        WHEN i.status = 'confirmado' THEN 'Participante' -- ERRO NA SINTAXE (SEM WHEN)
        WHEN i.status IS NULL THEN 'Aguardando' -- ERRO NA SINTAXE (SEM WHEN)
        ELSE 'Outro'
    END AS situacao
FROM jogadores AS j
JOIN inscricoes i ON j.id = i.jogador_id;

-- ALTER TABLE
ALTER TABLE jogadores
ADD nacionalidade VARCHAR(50),
MODIFY nickname VARCHAR(100);