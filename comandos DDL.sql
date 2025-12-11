CREATE DATABASE IF NOT EXISTS escola;
USE escola;

CREATE TABLE IF NOT EXISTS aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL DEFAULT 18,
    email VARCHAR(200),
    CONSTRAINT chk_idade_nonneg CHECK (idade >= 0)
);

CREATE TABLE IF NOT EXISTS matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    disciplina VARCHAR(50) NOT NULL,
    CONSTRAINT fk_matricula_aluno
        FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

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
