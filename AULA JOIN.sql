CREATE DATABASE aulajoin;
USE aulajoin;

DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    cidade VARCHAR(50)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    valor DECIMAL(10,2),
    data_pedido DATE
);

INSERT INTO clientes (id_cliente, nome, idade, cidade) VALUES
(1, 'Alice', 25, 'Natal'),
(2, 'Bruno', 32, 'Recife'),
(3, 'Camila', 28, 'SP'),
(4, 'Daniel', 40, 'BH'),
(5, 'Eduardo', 35, 'Natal'),
(6, 'Fernanda', 22, 'Recife'),
(7, 'Gabriel', 30, 'SP'),
(8, 'Helena', 27, 'BH'),
(9, 'Igor', 33, 'Natal'),
(10, 'Juliana', 29, 'Recife');


-- 100 pedidos com id_cliente válido (1 a 10 repetidos)
INSERT INTO pedidos (id_pedido, id_cliente, valor, data_pedido) VALUES
(1, 1, 120.50, '2024-01-01'),
(2, 2, 98.90, '2024-01-02'),
(3, 3, 12.00, '2024-01-03'),
(4, 4, 44.20, '2024-01-04'),
(5, 5, 200.99, '2024-01-05'),
(6, 6, 30.00, '2024-01-06'),
(7, 7, 77.77, '2024-01-07'),
(8, 8, 90.20, '2024-01-08'),
(9, 9, 15.10, '2024-01-09'),
(10, 10, 50.00, '2024-01-10'),
(11, 1, 60.00, '2024-01-11'),
(12, 2, 70.00, '2024-01-12'),
(13, 3, 80.00, '2024-01-13'),
(14, 4, 90.00, '2024-01-14'),
(15, 5, 100.00, '2024-01-15'),
(16, 6, 110.00, '2024-01-16'),
(17, 7, 120.00, '2024-01-17'),
(18, 8, 130.00, '2024-01-18'),
(19, 9, 140.00, '2024-01-19'),
(20, 10, 150.00, '2024-01-20'),
(21, 1, 22.22, '2024-01-21'),
(22, 2, 33.33, '2024-01-22'),
(23, 3, 44.44, '2024-01-23'),
(24, 4, 55.55, '2024-01-24'),
(25, 5, 66.66, '2024-01-25'),
(26, 6, 77.77, '2024-01-26'),
(27, 7, 88.88, '2024-01-27'),
(28, 8, 99.99, '2024-01-28'),
(29, 9, 11.11, '2024-01-29'),
(30, 10, 22.22, '2024-01-30'),
(31, 1, 33.33, '2024-01-31'),
(32, 2, 44.44, '2024-02-01'),
(33, 3, 55.55, '2024-02-02'),
(34, 4, 66.66, '2024-02-03'),
(35, 5, 77.77, '2024-02-04'),
(36, 6, 88.88, '2024-02-05'),
(37, 7, 99.99, '2024-02-06'),
(38, 8, 11.11, '2024-02-07'),
(39, 9, 22.22, '2024-02-08'),
(40, 10, 33.33, '2024-02-09'),
(41, 1, 44.44, '2024-02-10'),
(42, 2, 55.55, '2024-02-11'),
(43, 3, 66.66, '2024-02-12'),
(44, 4, 77.77, '2024-02-13'),
(45, 5, 88.88, '2024-02-14'),
(46, 6, 99.99, '2024-02-15'),
(47, 7, 11.11, '2024-02-16'),
(48, 8, 22.22, '2024-02-17'),
(49, 9, 33.33, '2024-02-18'),
(50, 10, 44.44, '2024-02-19'),
(51, 1, 55.55, '2024-02-20'),
(52, 2, 66.66, '2024-02-21'),
(53, 3, 77.77, '2024-02-22'),
(54, 4, 88.88, '2024-02-23'),
(55, 5, 99.99, '2024-02-24'),
(56, 6, 11.11, '2024-02-25'),
(57, 7, 22.22, '2024-02-26'),
(58, 8, 33.33, '2024-02-27'),
(59, 9, 44.44, '2024-02-28'),
(60, 10, 55.55, '2024-02-29'),
(61, 1, 66.66, '2024-03-01'),
(62, 2, 77.77, '2024-03-02'),
(63, 3, 88.88, '2024-03-03'),
(64, 4, 99.99, '2024-03-04'),
(65, 5, 11.11, '2024-03-05'),
(66, 6, 22.22, '2024-03-06'),
(67, 7, 33.33, '2024-03-07'),
(68, 8, 44.44, '2024-03-08'),
(69, 9, 55.55, '2024-03-09'),
(70, 10, 66.66, '2024-03-10'),
(71, 1, 77.77, '2024-03-11'),
(72, 2, 88.88, '2024-03-12'),
(73, 3, 99.99, '2024-03-13'),
(74, 4, 11.11, '2024-03-14'),
(75, 5, 22.22, '2024-03-15'),
(76, 6, 33.33, '2024-03-16'),
(77, 7, 44.44, '2024-03-17'),
(78, 8, 55.55, '2024-03-18'),
(79, 9, 66.66, '2024-03-19'),
(80, 10, 77.77, '2024-03-20'),
(81, 1, 88.88, '2024-03-21'),
(82, 2, 99.99, '2024-03-22'),
(83, 3, 11.11, '2024-03-23'),
(84, 4, 22.22, '2024-03-24'),
(85, 5, 33.33, '2024-03-25'),
(86, 6, 44.44, '2024-03-26'),
(87, 7, 55.55, '2024-03-27'),
(88, 8, 66.66, '2024-03-28'),
(89, 9, 77.77, '2024-03-29'),
(90, 10, 88.88, '2024-03-30'),
(91, 1, 99.99, '2024-03-31'),
(92, 2, 11.11, '2024-04-01'),
(93, 3, 22.22, '2024-04-02'),
(94, 4, 33.33, '2024-04-03'),
(95, 5, 44.44, '2024-04-04'),
(96, 6, 55.55, '2024-04-05'),
(97, 7, 66.66, '2024-04-06'),
(98, 8, 77.77, '2024-04-07'),
(99, 9, 88.88, '2024-04-08'),
(100, 10, 99.99, '2024-04-09');



-- 30 pedidos com cliente NULL
INSERT INTO pedidos (id_pedido, id_cliente, valor, data_pedido) VALUES
(101, NULL, 50.50, '2024-02-01'),
(102, NULL, 60.60, '2024-02-02'),
(103, NULL, 70.70, '2024-02-03'),
(104, NULL, 80.80, '2024-02-04'),
(105, NULL, 90.90, '2024-02-05'),
(106, NULL, 10.10, '2024-02-06'),
(107, NULL, 20.20, '2024-02-07'),
(108, NULL, 30.30, '2024-02-08'),
(109, NULL, 40.40, '2024-02-09'),
(110, NULL, 50.50, '2024-02-10'),
(111, NULL, 60.60, '2024-02-11'),
(112, NULL, 70.70, '2024-02-12'),
(113, NULL, 80.80, '2024-02-13'),
(114, NULL, 90.90, '2024-02-14'),
(115, NULL, 10.10, '2024-02-15'),
(116, NULL, 20.20, '2024-02-16'),
(117, NULL, 30.30, '2024-02-17'),
(118, NULL, 40.40, '2024-02-18'),
(119, NULL, 50.50, '2024-02-19'),
(120, NULL, 60.60, '2024-02-20'),
(121, NULL, 70.70, '2024-02-21'),
(122, NULL, 80.80, '2024-02-22'),
(123, NULL, 90.90, '2024-02-23'),
(124, NULL, 10.10, '2024-02-24'),
(125, NULL, 20.20, '2024-02-25'),
(126, NULL, 30.30, '2024-02-26'),
(127, NULL, 40.40, '2024-02-27'),
(128, NULL, 50.50, '2024-02-28'),
(129, NULL, 60.60, '2024-02-29'),
(130, NULL, 70.70, '2024-03-01');

-- 20 pedidos com id_cliente inválido (101 a 120)
INSERT INTO pedidos (id_pedido, id_cliente, valor, data_pedido) VALUES
(131, 101, 11.11, '2024-03-02'),
(132, 102, 22.22, '2024-03-03'),
(133, 103, 33.33, '2024-03-04'),
(134, 104, 44.44, '2024-03-05'),
(135, 105, 55.55, '2024-03-06'),
(136, 106, 66.66, '2024-03-07'),
(137, 107, 77.77, '2024-03-08'),
(138, 108, 88.88, '2024-03-09'),
(139, 109, 99.99, '2024-03-10'),
(140, 110, 10.10, '2024-03-11'),
(141, 111, 20.20, '2024-03-12'),
(142, 112, 30.30, '2024-03-13'),
(143, 113, 40.40, '2024-03-14'),
(144, 114, 50.50, '2024-03-15'),
(145, 115, 60.60, '2024-03-16'),
(146, 116, 70.70, '2024-03-17'),
(147, 117, 80.80, '2024-03-18'),
(148, 118, 90.90, '2024-03-19'),
(149, 119, 11.11, '2024-03-20'),
(150, 120, 22.22, '2024-03-21');


INSERT INTO clientes (id_cliente, nome, idade, cidade) VALUES
(20, 'Karen', 26, 'Natal'),
(21, 'Leandro', 31, 'Recife'),
(22, 'Mariana', 29, 'SP'),
(23, 'Nelson', 35, 'BH'),
(24, 'Olivia', 27, 'Natal'),
(25, 'Paulo', 33, 'Recife'),
(26, 'Quintina', 24, 'SP'),
(27, 'Rafael', 38, 'BH'),
(28, 'Sofia', 30, 'Natal'),
(29, 'Tiago', 32, 'Recife'),
(30, 'Vanessa', 28, 'SP');

SELECT * FROM clientes;

SELECT * FROM pedidos;

-- Isso aqui traz o que tem em A e o que tem em B. A união entre os conjuntos
SELECT * FROM
clientes c INNER JOIN -- Apelidando tabela 
PEDIDOS p ON
c.id_cliente = p.id_cliente;
# Todo cliente que tem um pedido é exibido

SELECT c.id_cliente FROM
clientes c INNER JOIN -- Apelidando tabela 
PEDIDOS p ON
c.id_cliente = p.id_cliente;
# Todo cliente e não necessariamente que tenha um pedido aparece.

-- left join
SELECT * FROM
clientes c LEFT JOIN -- O left pega a interceção, porém, também pega os valores do conjunto de A.
PEDIDOS p ON
c.id_cliente = p.id_cliente;
# Todo cliente e não necessariamente que tenha um pedido registrado aparece.

-- RIGHT join
SELECT * FROM
clientes c RIGHT JOIN -- O right pega a interceção, porém, também pega os valores do conjunto de B.
PEDIDOS p ON
c.id_cliente = p.id_cliente;
# Todo pedido e não necessariamente que tenha um cliente registrado aparece.



-- Somente oq tem em A sem interceção
SELECT * FROM
clientes c LEFT JOIN
PEDIDOS p ON
c.id_cliente = p.id_cliente
where p.id_pedido is null;
# Exibe somente os valores vazios em na tabela pedidos onde o id_pedido é vazio.

SELECT * FROM
clientes c RIGHT JOIN
PEDIDOS p ON
c.id_cliente = p.id_cliente
where c.nome is null;


#Função de contador? select COUNT(*) AS total_clientes_acima_25
#select SUM(p.valor) as spma_pedido_30

#exercicio de exibir idades apenas com duas pessoas a mais
SELECT idade, count(*) as total
From clientes
group by idade
having count(*) > 1;
#whare n vai funcionar pq trabalha com linhas, o having é a melhor solução pois filtra os dados em grupo

#exercicio de exibir idades apenas com duas pessoas a mais que a idade seja acima de 30 anos
SELECT idade, count(*) as total
From clientes
where idade > 30
group by idade
having count(*) > 1;

#exercicio para exibir idades de quem tem idade acima media da media de todos
SELECT nome, idade
From clientes
where idade > (
	select avg(idade)
    from clientes
);

#Exercicio - Clientes que gastaram mais que a media dos clientes - tentativa
SELECT * FROM
clientes c INNER JOIN
PEDIDOS p ON
c.id_cliente = p.id_cliente
where p.valor > (
	select avg(idade)
    from clientes
);
 #resposta do prof
Select cliente.nome, SUM(pedidos.valor) as total_gasto
from clientes c join pedidos p on
c.id_cliente, c.nome
having total_gasto > (
	select avg(valor)
    from pedidos
);

# Qual o valor total de todos os pedidos?
Select SUM(p.valor) From pedidos p;

# Qual o valor medio de todos os pedidos?
Select avg(p.valor) from pedidos p;

# Qual o valor total de todos os pedidos na qual existe clientes validos?
Select sum(p.valor) From clientes c join pedidos p on c.id_cliente = p.id_cliente;

# Liste apenas os clientes que fizeram mais de 5 pedidos
Select c.id_cliente, c.nome, count(*) as cont_pedidos From
clientes c join pedidos p on
c.id_cliente = p.id_cliente
group by c.id_cliente, c.nome
having cont_pedidos > 5;
