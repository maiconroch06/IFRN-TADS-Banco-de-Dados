CREATE DATABASE biblioteca
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE biblioteca;

create table if not exists livro (
ID_livro int NOT NULL auto_increment,
CDU varchar(50) not null unique,
ISBN varchar (20),
titulo varchar(130) not null,
autor varchar (100),   
editora varchar (100),
ano year,
PRIMARY KEY (ID_livro, CDU)
) DEFAULT CHARSET = utf8;

ALTER TABLE livro modify column autor varchar (100);

CREATE TABLE IF NOT EXISTS bibliotecario (
ID_bibli int not null auto_increment,
nome varchar(80) not null,
matricula tinyint(14) not null unique,
email varchar(50) not null,
telefone varchar(20),
CPF char(16) not null unique,
ano_contratacao year not null,
primary key (ID_bibli)
) DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS aluno (
ID_aluno int not null auto_increment,
nome varchar(80) not null,
matricula tinyint(14) not null unique,
email varchar(50) not null,
telefone varchar(20),
primary key (ID_aluno)
) DEFAULT CHARSET = utf8;

desc livro;
desc bibliotecario;
desc aluno;

TRUNCATE TABLE aluno;

ALTER TABLE aluno MODIFY COLUMN matricula VARCHAR(20) NOT NULL DEFAULT '';

select * from livro;
select * from bibliotecario;
select * from aluno;