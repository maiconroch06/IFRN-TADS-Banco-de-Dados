CREATE DATABASE estoque;

USE estoque;
Drop table a;

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cpf CHAR(14) NOT NULL PRIMARY KEY
);

CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(200) NOT NULL,
    cpf CHAR(14) NOT NULL PRIMARY KEY,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE produto (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    codigo CHAR(14) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    quantidade INT UNSIGNED NOT NULL,
    valorUnitario DECIMAL(10,2) NOT NULL
);

create table historicoVenda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    nomeFuncionario VARCHAR(200),
    nomeCliente VARCHAR(200),
    
    metodo VARCHAR(10),
    quantidade INT UNSIGNED NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (nomeFuncionario) REFERENCES funcionario(nome),
    FOREIGN KEY (nomeCliente) REFERENCES cliente(nome)
);

create table itemVenda (
	codigo char(14) PRIMARY KEY,
	descricao varchar(200),
	quantidade tinyint(100), 
	valorTotal double
);

select * from funcionario;
select * from produto;