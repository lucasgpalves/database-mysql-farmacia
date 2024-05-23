USE geek;

INSERT INTO tipos_produto (tipos) 
	VALUES ("Remédios"), ("Cosméticos"), ("Diversos");	

INSERT INTO fabricantes (fabricante)
	VALUES ("Roche"), 
	("Vitalis"),
	("Palmolive");

INSERT INTO medicos (nome, crm)
	VALUES ("Alfredo Muniz", "123123SP"),
	("Fernanda Silva", "342342MG"),
	("Julieta Santana", "564564SC");

INSERT INTO clientes(nome_cliente, endereco, telefone, cep, localidade, cpf) 
	VALUES ("Felicity Jones", "Rua da Paz, 34", "(11) 2345-8899", '34.4567-098', 'Santos', '234.789.433-98'),
    ("Angeline Jolie", "Rua da Ipiranga, 456", "(21) 3214-8654", '71.5463-234', 'Rio de Janeiro', '785.532.123-42'),
    ("Ricardo Chavez", "Rua Certa, 289", "(21) 2561-6327", '51.4421-643', 'Planaltina', '952.525.234-51');

INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipos_produto, id_fabricantes) 
	VALUES ("Dipirona", "Dores em geral", "Metilpropileno", 12.44, 1, 1),
	("Sabonete", "Limpeza", "Sei lah", 3.56, 2, 2),
	("Protetor Solar", "Protetor Solar", "Soro de coco", 98.12, 2, 1);

INSERT INTO compras (id_cliente, data_compra) 
	VALUES (1, '2024-05-23'),
	(2, '2024-03-22'),
	(1, '2024-03-21');

INSERT INTO compras_produtos (id_compra, id_produto, quantidade) 
	VALUES (1, 1, 2),
    (1, 2, 3),
    (2, 3, 1);
    
INSERT INTO receitas_medica (id_compras_produto, id_medico, receita)
 VALUES (1, 1, 'receita1.pdf'),
 (3, 3, 'receita2.pdf');
