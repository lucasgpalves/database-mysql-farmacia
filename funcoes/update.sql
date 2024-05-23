/* -- Caso não tenha um id 4 na tabela
INSERT INTO tipos_produto (tipos) VALUES ('Outros');

-- Caso queira usar outro método, pode inserir manualmente
SELECT * FROM tipos_produto; */
SELECT * FROM tipos_produto;

UPDATE tipos_produto SET tipos = "Bijouterias" WHERE id = 4;

SELECT * FROM produtos;

UPDATE produtos 
	SET preco_venda = '4.17', 
    id_tipos_produto = 1,
    id_fabricantes = 1 
    WHERE id = 2;
    
    
-- Desafio proposto    
SELECT cp.id_compras_produto AS 'Venda',
	cli.nome_cliente AS 'Cliente',
    p.produto AS 'Produto',
    cp.quantidade AS 'Quantidade'
	FROM compras_produtos AS cp,
    compras AS c,
    produtos as p,
    clientes AS cli
    WHERE cp.id_compra = c.id_compra AND cp.id_produto = p.id_produto AND c.id_cliente = cli.id_cliente;
    
UPDATE compras_produtos
	SET id_compra = 3,
    id_produto = 1,
    quantidade = 5
    WHERE id_compras_produto = 2;
