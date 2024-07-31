
Exercício 1

CREATE TABLE categorias (
    categoria_id SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(50)
);


ALTER TABLE produtos
ADD COLUMN categoria_id INT REFERENCES categorias(categoria_id);


DROP TABLE categorias;


Exercício 2

INSERT INTO clientes (nome, cidade, idade)
VALUES ('Lucas Lima', 'Salvador', 29);


UPDATE clientes
SET cidade = 'Fortaleza'
WHERE cliente_id = 3;


DELETE FROM pedidos
WHERE valor < 150.00;


Exercício 3

SELECT * FROM clientes
WHERE cidade = 'São Paulo';

SELECT * FROM pedidos
ORDER BY data_pedido DESC;

SELECT * FROM clientes
WHERE idade BETWEEN 25 AND 35;

Exercício 4

SELECT * FROM clientes
WHERE nome LIKE 'A%';

SELECT cliente_id, SUM(valor) AS valor_total
FROM pedidos
GROUP BY cliente_id;

SELECT cidade, AVG(idade) AS idade_media
FROM clientes
GROUP BY cidade;

Exercício 5

SELECT pedidos.*, clientes.*
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.cliente_id;

SELECT clientes.*, pedidos.*
FROM clientes
LEFT JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id;

SELECT produtos.*, itens_pedidos.*
FROM produtos
RIGHT JOIN itens_pedidos ON produtos.produto_id = itens_pedidos.produto_id;

SELECT * FROM clientes
WHERE cidade = 'São Paulo'
UNION
SELECT * FROM clientes
WHERE cidade = 'Rio de Janeiro';

Exercício 6


SELECT clientes.*
FROM clientes
LEFT JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id
WHERE pedidos.cliente_id IS NULL;

SELECT *
FROM pedidos
ORDER BY valor DESC
LIMIT 1;

SELECT produto_id, SUM(quantidade) AS total_itens
FROM itens_pedidos
GROUP BY produto_id;

SELECT cliente_id, SUM(valor) AS soma_valores
FROM pedidos
GROUP BY cliente_id
HAVING COUNT(pedido_id) > 1;

Exercício 7

SELECT AVG(c.idade) AS idade_media
FROM clientes c
JOIN (
    SELECT cliente_id
    FROM pedidos
    GROUP BY cliente_id
    HAVING SUM(valor) > 300.00
) p ON c.cliente_id = p.cliente_id;


SELECT *
FROM produtos
WHERE produto_id IN (
    SELECT produto_id
    FROM itens_pedidos
    GROUP BY produto_id
    HAVING COUNT(*) > 1
);
