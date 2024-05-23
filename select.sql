SELECT
    com.id_compra AS 'Venda',
    cli.nome_cliente AS 'Cliente',
    #proc.id_compras_produto AS 'Produto Compra',
    #prod.produto AS 'Produto',
    #prod.preco_venda AS 'Preco',
    #proc.quantidade AS 'Quantidade',
    SUM(prod.preco_venda * proc.quantidade) AS 'Total',
    com.data_compra AS 'Data da Compra'
    FROM compras_produtos AS proc, produtos AS prod, compras AS com, clientes AS cli
    WHERE com.id_compra = proc.id_compra AND prod.id_produto = proc.id_produto AND cli.id_cliente = com.id_cliente
    GROUP BY com.id_compra;