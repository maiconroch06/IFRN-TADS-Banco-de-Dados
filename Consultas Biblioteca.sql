# 1 - Nome do aluno e título do livro emprestado
SELECT a.nome AS aluno, l.titulo AS livro
FROM emprestimo e
JOIN aluno a ON e.id_aluno = a.id_aluno
JOIN livro l ON e.id_livro = l.id_livro;

# 2 - Aluno, livro e data do empréstimo
SELECT a.nome, l.titulo, e.data_emprestimo
FROM emprestimo e
JOIN aluno a ON e.id_aluno = a.id_aluno
JOIN livro l ON e.id_livro = l.id_livro;

# 3 - Empréstimos que ainda não foram devolvidos
SELECT a.nome, l.titulo, e.data_prevista_devolucao
FROM emprestimo e
JOIN aluno a ON e.id_aluno = a.id_aluno
JOIN livro l ON e.id_livro = l.id_livro
WHERE e.data_devolucao_efetiva IS NULL;

# 4 - Empréstimos devolvidos com atraso
SELECT a.nome, l.titulo, e.data_prevista_devolucao, e.data_devolucao_efetiva
FROM emprestimo e
JOIN aluno a ON e.id_aluno = a.id_aluno
JOIN livro l ON e.id_livro = l.id_livro
WHERE e.data_devolucao_efetiva > e.data_prevista_devolucao;

# 5 - Empréstimos que geraram penalidade
SELECT a.nome, l.titulo, e.data_penalidade
FROM emprestimo e
JOIN aluno a ON e.id_aluno = a.id_aluno
JOIN livro l ON e.id_livro = l.id_livro
WHERE e.data_penalidade IS NOT NULL;

# 6 - Livros que nunca foram emprestados
SELECT l.titulo
FROM livro l
LEFT JOIN emprestimo e ON l.id_livro = e.id_livro
WHERE e.id_emprestimo IS NULL;

# 7 - Quantidade de empréstimos por aluno
SELECT a.nome, COUNT(e.id_emprestimo) AS total_emprestimos
FROM aluno a
LEFT JOIN emprestimo e ON a.id_aluno = e.id_aluno
GROUP BY a.nome;

# 8 - Alunos com mais de um empréstimo
SELECT a.nome, COUNT(e.id_emprestimo) AS total
FROM aluno a
JOIN emprestimo e ON a.id_aluno = e.id_aluno
GROUP BY a.nome
HAVING COUNT(e.id_emprestimo) > 1;

# 9 - Bibliotecário responsável por cada empréstimo
SELECT b.nome AS bibliotecario, a.nome AS aluno, l.titulo
FROM emprestimo e
JOIN bibliotecario b ON e.id_bibliotecario = b.id_bibliotecario
JOIN aluno a ON e.id_aluno = a.id_aluno
JOIN livro l ON e.id_livro = l.id_livro;

# 10 - Empréstimos realizados em 2025
SELECT a.nome, l.titulo, e.data_emprestimo
FROM emprestimo e
JOIN aluno a ON e.id_aluno = a.id_aluno
JOIN livro l ON e.id_livro = l.id_livro
WHERE YEAR(e.data_emprestimo) = 2025;

# 11 - Livros emprestados da categoria Programação (CDU 01)
SELECT l.titulo, a.nome
FROM emprestimo e
JOIN livro l ON e.id_livro = l.id_livro
JOIN aluno a ON e.id_aluno = a.id_aluno
WHERE l.CDU LIKE '01%';

# 12 - Total de empréstimos por bibliotecário
SELECT b.nome, COUNT(e.id_emprestimo) AS total_emprestimos
FROM bibliotecario b
LEFT JOIN emprestimo e ON b.id_bibliotecario = e.id_bibliotecario
GROUP BY b.nome;

# 13 - Alunos que nunca pegaram livros emprestados
SELECT a.nome
FROM aluno a
LEFT JOIN emprestimo e ON a.id_aluno = e.id_aluno
WHERE e.id_emprestimo IS NULL;

# 14 - Empréstimos feitos em fevereiro de 2025
SELECT a.nome, l.titulo, e.data_emprestimo
FROM emprestimo e
JOIN aluno a ON e.id_aluno = a.id_aluno
JOIN livro l ON e.id_livro = l.id_livro
WHERE MONTH(e.data_emprestimo) = 2
  AND YEAR(e.data_emprestimo) = 2025;

# 15 - Dias de atraso nos empréstimos devolvidos fora do prazo
SELECT a.nome, l.titulo,
DATEDIFF(e.data_devolucao_efetiva, e.data_prevista_devolucao) AS dias_atraso
FROM emprestimo e
JOIN aluno a ON e.id_aluno = a.id_aluno
JOIN livro l ON e.id_livro = l.id_livro
WHERE e.data_devolucao_efetiva > e.data_prevista_devolucao;

# 16 - Quantidades de pedidos por alunos
select a.nome, count(e.id_emprestimo) as total_emprestimo
from emprestimo e
join aluno a on e.id_aluno = a.id_aluno
group by a.nome;