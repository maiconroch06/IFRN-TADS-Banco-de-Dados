CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE livro (
	id_livro INT AUTO_INCREMENT PRIMARY KEY,
	CDU VARCHAR(50) NOT NULL UNIQUE,
	ISBN VARCHAR(20) NOT NULL UNIQUE,
	titulo VARCHAR(130) NOT NULL,
	autor VARCHAR(100),
	editora VARCHAR(100),
	ano YEAR
);


CREATE TABLE bibliotecario (
	id_bibliotecario INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(80) NOT NULL,
	matricula INT NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
	telefone VARCHAR(20),
	CPF CHAR(14) NOT NULL UNIQUE,
	ano_contratacao YEAR NOT NULL
);

CREATE TABLE aluno (
	id_aluno INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(80) NOT NULL,
	matricula INT NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
	telefone VARCHAR(20)
);

CREATE TABLE emprestimo (
  id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,

  id_aluno INT NOT NULL,
  id_livro INT NOT NULL,
  id_bibliotecario INT NOT NULL,

  data_emprestimo DATE NOT NULL,
  data_prevista_devolucao DATE NOT NULL,
  data_devolucao_efetiva DATE,
  data_penalidade DATE, -- Não é uma coluna, só existe quando usa um select com calculo.

  CONSTRAINT fk_emprestimo_aluno
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),

  CONSTRAINT fk_emprestimo_livro
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),

  CONSTRAINT fk_emprestimo_bibliotecario
    FOREIGN KEY (id_bibliotecario) REFERENCES bibliotecario(id_bibliotecario)
);

-- 5 livros com dados completos
INSERT INTO livro (CDU, ISBN, titulo, autor, editora, ano) VALUES
('004.43', '9788575227242', 'Introdução à Programação em Java', 'Deitel & Deitel', 'Pearson', 2020),
('005.13', '9788576082673', 'Algoritmos e Lógica de Programação', 'José Augusto Manzano', 'Érica', 2019),
('006.31', '9788535283820', 'Inteligência Artificial', 'Stuart Russell', 'Elsevier', 2021),
('004.65', '9788575228072', 'Banco de Dados', 'Elmasri & Navathe', 'Pearson', 2018),
('005.33', '9788543002283', 'Estruturas de Dados', 'Nivio Ziviani', 'Elsevier', 2022);

-- 5 alunos com dados completos
INSERT INTO aluno (nome, matricula, email, telefone) VALUES
('João Pedro', 201, 'joao.pedro@ifrn.edu.br', '(84) 99900-1111'),
('Maria Clara', 202, 'maria.clara@ifrn.edu.br', '(84) 98800-2222'),
('Lucas Henrique', 203, 'lucas.henrique@ifrn.edu.br', '(84) 97700-3333'),
('Ana Beatriz', 204, 'ana.beatriz@ifrn.edu.br', '(84) 96600-4444');

-- 3 bibliotecario com dados completos
INSERT INTO bibliotecario (nome, matricula, email, telefone, CPF, ano_contratacao) VALUES
('Ana Paula Silva', 101, 'ana.silva@biblioteca.com', '(84) 99911-2233', '123.456.789-01', 2018),
('Carlos Eduardo Lima', 102, 'carlos.lima@biblioteca.com', '(84) 98822-3344', '987.654.321-00', 2020),
('Mariana Souza', 103, 'mariana.souza@biblioteca.com', '(84) 97733-4455', '456.789.123-55', 2022);

-- 5 emprestimos realizados
INSERT INTO emprestimo (id_aluno, id_livro, id_bibliotecario, data_emprestimo, data_prevista_devolucao, data_devolucao_efetiva, data_penalidade) VALUES
(1, 1, 1, '2026-01-10', '2026-01-17', '2026-01-16', NULL),
(2, 2, 2, '2026-01-12', '2026-01-19', '2026-01-20', null), -- '2026-01-22'),
(3, 3, 3, '2026-01-15', '2026-01-22', NULL, NULL),
(1, 4, 1, '2026-01-16', '2026-01-23', NULL, NULL),
(4, 5, 2, '2026-01-18', '2026-01-25', NULL, NULL);

-- metodo para atribuir o metodo de penalidade. Que no caso não é uma coluna!
SELECT CASE WHEN data_devolucao_efetiva > data_prevista_devolucao 
    THEN DATEDIFF(data_devolucao_efetiva, data_prevista_devolucao) * 2
    ELSE 0 END AS penalidade
FROM emprestimo;


desc livro;
desc bibliotecario;
desc aluno;

TRUNCATE TABLE aluno;

select * from livro;
select * from bibliotecario;
select * from aluno;
