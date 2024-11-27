-- a) Faça um código SQL que exiba as vendas por: Nome do funcionário – deve exibir todas as mesas atendidas pelo
-- funcionário e o valor total gasto pelo cliente (3 colunas no resultado).

SELECT 
	f.nome AS "Nome Funcionário", 
	m.id_mesa AS "Mesa", 
	SUM(p.preco_unitario * ip.quantidade) AS valor_total
FROM Funcionario f

INNER JOIN mesa_funcionario AS mf ON mf.id_funcionario = f.id_funcionario
INNER JOIN Mesa AS m ON mf.id_mesa = m.id_mesa
INNER JOIN Pedido AS pe ON m.id_pedido = pe.id_pedido
INNER JOIN item_pedido AS ip ON ip.id_pedido = pe.id_pedido 
INNER JOIN Produto AS p ON p.id_produto = ip.id_produto

GROUP BY f.nome, m.id_mesa;