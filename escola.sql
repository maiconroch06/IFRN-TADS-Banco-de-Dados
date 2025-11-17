create database escola;

use escola;

# Tabela de aluno, com atributo telefone multivalorado
create table aluno (
id_aluno int unsigned auto_increment,
nome varchar(100) not null,
idade int unsigned not null,
email varchar(50) not null unique,

PRIMARY KEY(id_aluno)
);

create table telefone_aluno (
id_telefone int unsigned auto_increment,
id_aluno int unsigned not null,
telefone varchar(20) not null,

PRIMARY KEY(id_telefone),
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

create table matricula (
id_matricula int unsigned auto_increment,
id_aluno int unsigned not null,
data_matricula date not null,

PRIMARY KEY(id_matricula),
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

create table turma (
id_turma int unsigned auto_increment,
nome_turma varchar(3) not null,
curso varchar(50) not null,

PRIMARY KEY(id_turma)
);

create table aluno_turma (
id_aluno int unsigned,
id_turma int unsigned,

PRIMARY KEY (id_aluno, id_turma),
FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

# Tabela de professor, com atributo telefone multivalorado
create table professor (
id_professor int unsigned auto_increment,
nome varchar(100) not null,
idade int unsigned not null,
email varchar(50) not null unique,

PRIMARY KEY(id_professor)
);

create table telefone_professor (
id_telefone int unsigned auto_increment,
id_professor int unsigned not null,
telefone varchar(20) not null,

PRIMARY KEY(id_telefone),
FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

