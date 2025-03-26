USE adsa2;

CREATE TABLE pet (
	idPet int primary key auto_increment,
    nome varchar(45),
    raca varchar(45),
    fkMae int,
    constraint fkFilhoMae foreign key (fkMae) 
					references pet(idPet)
);

-- ADICIONANDO CAMPO FKPAI
ALTER TABLE pet ADD COLUMN fkPai int, 
		ADD constraint fkFilhoPai
			foreign key (fkPai) 
				references pet(idPet);
                
-- INSERINDO O PAI E A MÃE DO PET
INSERT INTO pet (nome, raca) VALUES 
	('Julius', 'vira-lata'),
	('Rochele', 'vira-lata');
    
-- INSERINDO O FILHO
INSERT INTO pet (nome, fkMae, fkPai) VALUES
	('Chris', 2, 1);
    
SELECT * FROM pet;

-- EXIBIR O PET FILHO E SEUS PAIS
SELECT f.nome as NomeFilho,
		m.nome as NomeMãe,
        p.nome as NomePai
        FROM pet as f JOIN pet as m
        ON f.fkMae = m.idPet
        JOIN pet as p 
        ON f.fkPai = p.idPet;
        
SELECT filho.nome as Filho,
		IFNULL(filho.raca, pai.raca) as 'Raça Filho',
        pai.nome as Pai,
        pai.raca as 'Raça Pai'
        FROM pet as filho JOIN pet as pai
			ON filho.fkPai = pai.idPet;
            
INSERT INTO pet (nome) VALUES 
	('Mãe da Rochele'),
	('Pai de Rochele');
    
SELECT * FROM pet;

UPDATE pet SET fkMae = 4, fkPai = 5 
				WHERE idPet = 2;
    
SELECT filho.nome as Filho,
		mae.nome as Mãe,
        avó.nome as Avó,
        avô.nome as Avô
        FROM pet as filho 
        JOIN pet as Mae
			ON filho.fkMae = mae.idPet
        JOIN pet as avó
			ON mae.fkMae = avó.idPet
        JOIN pet as avô
			ON mae.fkPai = avô.idPet;