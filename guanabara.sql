-- Lista todos os bancos de dados disponíveis no servidor MySQL
SHOW DATABASES;

-- Cria um novo banco de dados com o nome especificado
CREATE DATABASE nome_do_banco_de_dados;

-- Define qual banco de dados será usado para os próximos comandos
USE nome_do_banco_de_dados;

-- Cria uma nova tabela chamada 'nome_da_tabela' com colunas e tipos de dados definidos
CREATE TABLE nome_da_tabela (
    nome VARCHAR(30),         -- Armazena o nome com até 30 caracteres
    idade TINYINT(3),         -- Armazena idade como número pequeno (até 3 dígitos)
    sexo CHAR(3),             -- Armazena sexo com até 3 caracteres (ex.: 'M', 'F')
    peso FLOAT,               -- Armazena peso como número decimal
    altura FLOAT,             -- Armazena altura como número decimal
    nacionalidade VARCHAR(20) -- Armazena nacionalidade com até 20 caracteres
);

-- Mostra a estrutura da tabela (colunas, tipos e restrições)
DESCRIBE nome_da_tabela;

-- Exclui a tabela especificada do banco de dados
DROP TABLE nome_da_tabela;

-- Exclui o banco de dados e todas as tabelas contidas nele
DROP DATABASE nome_do_banco_de_dados;

##############################################################
# Exemplo prático com criação de banco, tabela e inserção de dados
##############################################################

-- Cria um banco chamado 'cadastro' com configuração de caracteres UTF-8
CREATE DATABASE cadastro
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

-- Define que vamos usar o banco 'cadastro'
USE cadastro;

-- Cria a tabela 'pessoas' com colunas e restrições
CREATE TABLE `pessoas` (
    `id` INT NOT NULL AUTO_INCREMENT,           -- Identificador único, incrementa automaticamente
    `nome` VARCHAR(30) NOT NULL,               -- Nome obrigatório, até 30 caracteres
    `nascimento` DATE,                         -- Data de nascimento
    `sexo` ENUM('M','F'),                      -- Sexo limitado a 'M' ou 'F'
    `peso` DECIMAL(5,2),                       -- Peso com até 5 dígitos, 2 decimais
    `altura` DECIMAL(3,2),                     -- Altura com até 3 dígitos, 2 decimais
    `nacionalidade` VARCHAR(20) DEFAULT 'Brasil', -- Nacionalidade padrão 'Brasil'
    PRIMARY KEY (id)                           -- Define 'id' como chave primária
) DEFAULT CHARSET = utf8;

-- Inserindo registros na tabela 'pessoas'
INSERT INTO pessoas (nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES ('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil');

INSERT INTO pessoas (nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES ('Maria', '1984-01-02', 'F', '50.2', '1.65', 'Portugal');

-- Inserindo com valores padrão para alguns campos
INSERT INTO pessoas (id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES (DEFAULT, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', DEFAULT);

-- Inserindo múltiplos registros de uma vez
INSERT INTO pessoas VALUES
(DEFAULT, 'Idauza', '1930-03-02', 'F', '63.2', '1.75', 'Irlanda'),
(DEFAULT, 'Robson', '1975-04-22', 'M', '99.0', '2.15', 'EUA'),
(DEFAULT, 'Claudio', '1999-12-03', 'M', '87', '2', DEFAULT);

-- Consulta todos os registros da tabela
SELECT * FROM pessoas;

-- Mostra a estrutura da tabela (atalho para DESCRIBE)
DESC pessoas;

##############################################################
# Alterações na tabela
##############################################################

-- Adiciona uma nova coluna chamada 'profissao'
ALTER TABLE pessoas ADD COLUMN profissao VARCHAR(10);

-- Remove a coluna 'profissao'
ALTER TABLE pessoas DROP COLUMN profissao;

-- Adiciona a coluna 'profissao' após a coluna 'nome'
ALTER TABLE pessoas ADD COLUMN profissao VARCHAR(10) AFTER nome;
-- Dica: para adicionar no início, use FIRST

-- Modifica a coluna 'profissao' para ter 20 caracteres e não aceitar valores nulos
ALTER TABLE pessoas MODIFY COLUMN profissao VARCHAR(20) NOT NULL DEFAULT '';
-- O DEFAULT '' evita erro ao inserir registros sem informar profissão

-- Altera o nome da coluna 'profissao' para 'prof'
ALTER TABLE pessoas CHANGE COLUMN profissao prof VARCHAR(10);

-- Renomeia a tabela 'pessoas' para 'gafanhotos'
ALTER TABLE pessoas RENAME TO gafanhotos;

##############################################################
# Criando outra tabela com boas práticas
##############################################################

CREATE TABLE IF NOT EXISTS cursos (
    nome VARCHAR(30) NOT NULL UNIQUE,  -- Nome obrigatório e único
    descricao TEXT,                    -- Texto livre para descrição
    carga INT UNSIGNED,                -- Número inteiro sem sinal (não aceita negativos)
    totaulas INT,                      -- Total de aulas
    ano YEAR DEFAULT '2025'            -- Ano com valor padrão 2025
) DEFAULT CHARSET = utf8;

-- Adicionando coluna 'id_curso' como chave primária
ALTER TABLE cursos ADD COLUMN id_curso INT FIRST;
ALTER TABLE cursos ADD PRIMARY KEY (id_curso);

-- Verifica estrutura da tabela
DESC cursos;

################################################################
# Modificação de valores
################################################################

-- Inserindo vários registros na tabela 'cursos' com valores para cada coluna
INSERT INTO cursos VALUES
('1','HTML4','Curso de HTML5','40','37','2014'),
('2','Algoritmos','Lógica de Programação','20','15','2014'),
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
('4','PGP','Curso de PHP para iniciantes','40','20','2010'),
('5','Jarva','Introdução à Linguagem Java','10','29','2000'),
('6','MySQL','Bancos de Dados MySQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'),
('8','Sapateado','Danças Rítmicas','40','30','2018'),
('9','Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'),
('10','YouTuber','Gerar polêmica e ganhar inscritos','5','2','2018');

-- Atualiza o nome do curso com id 1 de 'HTML4' para 'HTML5'
UPDATE cursos
SET nome = 'HTML5'
WHERE id_curso = '1';

-- Atualiza dois valores na mesma linha: nome e ano do curso com id 4
UPDATE cursos
SET nome = 'PHP', ano = '2015'
WHERE id_curso = '4';

-- Atualiza três valores na mesma linha: nome, carga e ano do curso com id 5
UPDATE cursos
SET nome = 'Java', carga = '40', ano = '2015'
WHERE id_curso = '5'
LIMIT 1; -- Garante que apenas uma linha seja modificada, mesmo que a condição retorne mais de um registro

-- Atualiza múltiplos registros: altera carga e ano para todos os cursos com ano = '2018'
UPDATE cursos
SET carga = '400', ano = '2050'
WHERE ano = '2018';
-- Observação: Por padrão, o Workbench pode impedir alterações em massa para evitar erros graves

################################################################
# Exclusão de registros
################################################################

-- Exclui o curso com id 8
DELETE FROM cursos
WHERE id_curso = '8';

-- Exclui o curso com id 9
DELETE FROM cursos
WHERE id_curso = '9';

-- Exclui o curso com id 10
DELETE FROM cursos
WHERE id_curso = '10';

-- Remove todos os registros da tabela 'cursos', mas mantém a estrutura da tabela
TRUNCATE TABLE cursos; -- Pode usar apenas TRUNCATE cursos

-- Exibe todos os registros da tabela (após exclusões ou alterações)
SELECT * FROM cursos;

################################################################
# Comandos SELECT
################################################################

-- Selecione todos os campos da tabela cursos em ordem alfabetica
select * from cursos
order by nome;

-- Selecione todos os campos da tabela cursos em ordem descendente
select * from cursos
order by nome desc;

-- Selecione todos os campos da tabela cursos em ordem ascendente
select * from cursos
order by nome asc;

-- Selecionado por colunas
select nome, carga, ano from cursos
order by nome;
select ano, carga, nome from cursos
order by ano;
select ano, carga, nome from cursos
order by ano, nome;

-- Selecionado por linhas
select * from cursos
where ano = '2016'
order by ano, nome;

-- Selecionado por colunas e linhas
select nome, descricao, ano from cursos
where ano <= '2016'
order by ano, nome;

select nome, descricao, ano from cursos
where ano < '2016'
order by ano, nome;

select nome, descricao, ano from cursos
where ano != '2016'
order by ano, nome;

select nome, descricao, ano from cursos
where ano <> '2016'
order by ano, nome;

select nome, ano from cursos
where ano between '2014' and '2016'
order by ano desc, nome asc;

-- Selecionando valores
select id_curso, nome from cursos
where ano in (2014, 2016, 2020)
order by nome asc;

-- Selecionando valores com operadores
select nome, carga, totaulas from cursos
where carga >= 30 and totaulas < 30 
order by nome asc;

select nome, carga, totaulas from cursos
where carga >= 30 or totaulas < 30 
order by nome asc;