USE sprint3;

-- 1)
CREATE TABLE grupo (
	idGrupo int primary key auto_increment,
    nomeGrupo varchar(45),
    descGrupo varchar(65)
);

CREATE TABLE aluno (
	ra int primary key,
    nomeAluno varchar(45),
    email varchar(45),
    fkIdGrupo int,
    constraint fkGrupo 
		foreign key (fkIdGrupo)
			references grupo(idGrupo)
);

CREATE TABLE professor (
	idProfessor int primary key auto_increment,
    nomeProfessor varchar(45),
    disciplina varchar(45)
) auto_increment = 1000;

CREATE TABLE apresentacao (
	fkIdDoGrupo int,
    fkIdDoProfessor int,
    constraint pkComposta primary key (fkIdDoGrupo, fkIdDoProfessor),
    constraint foreign key (fkIdDoGrupo) references grupo(idGrupo),
	constraint foreign key (fkIdDoProfessor) references professor(idProfessor),
    dtHrApresentacao datetime,
	nota decimal(5, 1)
);

-- 2)
INSERT INTO grupo (nomeGrupo, descGrupo) VALUES
('Controle de Temperatura', 'Sistema para monitorar e ajustar a temperatura ambiente'),
('Detector de Gases', 'Projeto de sensor para gases tóxicos em ambientes fechados');

INSERT INTO aluno (ra, nomeAluno, email, fkIdGrupo) VALUES
(101, 'Lucas Silva', 'lucas.silva@email.com', 1),
(102, 'Ana Souza', 'ana.souza@email.com', 1),
(103, 'Pedro Oliveira', 'pedro.oliveira@email.com', 2),
(104, 'Mariana Lima', 'mariana.lima@email.com', 2);

INSERT INTO professor (nomeProfessor, disciplina) VALUES
('Sebastião Almeida', 'Algoritmos'),
('Maria Aparecida', 'Banco de Dados');

INSERT INTO apresentacao (fkIdDoGrupo, fkIdDoProfessor, dtHrApresentacao, nota) VALUES
(1, 1000, '2025-06-10 14:00:00', 8.5),
(1, 1001, '2025-06-10 14:00:00', 8.5),
(2, 1000, '2025-06-10 15:00:00', 9.0),
(2, 1001, '2025-06-10 15:00:00', 9.0);

-- 3)
SELECT * FROM grupo;
SELECT * FROM aluno;
SELECT * FROM professor;
SELECT * FROM apresentacao;

-- 4) (FEITO NA CRIAÇÃO DAS TABELAS)

-- 5)
SELECT 
    g.idGrupo,
    g.nomeGrupo,
    g.descGrupo,
    a.ra,
    a.nomeAluno,
    a.email
FROM grupo as g
JOIN aluno as a ON g.idGrupo = a.fkIdGrupo;

-- 6)
SELECT 
    g.idGrupo,
    g.nomeGrupo,
    g.descGrupo,
    a.ra,
    a.nomeAluno,
    a.email
FROM grupo as g
JOIN aluno as a ON g.idGrupo = a.fkIdGrupo
WHERE g.nomeGrupo = 'Detector de Gases';

-- 7)
SELECT AVG(nota) FROM apresentacao;

-- 8)
SELECT MIN(nota), MAX(nota) FROM apresentacao;

-- 9)
SELECT SUM(nota) AS somaNotas FROM apresentacao;

-- 10)
SELECT 
    p.idProfessor,
    p.nomeProfessor,
    g.idGrupo,
    g.nomeGrupo,
    a.dtHrApresentacao
FROM apresentacao as a
JOIN professor as p ON a.fkIdDoProfessor = p.idProfessor
JOIN grupo as g ON a.fkIdDoGrupo = g.idGrupo;

-- 11)
SELECT 
    p.idProfessor,
    p.nomeProfessor,
    g.idGrupo,
    g.nomeGrupo,
    a.dtHrApresentacao
FROM apresentacao as a
JOIN professor as p ON a.fkIdDoProfessor = p.idProfessor
JOIN grupo as g ON a.fkIdDoGrupo = g.idGrupo
WHERE g.nomeGrupo = 'Controle de Temperatura';

-- 12)
SELECT 
    g.nomeGrupo
FROM apresentacao as a
JOIN grupo as g ON a.fkIdDoGrupo = g.idGrupo
WHERE a.fkIdDoProfessor = 1001;

-- 13)
SELECT 
    g.idGrupo,
    g.nomeGrupo,
    a1.ra,
    a1.nomeAluno,
    p.idProfessor,
    p.nomeProfessor,
    ap.dtHrApresentacao
FROM grupo as g
JOIN aluno as a1 ON g.idGrupo = a1.fkIdGrupo
JOIN apresentacao as ap ON g.idGrupo = ap.fkIdDoGrupo
JOIN professor as p ON ap.fkIdDoProfessor = p.idProfessor;

-- 14)
SELECT COUNT(DISTINCT nota) FROM apresentacao;

-- 15)
SELECT 
    p.idProfessor,
    p.nomeProfessor,
    AVG(a.nota) AS mediaNotas,
    SUM(a.nota) AS somaNotas
FROM apresentacao as a
JOIN professor as p ON a.fkIdDoProfessor = p.idProfessor
GROUP BY p.idProfessor, p.nomeProfessor;

-- 16)
SELECT 
    g.idGrupo,
    g.nomeGrupo,
    AVG(a.nota) AS mediaNotas,
    SUM(a.nota) AS somaNotas
FROM apresentacao as a
JOIN grupo as g ON a.fkIdDoGrupo = g.idGrupo
GROUP BY g.idGrupo, g.nomeGrupo;

-- 17)
SELECT 
    p.idProfessor,
    p.nomeProfessor,
    MIN(a.nota) AS notaMenor,
    MAX(a.nota) AS notaMaior
FROM apresentacao as a
JOIN professor as p ON a.fkIdDoProfessor = p.idProfessor
GROUP BY p.idProfessor, p.nomeProfessor;

-- 18)
SELECT 
    g.idGrupo,
    g.nomeGrupo,
    MIN(a.nota) AS notaMenor,
    MAX(a.nota) AS notaMaior
FROM apresentacao as a
JOIN grupo as g ON a.fkIdDoGrupo = g.idGrupo
GROUP BY g.idGrupo, g.nomeGrupo;






		

