CREATE DATABASE praticaView;
USE praticaView;

CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) ,
    email VARCHAR(100) 
);

CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100),
    descricao VARCHAR(300)
);

CREATE TABLE Aluno_Curso (
    id_aluno INT,
    id_curso INT,
    data_inscricao DATE ,
    PRIMARY KEY (id_aluno, id_curso),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso) 
);

CREATE TABLE Acesso (
    id_aluno INT,
    id_curso INT,
    data_acesso DATETIME,
    duracao_minutos INT,
    PRIMARY KEY (id_aluno, id_curso, data_acesso),
    FOREIGN KEY (id_aluno, id_curso) REFERENCES Aluno_Curso(id_aluno, id_curso)
);

INSERT INTO Aluno (nome, email) VALUES 
('Marquinhos', 'marcos@email.com'),
('Edinho', 'edinho@email.com'),
('Vivian', 'vivian@email.com'),
('Matheus Machine', 'math.chine@email.com'),
('Davi', 'davi@email.com');

INSERT INTO Curso (nome_curso, descricao) VALUES 
('Análise e Desenvolvimento de Sistemas', 'Se torne um grande desenvolvedor de sistemas.'),
('Ciência da Computação', 'Vire agora um cientista da computação.'),
('Desenvolvimento Web', 'Aprenda já a fazer sites com HTML, CSS e Javascript.'),
('Inteligência Artificial', 'O Futuro são as IAs, cabe a você querer aprender a como elas funcionam!'),
('Sistemas Embarcados', 'Amante de tecnologia e matemática? Aqui é seu lugar!');

INSERT INTO Aluno_Curso VALUES
(1, 1, '2025-05-15'),
(2, 2, '2025-05-16'),
(3, 5, '2025-05-17'),
(4, 3, '2025-05-18'),
(5, 4, '2025-05-19');

INSERT INTO Acesso (id_aluno, id_curso, data_acesso, duracao_minutos) VALUES
(1, 1, '2025-05-19 11:30:00', 35),
(2, 2, '2025-05-18 17:00:00', 50),
(3, 5, '2025-05-20 10:25:00', 60),
(4, 3, '2025-05-20 12:45:00', 40),
(5, 4, '2025-05-17 18:40:00', 120);

select a.nome as Aluno, 
c.nome_curso as Curso from Aluno as a join Aluno_curso as ac on a.id_aluno = ac.id_aluno 
join Curso as c on ac.id_curso = c.id_curso;

select a.nome as Aluno, 
c.nome_curso as Curso from Aluno as a join Aluno_curso as ac on a.id_aluno = ac.id_aluno 
join Curso as c on ac.id_curso = c.id_curso 
where a.nome = 'Matheus Machine';

SELECT c.nome_curso, COUNT(ac.id_aluno) AS total_alunos
FROM Aluno_Curso as ac JOIN Curso c ON c.id_curso = ac.id_curso
GROUP BY ac.id_curso
HAVING COUNT(ac.id_aluno) > 1;

select a.nome as Aluno, c.nome_curso as Curso, avg(ac.duracao_minutos) as 'Média de acessos.'
from Aluno as a join Acesso as ac on a.id_aluno = ac.id_aluno
join curso as c on ac.id_curso = c.id_curso
group by a.nome, c.nome_curso;

select a.nome as Aluno, c.nome_curso as Curso, sum(ac.duracao_minutos) as 'Total de minutos acessados por cada estudante de cada curso.'
from Aluno as a join Acesso as ac on a.id_aluno = ac.id_aluno
join curso as c on ac.id_curso = c.id_curso
group by a.nome, c.nome_curso;

create view vw_total_acessos as select 
a.id_aluno as IDAluno, a.nome as Aluno,
c.id_curso as IDCurso, c.nome_curso as Curso, 
sum(ac.duracao_minutos) as 'Total de minutos acessados' from
Aluno as a join Acesso as ac on a.id_aluno = ac.id_aluno
join curso as c on ac.id_curso = c.id_curso
group by a.id_aluno, a.nome, c.id_curso, c.nome_curso;

select * from vw_total_acessos;

 create view vw_estatisticas_curso as select
 c.id_curso, c.nome_curso, count(ac.id_aluno) as 'Quantidade de alunos inscritos', avg(ac.duracao_minutos) as 'Tempo médio de acesso por curso'
 from Curso as c join Acesso as ac on c.id_curso = ac.id_curso
 group by c.id_curso, c.nome_curso;
 
 select * from vw_estatisticas_curso;
 
select IdAluno, Aluno,sum(`Total de minutos acessados`) as `Tempo Total`
from vw_total_acessos
group by IDAluno, Aluno
order by `Tempo Total` desc limit 3;

select c.id_curso, c.nome_curso
from Curso c
left join vw_total_acessos vta on c.id_curso = vta.IDCurso
where vta.IDCurso is null;

create view vw_acessos_por_dia as
select date(data_acesso) as dia, COUNT(*) as quantidade_acessos
from Acesso
group by dia;

SELECT * FROM vw_acessos_por_dia;