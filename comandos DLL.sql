CREATE DATABASE IF NOT EXISTS escola;
USE escola;

DROP DATABASE escola;

CREATE TABLE IF NOT EXISTS aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    email VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    disciplina VARCHAR(50) NOT NULL,
    
	FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

INSERT INTO alunos (nome, idade, email) VALUES	
('João Silva', 20, 'joao.silva@email.com'),
('Maria Oliveira', 22, 'maria.oliveira@email.com'),
('Pedro Santos', 19, 'pedro.santos@email.com'),
('Ana Costa', 21, 'ana.costa@email.com'),
('Lucas Pereira', 23, 'lucas.pereira@email.com'),

(NULL, 'João Silva', 20, 'joao@example.com'),
(NULL, 'Maria Oliveira', 22, NULL),
(NULL, 'Pedro Santos', 19, 'pedro@example.com'),
(NULL, 'Ana Costa', 21, NULL),
(NULL, 'Lucas Pereira', 23, 'lucas@example.com'),
(NULL, 'Fulano', 18, NULL);

INSERT INTO matricula (id_aluno, disciplina) VALUES
(1, 'Banco de Dados'),
(2, 'Programação Web'),
(3, 'Estruturas de Dados'),
(4, 'Engenharia de Software'),
(5, 'Redes de Computadores'),
(1, 'Algoritmos'),
(2, 'Banco de Dados'),
(3, 'Sistemas Operacionais');

INSERT INTO matricula (id_matricula, id_aluno, disciplina) VALUES
(NULL, 1, 'Banco de Dados'),
(NULL, 1, 'Algoritmos'),
(NULL, 2, 'Programação Web'),
(NULL, 3, 'Estruturas de Dados'),
(NULL, 4, 'Engenharia de Software'),
(NULL, NULL, 'Redes'),
(NULL, 5, NULL),
(NULL, 999, 'Machine Learning'); 

SELECT * FROM
alunos a INNER JOIN
matricula m ON
a.id_aluno = m.id_matricula;


-- Se você realmente tivesse criado 'aluno' e quisesse renomear:
RENAME TABLE aluno TO alunos;

-- TRUNCATE: precisa do nome da tabela
-- (use com cuidado; isso apaga todos os registros)
-- TRUNCATE TABLE matricula;
-- TRUNCATE TABLE alunos;

-- Alterações na tabela alunos
ALTER TABLE alunos
    ADD COLUMN endereco VARCHAR(150),
    ADD COLUMN telefone VARCHAR(20);

-- Remover coluna endereco (se não for mais necessária)
ALTER TABLE alunos
    DROP COLUMN endereco;

-- Tornar email obrigatório (NOT NULL).
-- Se já houver linhas com email NULL, isto vai falhar; primeiro atualize esses registros.
ALTER TABLE alunos
    MODIFY email VARCHAR(200) NOT NULL;
