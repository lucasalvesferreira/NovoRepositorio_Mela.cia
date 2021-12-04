/*  Criando o banco de dados Melan.cia */

Create database Melancia;
	Use Melancia;

create table Empresa(
	idEmpresa int primary key auto_increment,
	CNPJ char (14),
	razaoEmp varchar (45),
	responsavel varchar (45),
	email varchar (60),
	senha varchar (20)
	);



    create table fazenda (
			idFazenda int primary key auto_increment,
            hectares int,
			fkEmpresa int,
			constraint fk_empresaFaz
			foreign key (fkEmpresa) references Empresa(idEmpresa)
			);
            
            
            
            
            create table endereco (
            idEndereco int primary key auto_increment,            
			estado varchar (45),
			cidade varchar (45),
			rua varchar (45),
			numero int,
            fkFazenda int,
            foreign key (fkFazenda) references fazenda(idFazenda)
            ) auto_increment = 1100;

	
create table funcionario (
	idFunc int primary key auto_increment,
	nomeFunc varchar (50),
	senhaFunc varchar (20),
	emailFunc varchar (50),
	telefone varchar (15),
    fkFazenda int,
    constraint fk_FazendaFun
    foreign key  (fkFazenda) references Fazenda(idFazenda)
	);


create table canteiro (
	idCanteiro int primary key auto_increment,
	linha int,
    qtd_melan INT,
    fkFazenda int,
    constraint fk_FazendaCant
    foreign key  (fkFazenda) references Fazenda(idFazenda)
	);
select * from canteiro;
select e.razaoEmp, sum(linha) AS 'quantidade de linhas do canteiro' FROM empresa as e JOIN canteiro as c on e.idEmpresa = c.fkFazenda where fkFazenda = 1;

create table relatorio (
	idRel int primary key auto_increment,
	dtRel date
	);


	create table medidas(
		idMedidas int primary key auto_increment,
		umidade double,
		temperatura_lm35 double, 
		hr_medida DATETIME,
        fkCanteiro INT,
        constraint fk_Canteiro
		foreign key  (fkCanteiro) references canteiro(idCanteiro));
        

	Create table sensor (
		idSensor int primary key auto_increment,
		nomeSensor varchar (45),
		statusSens varchar (45),
		check (statusSens = 'ativo' 
					or statusSens = 'inativo'
							or statusSens = 'manutenção'),
		fkrelatorio int,
        fkmedidas int,
		constraint fk_relatorioSen
		foreign key  (fkrelatorio) references relatorio(idRel),
        constraint fk_Medidas
        foreign key (fkmedidas) references medidas(idMedidas)
		) auto_increment =1000 ; 

 
	


	  Create table Bloco (
		idBloco int primary key auto_increment,
		fkCanteiro int,
		constraint fk_BlocoCant
		foreign key  (fkCanteiro) references canteiro(idCanteiro),
		fkSensor int,
		constraint fk_sensorBloco
		foreign key  (fkSensor) references sensor(idSensor));
   
	Select * from Empresa;
		DESC Empresa;