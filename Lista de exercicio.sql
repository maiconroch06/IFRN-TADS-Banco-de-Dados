               -- Lista de Exercicio --
# 1. Liste os clientes com idade maior ou igual a 30.
select * from clientes
where idade >= 30;

# 2. Liste apenas o nome e a cidade dos clientes
select nome, idade from clientes;

# 3. Liste os pedidos com valor maior que 70.
select * from pedidos
where valor > 70;

# 4. Liste o nome do cliente e o valor do pedido (apenas pedidos com cliente válido).
select c.nome, p.valor
from clientes c join pedidos p
on c.id_cliente = p.id_cliente;

# 5. Liste o nome, idade e data do pedido.
select c.nome, c.idade, p.data_pedido
from clientes c join pedidos p
on c.id_cliente = p.id_cliente;

# 6. Liste os pedidos que não possuem cliente (id_cliente IS NULL).
select * from pedidos p
left join clientes c
on c.id_cliente = p.id_cliente
where p.id_cliente is null;

# tem mais simples mas n tão recomendada - select * from pedidos where id_cliente is null;

# 7. Liste todos os clientes, mesmo os que nunca fizeram pedido.
select * from clientes c
left join pedidos p
on c.id_cliente = p.id_cliente;

# ! 8. Liste os clientes que nunca fizeram pedido.
select c.* from clientes c
left join pedidos p
on c.id_cliente = p.id_cliente
where p.id_cliente is null;

# 9. Quantos clientes existem no total?
select count(*) from clientes;

# 10. Qual o valor total de todos os pedidos?
select sum(valor) from pedidos;

# 11. Qual o valor total gasto por cada cliente?
select c.nome, sum(valor) as valor_total
from clientes c join pedidos p
on c.id_cliente = p.id_cliente
group by c.nome;

# 12. Quantos pedidos foram feitos por clientes com idade entre 25 e 35?
select c.nome, c.idade, count(p.id_pedido) as total_pedidos
from clientes c left join pedidos p
on c.id_cliente = p.id_cliente
group by c.nome, c.idade
having c.idade between 25 and 35;

# 13. Qual o valor total dos pedidos feitos por clientes acima de 30 anos?
select c.nome, c.idade, sum(p.valor) as valor_total
from pedidos p left join clientes c
on p.id_cliente = c.id_cliente
group by c.nome, c.idade
having c.idade > 30;

# 14. Liste clientes cujo valor total gasto seja maior que 300.
select c.nome, sum(p.valor) as valor_total
from clientes c left join pedidos p
on c.id_cliente = p.id_cliente
group by c.nome, c.idade
having sum(p.valor) > 300;

# 15. Liste os clientes com idade acima da idade média.
select nome, idade
from clientes
where idade > (
	select avg(idade)
    from clientes
);

# 16. Liste os clientes que fizeram mais pedidos que a média de pedidos por cliente.
select c.nome, count(p.id_pedido) as total_pedidos
from clientes c join pedidos p
on c.id_cliente = p.id_cliente
group by c.nome
having total_pedidos > (
	select avg(pedido_por_cliente)
    from (
		select count(id_pedido) as pedido_por_cliente
        from pedidos
        group by id_cliente
    ) t
);