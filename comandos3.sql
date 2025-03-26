-- AULA 3
-- check 
-- NOT NULL
-- UNIQUE
-- DEFAULT
-- IFNULL
-- CASE
-- CONCAT

USE adsa;

show tables;

CREATE TABLE sensor (
	idSensor int primary key auto_increment,
    tipo varchar(20) not null,
    dtInstalacao datetime default current_timestamp,
    statusSensor varchar(25),
    constraint chkStatus
		check(statusSensor in ('Ativo', 'Inativo'))
);

-- O PRÓXIMO COMANDO DARÁ ERRO
INSERT INTO sensor (tipo, statusSensor) VALUES
	('DHT11', 'Pendente');
-- Error Code: Check constraint 'chkStatus' is violated.

INSERT INTO sensor (tipo, statusSensor) VALUES
	('DHT11', 'Ativo'),
    ('LM35', 'Ativo');
    
SELECT * FROM sensor;

-- EXCLUIR A CONSTRAINT
ALTER TABLE sensor DROP CONSTRAINT chkStatus;

INSERT INTO sensor (tipo, statusSensor) VALUES 
	('DHT11', 'Pendente');
    
SELECT * FROM sensor;

-- UNIQUE 
ALTER TABLE sensor ADD COLUMN numSerie char(3) unique;

UPDATE sensor SET numSerie = '001' WHERE idSensor = 1;

SELECT * FROM sensor;

-- APELIDO - ALIAS - AS 
SELECT dtInstalacao FROM sensor;
SELECT dtInstalacao AS 'Data da Instalação do Sensor' FROM sensor;
SELECT tipo AS 'Tipo do Sensor', numSerie as 'Número de Série' FROM sensor;

-- IFNULL
SELECT tipo, ifnull(numSerie, 'Sem número de série') AS Número FROM sensor;

-- CONCAT
SELECT concat(tipo,' foi instalado em', date_format(dtInstalacao, ' %d/%m/%y')) AS frase FROM sensor;

-- CASE
SELECT tipo, CASE 
			 WHEN tipo = 'DHT11' THEN 'Temperatura e umidade'
             ELSE 'Temperatura'
             END AS 'Tipo de medidade' 
             FROM sensor;