/* Banco de dados Melan.cia  */


 -- Criando O banco de dados
 
 	CREATE DATABASE Sprint2;
 
-- Usando o banco de dados

	USE Sprint2;

-- Criando as tabelas (Localização)

	CREATE TABLE localização (
	IdLocal INT PRIMARY KEY AUTO_INCREMENT,
	localização VARCHAR (45),
	fileira VARCHAR (45)
	);


-- Inserindo valores nas tabela localização

	INSERT INTO localização VALUES
	(null , 'Setor B' , 'Fileira A'),
	(null , 'Setor B3' , 'Fileira L'),
	(null , 'Setor W' , 'Fileira D'),
	(null , 'Setor R' , 'Fileira F'),
	(null , 'Setor B' , 'Fileira B'),
	(null , 'Setor P' , 'Fileira R'),
	(null , 'Setor H3' , 'Fileira C');

	INSERT INTO localização VALUES
	(null , 'Setor T2' , 'Fileira G7');

-- Criando as tabelas (Empresa)
	CREATE TABLE Empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	CNPJ CHAR (14),
	nomeEmp VARCHAR(45),
	Endereço VARCHAR (90),
	Empresacol VARCHAR (45)
	);


-- Inserindo valores nas tabela
INSERT INTO empresa VALUES
(null, '15170001658402', 'Lyvs', 'Rua cinco' , 'Jéssica Dias'),
(null, '36540001850741', 'Neoxx', 'Avenida Francisco matarazzo' , 'Dino Sousa'),
(null, '98020001321582', 'Garage pull', 'Rua Augusto Tolle' , 'Kaio Silva'),
(null, '61770001164648', 'Safra', 'Av. 23 de maio' , 'Clara Gimenez'),
(null, '99540001459942', 'B09', 'Rua Said Aiach' , 'Frederico Souza'),
(null, '35150001189960', 'Frerreira´s RB', 'Av Sabiá' , 'Guaira Faria'),
(null, '36710001875025', 'Goold', 'Rua Raul Noce' , 'Heitor Francis'),
(null, '14740001985057', 'B3', 'Rua João Milliam' , 'Clóvis Arruda');


-- Criando as tabelas (sensor)

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeSensor VARCHAR (45),
dilatação VARCHAR(45),
temperatura DOUBLE,
umidade VARCHAR (10),
dtTemp DATETIME,
statusSensor VARCHAR(45),
CHECK(statusSensor = 'ativo' OR
			statusSensor = 'inativo' OR
				statusSensor = 'Manutenção')
);


-- Inserindo valores nas tabela
INSERT INTO sensor (idSensor, nomeSensor, dilatação , temperatura, umidade, statusSensor ) VALUES
(null, 'Sensor Alpha' , '10min em 10min' , 20.9 ,'36%' ,'ativo'),
(null, 'Sensor Bravo' , '60min em 60min' , 26.0 ,'49%' ,'ativo'),
(null, 'Sensor Charlie' , '12min em 12min' , 30.8 ,'38%', 'Manutenção'),
(null, 'Sensor Delta' , '24min em 24min' , 19.8 ,'20%' ,'ativo'),
(null, 'Sensor Echo' , '27min em 27min' , 32.8 ,'44%' ,'ativo'),
(null, 'Sensor Foxtrot' , '10min em 10min' , 14.9 ,'70%', 'Inativo'),
(null, 'Sensor Golf' , '30min em 30min' , 22.4 , '42%','Inativo'),
(null, 'Sensor Hotel' , '10min em 10min' , 15.6 ,'23% ', 'Manutenção'),
(null, 'Sensor India' , '26min em 26min' , 19.2 ,' 50% ','ativo');
ALTER TABLE sensor
MODIFY COLUMN dtTemp datetime default current_timestamp;


-- Criando as tabelas (usuário)
CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nomeUsuario VARCHAR(45),
email VARCHAR(45),
telefone VARCHAR (12) 
);


-- Inserindo valores nas tabela

INSERT INTO usuario VALUES	 
(NULL , 'Bernardo Pereira','Bernardinho@abcd.com.br','11985453247'),
(NULL , 'Alicia Carros','Alice@ders.com.br','1456875825'),
(NULL , 'Alves Cunha','Alvinho@gfrnt.com.br','21958587432'),
(NULL , 'Alexandre Moraes','Alex@abcd.com.br','1165658452'),
(NULL , 'Luca Martins','Lucky@abcd.com.br','11954548012'),
(NULL , 'Ananda Silveira','Ana.sil@abcd.com.br','7465658542'),
(NULL , 'Beatriz Alves','Beaaal@gfrnt.com','11902145687'),
(NULL , 'Julia Rosa','Jujuross@ders.com.br','11944520785');


-- Primeiros select´s

SELECT * FROM localização;

SELECT * FROM empresa;

SELECT * FROM sensor;

SELECT * FROM  usuario;

SELECT * FROM localização,empresa,sensor,usuario;

-- Adicionando a FK nas tabelas

ALTER TABLE usuario add fkEmpresa int;
ALTER TABLE usuario add foreign key (fkEmpresa)
	references empresa(idEmpresa);
    
    ALTER TABLE Empresa add fkLocal int;
ALTER TABLE Empresa add foreign key (fkLocal)
	references localização(IdLocal);
    
      ALTER TABLE Sensor add fkLocal int;
ALTER TABLE Sensor add foreign key (fkLocal)
	references localização(IdLocal);
    
    DESC usuario;
     DESC sensor;
     DESC usuario;
     DESC localização;
     
    -- Fazendo os update's
    
     UPDATE Sensor SET fklocal = 4 WHERE idsensor = 1;
     UPDATE Sensor SET fklocal = 3 WHERE idsensor = 3;
     UPDATE Sensor SET fklocal = 2 WHERE idsensor = 5;
     UPDATE Sensor SET fklocal = 1 WHERE idsensor = 7;
     UPDATE Sensor SET fklocal = 5 WHERE idsensor = 8;
     UPDATE Sensor SET fklocal = 6 WHERE idsensor = 6;
     UPDATE Sensor SET fklocal = 7 WHERE idsensor = 4;
     UPDATE Sensor SET fklocal = 8 WHERE idsensor = 2;
     
     UPDATE Empresa SET fklocal = 1 WHERE idempresa = 1;
     UPDATE Empresa SET fklocal = 2 WHERE idempresa = 2;
     UPDATE Empresa SET fklocal = 3 WHERE idempresa = 3;
     UPDATE Empresa SET fklocal = 4 WHERE idempresa = 4;
     UPDATE Empresa SET fklocal = 5 WHERE idempresa = 5;
     UPDATE Empresa SET fklocal = 6 WHERE idempresa = 6;
     UPDATE Empresa SET fklocal = 7 WHERE idempresa = 7;
     UPDATE Empresa SET fklocal = 8 WHERE idempresa = 8;
     
	UPDATE usuario SET fkEmpresa = 1 WHERE idusuario= 1;
	UPDATE usuario SET fkEmpresa = 2 WHERE idusuario= 2;
	UPDATE usuario SET fkEmpresa = 3 WHERE idusuario= 3;
	UPDATE usuario SET fkEmpresa = 4 WHERE idusuario= 4;
	UPDATE usuario SET fkEmpresa = 5 WHERE idusuario= 5;
	UPDATE usuario SET fkEmpresa = 6 WHERE idusuario= 6;
	UPDATE usuario SET fkEmpresa = 7 WHERE idusuario= 7;
	UPDATE usuario SET fkEmpresa = 8 WHERE idusuario= 8;
    
    
    -- Fazendo um select com o join
    
    SELECT idusuario, nomeusuario AS 'Nome do usuário' ,
			nomeemp AS  'Nome da empresa'FROM usuario 
				JOIN empresa ON idempresa= fkempresa;
    
    SELECT idusuario, nomeusuario AS 'Nome do usuário' , nomeemp AS  'Nome da empresa'
			FROM usuario JOIN empresa ON idempresa= fkempresa 
				ORDER BY idusuario;
     
     
  




