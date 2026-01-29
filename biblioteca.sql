create database biblioteca;

use biblioteca;

create table livro (
	id_livro int auto_increment primary key,
	CDU varchar(50) not null unique,
	ISBN varchar(20) not null unique,
	titulo varchar(130) not null,
	autor varchar(100),
	editora varchar(100),
	ano year
);


create table bibliotecario (
	id_bibliotecario int auto_increment primary key,
	nome VARCHAR(80) not null,
	matricula int not null unique,
	email varchar(50) NOT NULL UNIQUE,
	telefone varchar(20),
	CPF char(14) not null unique,
	ano_contratacao year not null
);

create table aluno (
	id_aluno int auto_increment primary key,
	nome varchar(80) not null,
	matricula int not null unique,
	email varchar(50) not null unique,
	telefone varchar(20)
);

CREATE TABLE emprestimo (
  id_emprestimo int auto_increment primary key,

  id_aluno int not null,
  id_livro int not null,
  id_bibliotecario int not null,

  data_emprestimo date not null,
  data_prevista_devolucao date not null,
  data_devolucao_efetiva date,
  data_penalidade date, -- Não é uma coluna, só existe quando usa um select com calculo.

    foreign key (id_aluno) references aluno(id_aluno),

    foreign key (id_livro) references livro(id_livro),

    foreign key (id_bibliotecario) references bibliotecario(id_bibliotecario)
);

-- 6 livros para 4 categorias, a divisão é pelo CDU
insert into livro (CDU, ISBN, titulo, autor, editora, ano) values

-- Programação (01)
('0101', '978-85-60031-64-1', 'A linguagem de programação Java', 'Ken Arnold', 'Bookman', 2007),
('0102', '978-85-352-3699-6', 'Algoritmos : teoria e prática', 'Thomas H. Cormen et al.', 'Elsevier', 2012),
('0103', '978-85-700-1586-0', 'C, a linguagem de programação : padrão ANSI', 'Brian W. Kernighan', 'Campus', 1978),
('0104', '978-85-8260-468-7', 'Conceitos de linguagens de programação', 'Robert W. Sebesta', 'Bookman', 2018),
('0105', '978-85-7522-139-6', 'Construindo sites com CSS e (X)HTML', 'Maurício Samy Silva', 'Novatec', 2008),
('0106', '978-85-7522-234-8', 'Desenvolvendo websites com PHP', 'Juliano Niederauer', 'Novatec', 2011),

-- Literatura (02)
('0201', '978-85-359-0277-5', 'Dom Casmurro', 'Machado de Assis', 'Companhia das Letras', 2019),
('0202', '978-85-250-4032-8', 'O Cortiço', 'Aluísio Azevedo', 'Ática', 2004),
('0203', '978-85-0100-553-3', 'Capitães da Areia', 'Jorge Amado', 'Companhia das Letras', 2008),
('0204', '978-85-359-1484-6', 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 'Penguin-Companhia', 2011),
('0205', '978-85-98078-56-5', 'A Hora da Estrela', 'Clarice Lispector', 'Rocco', 1998),
('0206', '978-85-7326-386-1', 'Grande Sertão: Veredas', 'João Guimarães Rosa', 'Nova Fronteira', 2006),

-- Matemática (03)
('0301', '978-85-216-2465-4', 'Fundamentos de Matemática Elementar – Vol. 1', 'Gelson Iezzi', 'Atual', 2013),
('0302', '978-85-216-2472-2', 'Fundamentos de Matemática Elementar – Vol. 2', 'Gelson Iezzi', 'Atual', 2014),
('0303', '978-85-216-2480-7', 'Fundamentos de Matemática Elementar – Vol. 3', 'Gelson Iezzi', 'Atual', 2015),
('0304', '978-85-216-2510-1', 'Matemática Financeira', 'José Dutra Vieira Sobrinho', 'Atlas', 2010),
('0305', '978-85-216-1998-8', 'Cálculo com Geometria Analítica', 'Louis Leithold', 'Harbra', 1994),
('0306', '978-85-216-3024-2', 'Probabilidade e Estatística', 'Mário F. Triola', 'LTC', 2017),

-- História (04)
('0401', '978-85-359-0278-2', 'História do Brasil', 'Boris Fausto', 'Edusp', 2015),
('0402', '978-85-0101-250-0', 'Brasil: uma biografia', 'Lilia Moritz Schwarcz', 'Companhia das Letras', 2015),
('0403', '978-85-314-1496-7', 'História Geral', 'José Jobson de Andrade Arruda', 'Moderna', 2012),
('0404', '978-85-216-1615-4', 'História Antiga', 'Norberto Guarinello', 'Contexto', 2011),
('0405', '978-85-314-1117-1', 'História Moderna', 'Antônio Edmilson Martins Rodrigues', 'Moderna', 2010),
('0406', '978-85-216-1864-6', 'História Contemporânea', 'Eric Hobsbawm', 'Paz e Terra', 2008);


-- 10 alunos
insert into aluno (nome, matricula, email, telefone) values
('João Pedro', 201, 'joao.pedro@ifrn.edu.br', '(84) 11111-1111'),
('Maria Clara', 202, 'maria.clara@ifrn.edu.br', '(84) 22222-2222'),
('Lucas Henrique', 203, 'lucas.henrique@ifrn.edu.br', '(84) 33333-3333'),
('Maria Anelice', 204, 'maria.anelice@ifrn.edu.br', '(84) 44444-4444'),
('Marcos Avelino', 205, 'marcos.avelino@ifrn.edu.br', '(84) 555555-5555'),
('Maurício Souza', 206, 'mauricio.souza@ifrn.edu.br', '(84) 66666-66666'),
('Maicon Rocha', 207, 'maicon.rocha@ifrn.edu.br', '(84) 77777-7777'),
('Samuel Gustavo', 208, 'samuel.gustavo@ifrn.edu.br', '(84) 88888-8888'),
('Lucas Felipe', 209, 'lucas.felipe@ifrn.edu.br', '(84) 99999-9999'),
('Lucas Felipe', 210, 'maria.patricia@ifrn.edu.br', '(84) 00000-0000');

-- 3 bibliotecario
insert into bibliotecario (nome, matricula, email, telefone, CPF, ano_contratacao) values
('Arthur Medeiros', 101, 'arthur.medeiros@biblioteca.com', '(84) 91111-1111', '111.111.111-11', 2018),
('José Carlos', 102, 'jose.carlos@biblioteca.com', '(84) 92222-2222', '222.222.222-22', 2025),
('Mariana Souza', 103, 'mariana.souza@biblioteca.com', '(84) 93333-3333', '333.333.333-33', 2022);

-- 5 emprestimos realizados
insert into emprestimo (id_aluno, id_livro, id_bibliotecario, data_emprestimo, data_prevista_devolucao, data_devolucao_efetiva, data_penalidade) values
(1, 1, 1, '2025-01-10', '2025-01-17', '2025-01-16', NULL),
(2, 2, 2, '2025-01-12', '2025-01-19', '2025-01-29', '2025-02-18'),
(3, 2, 3, '2025-03-15', '2025-03-22', NULL, NULL),
(1, 2, 1, '2025-02-16', '2025-02-23', NULL, NULL),
(4, 2, 2, '2025-04-18', '2025-04-25', NULL, NULL),

(6, 16, 3, '2025-04-20', '2025-04-27', NULL, NULL),
(7, 17, 1, '2025-02-21', '2025-02-28', '2025-02-28', NULL),
(8, 18, 2, '2025-05-22', '2025-05-29', NULL, NULL),
(9, 19, 3, '2025-02-23', '2025-03-02', NULL, NULL),
(10, 20, 3, '2025-01-24', '2025-01-31', '2025-01-31', NULL),

(1, 21, 3, '2025-02-25', '2025-03-04', '2025-03-09', '2025-03-19'),
(2, 22, 2, '2025-03-26', '2025-04-02', NULL, NULL),
(3, 23, 2, '2025-03-27', '2025-04-03', '2025-04-03', NULL),
(4, 24, 3, '2025-01-28', '2025-02-04', NULL, NULL),
(5, 22, 1, '2025-01-29', '2025-02-05', '2025-02-07', '2025-02-11'),

(6, 24, 3, '2025-01-30', '2025-02-06', NULL, NULL),
(7, 23, 2, '2025-01-31', '2025-02-07', '2025-02-07', NULL),
(8, 8, 1, '2025-02-01', '2025-02-08', NULL, NULL),
(9, 19, 2, '2025-02-02', '2025-02-09', '2025-02-12', '2025-02-18'),
(10, 10, 3, '2025-02-03', '2025-02-10', NULL, NULL),

(1, 3, 2, '2025-01-08', '2025-01-15', '2025-01-14', NULL),
(1, 7, 3, '2025-03-03', '2025-03-10', NULL, NULL),
(6, 7, 1, '2025-04-11', '2025-04-18', '2025-04-21', '2025-04-27'),
(8, 14, 2, '2025-02-19', '2025-02-26', NULL, NULL),
(4, 11, 3, '2025-05-04', '2025-05-11', '2025-05-11', NULL),

(6, 24, 1, '2025-01-22', '2025-01-29', '2025-02-02', '2025-02-10'),
(4, 15, 2, '2025-03-14', '2025-03-21', NULL, NULL),
(8, 15, 3, '2025-04-02', '2025-04-09', '2025-04-09', NULL),
(2, 15, 1, '2025-05-10', '2025-05-17', '2025-05-20', '2025-05-26'),
(10, 12, 2, '2025-02-06', '2025-02-13', NULL, NULL);




-- metodo para concultar os dias de penalidade. Que no caso não é uma coluna!
SELECT CASE WHEN data_devolucao_efetiva > data_prevista_devolucao 
    THEN DATEDIFF(data_devolucao_efetiva, data_prevista_devolucao) * 2
    ELSE 0 END AS penalidade
FROM emprestimo;









select * from livro;
select * from bibliotecario;
select * from aluno;

				-- Aparenetemente a tabela de emprestimo esta fora das 3FN --
# 1FN: penalidade depende de data_devolucao e data_devolucao_efetiva para existir
# 2FN: penalidade é algo que é calculado (consultado)
# 3FN: data_penalidade depende de data_devolucao_efetiva e data_devolucao_efetiva depende de data_prevista_devolucao

# 1 - Regra da unicidade do fato
#Definição: Cada atributo de uma tabela deve representar um único fato sobre a entidade.

#Justificativa: Essa regra existe para evitar que um mesmo dado seja interpretado de
# formas diferentes ou recalculado a partir de outros campos. Quando um atributo armazena
#informação derivada ou dependente de outros atributos, surgem inconsistências, pois a
#atualização de um campo pode não refletir corretamente nos demais.

# -> Em termos práticos, garante clareza semântica, consistência dos dados e facilidade de manutenção.

# 2 - Regra da aplicabilidade total
#Definição: Um atributo só deve existir em uma tabela se fizer sentido para todos os registros dessa tabela.

#Justificativa: A presença constante de valores nulos indica que aquele atributo não pertence naturalmente à entidade
#representada. Isso prejudica a integridade dos dados, dificulta consultas e aumenta a complexidade das regras de validação.

# -> Essa regra busca eliminar campos opcionais indevidos, deixando cada tabela responsável apenas pelos dados
#que realmente lhe dizem respeito.

# 3 - Regra da dependência direta
#Definição: Todo atributo não-chave deve depender diretamente e exclusivamente da chave primária, e não de outros atributos.

#Justificativa: Quando um atributo depende de outro campo não-chave, ocorre dependência transitiva,
#o que pode gerar redundância e inconsistência durante inserções, atualizações ou exclusões de dados.

# -> Essa regra garante integridade referencial, normalização adequada e evolução segura do modelo de dados.


-- "Solução"

#emprestimo (
#  id_emprestimo PK,
#  id_aluno FK,
#  id_livro FK,
#  id_bibliotecario FK,
#  data_emprestimo DATE,
#  data_prevista_devolucao DATE
#)

#penalidade (
#  id_penalidade PK,
#  id_emprestimo FK,
#  dias_atraso INT,
#  data_inicio DATE,
#  data_fim DATE
#)

#devolucao (
#  id_devolucao PK,
#  id_emprestimo FK UNIQUE,
#  data_devolucao DATE
#)

