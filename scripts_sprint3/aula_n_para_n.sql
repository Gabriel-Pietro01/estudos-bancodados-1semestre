CREATE DATABASE sp3;
USE sp3;

CREATE TABLE aluno (
	idAluno int primary key auto_increment,
    nome varchar(45) not null,
    email varchar(45) not null
) auto_increment = 1000;

INSERT INTO aluno VALUES 
	(default, 'Sheldon', 'sheldon@email.com'),
    (default, 'Leonard', 'leonard@email.com'),
    (default, 'Penny', 'penny@email.com');
    
SELECT * FROM aluno;

CREATE TABLE curso (
	idCurso int primary key auto_increment,
    nome varchar(45) not null,
    cargaHorario int
);

INSERT INTO curso VALUES 
	(default, 'Inglês', 100),
    (default, 'Espanhol', 80),
    (default, 'Mandarim', 120);
    
SELECT * FROM curso;

-- CRIAR A TABELA ASSOCIATIVA
-- FRACA - PK (IDMATRICULA + FKALUNO + FKCURSO)
CREATE TABLE matricula (
	idMatricula int auto_increment,
    fkAluno int,
    fkCurso int,
    constraint pkComposta 
		primary key (idMatricula, fkAluno, fkCurso),
	dtMatricula date,
    nota decimal(4,2),
    constraint fkAlunoMat foreign key (fkAluno)
		references aluno(idAluno),
	foreign key (fkCurso)
		references curso(idCurso)
);

ALTER TABLE matricula auto_increment = 5000;

INSERT INTO matricula VALUES
	(default, 1000, 1, '2024-01-01', 4.5),
	(default, 1000, 1, '2025-01-01', null), 
	(default, 1001, 1, '2024-01-01', 9.3),
	(default, 1002, 2, '2024-01-01', 7.1);
    
SELECT * FROM matricula;

SELECT aluno.nome as Aluno,
		curso.nome as Curso,
        ifnull(nota, 'Sem Nota') as Nota
        FROM aluno JOIN matricula
			ON idAluno = fkAluno
		JOIN curso 
			ON idCurso = fkCurso;
            
SELECT aluno.nome as Aluno,
		curso.nome as Curso,
        nota
        FROM aluno JOIN matricula
			ON idAluno = fkAluno
		RIGHT JOIN curso 
			ON idCurso = fkCurso;
            
SELECT ifnull(aluno.nome, 'Sem alunos matriculado') as Aluno,
		curso.nome as Curso,
        ifnull(nota, 'Sem nota') as Nota
        FROM aluno JOIN matricula
			ON idAluno = fkAluno
		RIGHT JOIN curso 
			ON idCurso = fkCurso
		WHERE fkAluno is null;
        
-- FUNÇÕES MATEMÁTICAS
-- SOMA (SUM)
SELECT SUM(nota) FROM matricula;

-- MÉDIA (AVERAGE)
SELECT AVG(nota) FROM matricula;
SELECT AVG(nota) as Média FROM matricula;

-- CONTADOR (count)
SELECT count(nota) as Quantidade FROM matricula;
SELECT nota as Quantidade FROM matricula;

-- MAIOR (MAX)
-- MENOR (MIN)
SELECT max(nota) as MaiorNota,
		min(nota) as MenorNota 
        FROM matricula;
        
-- AGRUPAR (GROUP BY)
SELECT curso.nome as Curso,
	avg(nota) as Média
    FROM curso JOIN matricula
		ON idCurso = fkCurso
	GROUP BY curso.nome;
    
