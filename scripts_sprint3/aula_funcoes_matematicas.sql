CREATE DATABASE mtm;

USE mtm;

CREATE TABLE sensor (
	idSensor int primary key auto_increment,
    tipo varchar(45) default 'DHT11',
    statusSensor varchar(45),
    constraint chkStatus 
		check(statusSensor in ('Ativo', 'Inativo'))
);

INSERT INTO sensor (statusSensor) VALUES 
	('Ativo'),
    ('Ativo'),
    ('Inativo');
    
SELECT * FROM sensor;

CREATE TABLE registro (
	idRegistro int auto_increment,
    fkSensor int,
    constraint pkComposta primary key (idRegistro, fkSensor),
    temperatura double,
    dtRegistro datetime default current_timestamp,
    constraint fkRegistroSensor
		foreign key (fkSensor)
			references sensor(idSensor)
);

INSERT INTO registro VALUES 
	(default, 1, 15.1, default),
    (default, 1, 16.1, default),
    (default, 1, 17.4, default),
    (default, 2, 17.4, default),
    (default, 2, 11.5, default);
    
INSERT INTO registro VALUES 
	(default, 3, null, default);
    
SELECT * FROM registro;

-- DISTINCT MOSTRA AS TEMPERATURAS QUE SÃO DIFERENTES
SELECT DISTINCT temperatura FROM registro;

-- CONTADOR COUNT()
SELECT COUNT(temperatura) as Contador FROM registro;

SELECT COUNT(DISTINCT temperatura) as ContadorDiferente FROM registro;

SELECT COUNT(DISTINCT temperatura) as ContadorDiferente,
	   COUNT(DISTINCT tipo) as ContadorTipo
       FROM registro JOIN sensor
		ON idSensor = fkSensor;

-- MAIOR MAX()
SELECT MAX(temperatura) as Maior FROM registro;

-- MENOR MIN()
SELECT MIN(temperatura) as Menor FROM registro;

SELECT MAX(temperatura) as Maior, 
	   MIN(temperatura) as Menor,
       COUNT(temperatura) as Contador
       FROM registro;
       
-- SOMAR SUM()
SELECT SUM(temperatura) as Soma FROM registro;

-- MÉDIA AVG()
SELECT AVG(temperatura) as Média FROM registro;

INSERT INTO registro VALUES
	(default, 2, 22.9, default),
    (default, 2, 23.8, default);
    
-- ARREDONDAR ROUND()
SELECT ROUND(AVG(temperatura), 2) as MédiaArredondada FROM registro;
SELECT ROUND(AVG(temperatura), 3) as MédiaArredondada FROM registro;
SELECT ROUND(AVG(temperatura), 4) as MédiaArredondada FROM registro;

-- A cláusula HAVING, assim como a cláusula  WHERE, especifica condições de seleção. 
-- A cláusula WHERE especifica condições em colunas na lista de seleção, mas não pode se referir a funções de 
-- agregação. A cláusula HAVING especifica condições em grupos, normalmente formados pela cláusula GROUP BY.

-- SINTAXE:

-- SELECT column1, SUM(column2) FROM table GROUP BY column1
-- HAVING AVG(column2) > valor;