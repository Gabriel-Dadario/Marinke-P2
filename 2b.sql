-- b) Faça um código SQL que exiba todo os produtos que uma determinada mesa pediu/consumiu.
SELECT
    m.id_mesa AS "Mesa",
    GROUP_CONCAT(p.marca SEPARATOR ', ') AS "Produtos",
    SUM(ip.quantidade) AS "Quantidade_Total",
    SUM(p.preco_unitario * ip.quantidade) AS Valor_Total

FROM mesa m
INNER JOIN pedido pe ON m.id_pedido = pe.id_pedido
INNER JOIN item_pedido ip ON pe.id_pedido = ip.id_pedido
INNER JOIN produto p ON ip.id_produto = p.id_produto

WHERE m.id_mesa = 3
GROUP BY m.id_mesa;