create database cinema;
use cinema;

#Tabelas

create table tbl_Ator(
	Id_ator int primary Key auto_increment not null,
    Nome_ator varchar(45) not null,
    Sexo varchar(1),
    Dt_nascimento date not null
);

create table tbl_Diretor(
	Id_diretor int primary Key auto_increment not null,
    Nome_diretor varchar(45) not null,
    Nacionalidade varchar(10),
    Dt_nascimento date not null
);


create table tbl_Genero(
	Id_genero int primary Key auto_increment not null,
    Genero varchar(45) not null
);

create table tbl_Filme(
	Id_filme int primary Key auto_increment not null,
    Nome_filme_PT varchar(45) not null,
    Nome_filme_EN varchar(45) not null,
    Ano_lancamento int(4),
    Duracao int(3) not null,
    FK_id_genero int not null,
    FK_id_Diretor int not null,
    constraint FK_id_genero foreign Key(FK_id_genero) references tbl_Genero(Id_genero),
    constraint FK_id_Diretor foreign Key(FK_id_Diretor) references tbl_Diretor(Id_diretor)
);

create table tbl_Filme_has_tbl_Ator(

	FK_id_filme int,
    
    constraint FK_id_filme foreign Key(FK_id_filme) references tbl_Filme(Id_filme),
    
    FK_id_ator int,
    primary Key(FK_id_filme, FK_id_ator),
    constraint FK_id_ator foreign Key(FK_id_ator) references tbl_Ator(Id_ator)
);

create table tbl_usuario(
	id_usuario int primary Key auto_increment not null,
    nome varchar(45) not null,
    email varchar(60) not null,
    senha varchar(15) not null,
    nacionalidade varchar(20) default 'Brasileiro',
    tipo_usuario enum('admin','comum'),
    data_hora datetime default now()
);

#Alterações das tabelas

ALTER table tbl_usuario add telefone varchar(15); # adicionar coluna

alter table tbl_usuario drop telefone; # retirar coluna

alter table tbl_usuario modify senha varchar(20) not null; # modificar tipo da coluna

alter table tbl_usuario modify data_hora varchar(15) not null;

alter table tbl_usuario change nome nome_usuario varchar(45) not null; # modificar nome e tipo da coluna

alter table tbl_usuario rename tbl_usuarios; # mudar o nome da TABELA 

alter table tbl_Diretor add sexo varchar(1);
alter table tbl_Diretor modify sexo enum('F','M');
alter table tbl_Diretor modify Nacionalidade varchar(45);

alter table tbl_filme drop Nome_filme_EN;
alter table tbl_filme change Nome_filme_PT Nome_filme varchar(45) not null;
alter table tbl_filme_has_tbl_ator rename Filme_e_Ator;

alter table tbl_Ator modify Sexo enum('F','M');

#Inserção de dados
    
desc tbl_Genero;

	Insert INTO tbl_Genero(Genero)
		Values('Terror'),
			('Ação'),
			('Comedia'),
			('Drama'),
			('Suspense'),
			('Ficção'),
			('Romance'),
			('Animação');
        
select * from tbl_Genero;

desc tbl_Diretor;

	Insert INTO tbl_Diretor(Nome_diretor,Nacionalidade,Dt_nascimento,sexo)
		Values('Steven Spielberg','Estados Unidos', '1946/12/18', 'M'),
        ('James Cameron','Canada', '1954/08/16', 'M'),
        ('José Padilha','Brasil', '1967/08/01', 'M'),
        ('George Lucas','Estados Unidos', '1944/05/14', 'M'),
        ('Alan Rickman','Inglaterra', '1946/02/21', 'M'),
        ('Fernando Meirelles','Brasil', '1965/11/09', 'M');
        
select * from tbl_Diretor;

desc tbl_Ator;

	Insert Into tbl_Ator(Nome_ator,Sexo, Dt_nascimento)
		Values('Andrew Garfield','M','1983/08/20'),
			('Sandra Bullock','F','1964/06/26'),
          ('Will Smith','M', '1968/09/25'),     
		  ('Harrison Ford','M','1942/07/13' ),                         
	      ('Hugh Jackman','M','1968/12/10'),
	      ('Angelina Jolie'	,'F' ,'1975/06/04'),                        
	      ('Keanu Reeves','M','1964/09/02'  ),                   
		  ('Jennifer Lawrence','F','1990/08/15' ),
		  ('Sylvester Stallone','M','1946/07/06'),                   
		  ('James Mcavoy','M','1979/04/21')     ,         
		  ('Brad Pitt',	'M'	,'1963/12/18'),
	      ('Leonardo Dicaprio','M','1974/11/11'),
	      ('Vin Diesel'	,'M','1967/07/18'),
	      ('Johnny Depp','M','1963/06/09'),              
		  ('Robin Williams'	,'M','1951/07/21'),               
		  ('Robert Downey Jr.','M','1965/04/04'),                     
		  ('Patrick Stewart','M',' 1940/07/13'),           
		  ('Sandra Bullock','F','1964/07/26'),             
	      ('Jackie Chan', 'M'	,'1954/04/07'),                   
		  ('Jennifer Aniston', 'F', '1969/02/11'),	         
		  ('Jim Carrey','F'	,' 1962/01/17'),                  
	      ('Scarlett Johansson','F'	,'1984/11/22'),                
		  ('Megan Fox' ,'F' ,'1986/05/16'),               
		  ('Ben Stiller','F','1965/11/30'),                           
		  ('Emma Stone','F','1988/11/06');                

select * from tbl_Ator;

desc tbl_Filme;

insert into tbl_Filme(Id_filme, Nome_filme, Ano_lancamento, Duracao, FK_id_genero, FK_id_Diretor)
	values(default, 'Viva: A Vida é Uma Festa', '2017', '105', '8', '5'),
    (default, 'Logan', '2017', '137', '2', '1'),
    (default, 'Um Sonho de Liberdade', '1995', '142', '4', '5'),
    (default, 'Matrix', '1999', '150', '6', '1'),
    (default, 'Jumanji', '1996', '104', '3', '6'),
    (default, 'Cidade de Deus', '2002', '135', '2', '3'),
    (default, 'O Resgate do Soldado Ryan', '1998', '170', '2', '6'),
    (default, 'Extraordinário', '2017', '113', '4', '5'),
    (default, 'O Poderoso Chefão', '1972', '178', '2', '2'),
    (default, 'Forrest Gump', '1994', '142', '7', '1'),
    (default, 'Truque de Mestre', '2013', '125', '2', '4'),
    (default, 'Fragmentado', '2017', '117', '4', '6'),
    (default, 'Avatar', '2009', '162', '6', '2'),
    (default, 'O Preço do Amanhã', '2011', '109', '2', '3'),
    (default, 'O Senhor dos Anéis: O Retorno do Rei', '2003', '200', '6', '5'),
    (default, 'Toy Story', '1995', '141', '8', '2'),
    (default, 'Star Wars: Os Últimos Jedi', '2017', '152', '6', '4'),
    (default, 'O Menino do Pijama Listrado', '2008', '94', '4', '1'),
    (default, 'O Lobo de Wall Street', '2013', '181', '4', '6'),
    (default, 'A Hora do Rush', '1998', '98', '3', '5'),
    (default, 'Piratas do Caribe - Maldição do Perola Negra', '2003', '143', '2', '4'),
    (default, 'Passengeiros', '2016', '116', '2', '1'),
    (default, 'Beleza Oculta', '2016', '97', '4', '2'),
    (default, 'It - A Coisa', '2017', '134', '1', '3'),
    (default, 'Rocky V', '1990', '111', '4', '4'),
    (default, 'Titanic', '1997', '195', '7', '4'),
    (default, 'Vingadores 4', '2019', '150', '2', '2'),
    (default, 'Velozes e Furiosos 8', '2017', '136', '2', '6'),
    (default, 'Transformers', '2007', '150', '2', '4'),
    (default, 'Ilha do Medo', '2010', '139', '5', '1');
    
#Tarefa proposta pelo professor de buscar os dados seguindo as instruções das atividades

select * from tbl_Filme;

select  nome_filme, min(duracao) from tbl_filme where ano_lancamento > 2000 and ano_lancamento < 2010; 

select nome_filme from tbl_filme where FK_id_genero = 4 and ano_lancamento > 2010;

select count(nome_filme), sum(duracao) total_minutos from tbl_filme where ano_lancamento > 2010 and ano_lancamento < 2018 and FK_id_genero = 6;

select count(nome_filme), avg(duracao) media_minutos from tbl_filme where ano_lancamento > 2000;

select  ano_lancamento, count(nome_filme) total_filmes from tbl_filme group by ano_lancamento;

select fk_id_genero, count(nome_filme), sum(duracao), avg(duracao) from tbl_filme group by FK_id_genero order by avg(duracao) asc;

SELECT * FROM tbl_Ator WHERE Nome_ator LIKE 'a%';

select Nome_ator , Dt_nascimento from tbl_Ator where Dt_nascimento between  '1960/0/0' and '1980/0/0' order by nome_Ator asc;

select Nome_ator from tbl_Ator where Sexo = 'F' group by Dt_nascimento having day(Dt_nascimento) = 22 or month(Dt_nascimento) = 11; 

select now() + interval 3 day;

#Anotações

#drop database cinema;

#round(duracao, 2);	

#Exibir o total de filmes, a soma das durações e a media das duracoes para cada um dos generos de filmes organizando da menor media para a maior.

# desc tbl_usuarios;

#1º Informando todos os campos da tabela a serem inseridos

#Insert INTO tbl_usuarios(nome_usuario, email, senha, nacionalidade, tipo_usuario, data_hora)
#	VALUES('Andre','andre@etec777','hh22','Boloviano', 'Admin','2022/08/25 19:39:00');
    
#select * from tbl_usuarios;
    
#Insert INTO tbl_usuarios(nome, email, senha, nacionalidade, tipo_usuario,  data_hora)
#	VALUES('Andre','andre@etec777','hh22', default, 'Admin', default);
    
    
 #   Insert INTO tbl_usuarios(nome, email, senha, tipo_usuario )
	#VALUES('Andre','andre@etec777','hh22', 'Admin');
    
    #2º Posso omitir os campos da coluna
    
    #Insert INTO tbl_usuarios Values(5,'Gabriel','gabriel@gmail.com','gabriel','Brasileiro','comum',default);
    
    #3º Varias inserções ao mesmo tempo
    
    #insert into tbl_usuarios(nome,email,senha,tipo_usuario)
    #values('André','andré@gmial.com','andré123','admin'),
    #('gabriel','gabriel@gmail.com','gabriel@123','admin'),
    #('Andrey','andrey@gmail.com','andrey','admin')