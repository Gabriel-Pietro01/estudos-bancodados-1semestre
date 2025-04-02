USE adsa2;

CREATE TABLE funcionario (
	idFunc int primary key auto_increment,
    nome varchar(45),
    salario decimal(5,2),
    fkSupervisor int not null,
    constraint fkFuncSuper foreign key (fkSupervisor) 
		references funcionario(idFunc)
);

INSERT INTO funcionario (nome, salario, fkSupervisor) VALUES 
	('EdShow', 247.89, 1);
    
SELECT * FROM funcionario;

INSERT INTO funcionario (nome, salario, fkSupervisor) VALUES 
	('AdShow', 999.99, 1),
    ('OdShow', 999.98, 1);
    
SELECT func.nome as Funcionario,
	   superv.nome as Supervisor
       FROM funcionario as func JOIN funcionario as superv
			ON func.fkSupervisor = superv.idFunc;
            
-- CRIAR A TABELA FRACA - DEPENDENTE - FK E ID SÃO PK
CREATE TABLE dependente (
	idDep int,
    fkFunc int,
		constraint pkComposta primary key (idDep, fkFunc),
    nome varchar(45),
    parentesco varchar(45),
		constraint fkDepFUnc foreign key (fkFunc) 
			references funcionario(idFunc)
);

INSERT INTO dependente VALUES 
	(1, 1, 'EdMãe', 'mãe'),
    (2, 1, 'EdMor', 'namorada'),
    (1, 2, 'AdPai', 'pai');
    
SELECT dependente.nome as Dependente,
	funcionario.nome as Funcionario
    FROM dependente JOIN funcionario
		ON idFunc = fkFunc;
        
SELECT dependente.nome as Dependente,
	funcionario.nome as Funcionario
    FROM dependente RIGHT JOIN funcionario
		ON idFunc = fkFunc;
        
SELECT IFNULL(dependente.nome, 'Sem dependente') as Dependente,
	funcionario.nome as Funcionario
    FROM dependente RIGHT JOIN funcionario
		ON idFunc = fkFunc;
        
SELECT dependente.nome as Dependente,
	funcionario.nome as Funcionario
    FROM dependente right JOIN funcionario
		ON idFunc = fkFunc
	WHERE fkFunc is null;