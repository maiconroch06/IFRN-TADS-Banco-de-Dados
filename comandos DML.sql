# Conteudo Anterior - comandos DDL #
create database escola;
use escola;
create table alunos (
	id_aluno int auto_increment primary key,
    nome varchar(100) not null,
    idade int not null default 18 check(idade >= 0),
    email varchar(200)
);
create table matricula (
	id_matricula int auto_increment,
    id_aluno int not null,
    disciplina varchar(50) not null,
    primary key(id_matricula),
    foreign key (id_aluno) references alunos(id_aluno)
);

-- comandos DML 13/11/2025

insert into alunos (nome, idade, email)
values ('Liuz', 35, 'Luiz@gmail.com');

insert into alunos (nome, idade, email)
values ('Thiago', 35, 'Thiago@gmail.com'),
('Thiago', 35, 'Thiago@gmail.com');

select * from alunos;

select * from alunos
order by nome desc limit 3; -- desc, se trata de ser em ordem decrescente.

select * from alunos
order by id_aluno asc limit 3; -- acs, Enquanto asc se refere a ordem crescente.

select nome, idade from alunos;

select * from alunos where idade >= 21; -- aplica filtro (where) de aparecer apenas os alunos que tem idade maior que 21

select * from alunos where idade <= 21 or nome = 'Thiago'; -- or, traz um ou outro

select * from alunos where idade <= 30;

select * from alunos where idade <= 30 and nome = 'Thiago';