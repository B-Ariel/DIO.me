-- Inserção de Dados e Queries
USE ecommerce;
SHOW TABLES;

-- suppliers (fornecedores --
INSERT INTO suppliers (socialName, Cnpj, Contact) VALUES
('Tech Solutions LTDA', '12345678000101', '11987654321'),
('Moda Fashion S/A', '98765432000109', '21987654321'),
('Brinquedos Alegria', '45678912000105', '31987654321'),
('Alimentos Saudáveis', '78912345000107', '41987654321'),
('Moveis Conforto', '32165498000103', '51987654321');

-- sellers (vendedores) --
INSERT INTO sellers (socialName, abstName, Cnpj, Cpf, Contact, idSAddress) VALUES
('Eletrônicos Rápidos', 'EletrônicosR', '11223344000155', NULL, '61987654321', 1),
('Roupas Chiques', 'RoupasC', NULL, '12345678901', '71987654321', 2),
('Brinquedos Kids', 'BrinquedosK', '22334455000166', NULL, '81987654321', 3),
('Mercado Verde', 'MercadoV', NULL, '98765432109', '91987654321', 4),
('Decoração & Cia', 'DecorCia', '33445566000177', NULL, '11976543210', 5);

-- products (produtos) --
INSERT INTO products (Pname, Classification_kids, Category, Evaluation, Size) VALUES
('Smartphone XYZ', 0, 'Eletrônico', 4.5, '15x7cm'),
('Camisa Polo', 0, 'Vestimenta', 4.8, 'M'),
('Boneca Fashion', 1, 'Brinquedos', 4.7, '30cm'),
('Chocolate Orgânico', 0, 'Alimentos', 4.6, '500g'),
('Cadeira de Escritório', 0, 'Móveis', 4.9, '80x50cm');

-- clientsPF (clientes pessoa física) --
INSERT INTO clientsPF (Cpf, fullName, dateBirth, Email, statusClient, idPFAddress) VALUES
('12345678900', 'Ana Silva', '1990-05-14', 'ana.silva@email.com', 'Ativo', 1),
('98765432100', 'Carlos Santos', '1985-09-23', 'carlos.santos@email.com', 'Ativo', 2),
('45678912300', 'Mariana Costa', '2000-02-18', 'mariana.costa@email.com', 'Ativo', 3),
('78912345600', 'José Oliveira', '1995-07-30', 'jose.oliveira@email.com', 'Ativo', 4),
('32165498700', 'Paula Ferreira', '1988-11-12', 'paula.ferreira@email.com', 'Ativo', 5);

-- clientsPJ (clientes pessoa jurídica) --
INSERT INTO clientsPJ (Cnpj, companyName, Email, openingDate, statusClient, idPJAddress) VALUES
('11223344000155', 'Empresa A Ltda', 'contato@empresaa.com', '2010-03-10', 'Ativo', 1),
('22334455000166', 'Negócios B S/A', 'contato@negociosb.com', '2015-07-21', 'Ativo', 2),
('33445566000177', 'Corporativo C', 'contato@corporativoc.com', '2018-12-05', 'Ativo', 3),
('44556677000188', 'Comércio D Eireli', 'contato@comercioe.com', '2020-04-15', 'Ativo', 4),
('55667788000199', 'Indústria F Ltda', 'contato@industriaf.com', '2012-09-08', 'Ativo', 5);

-- productStorage (estoque) --
INSERT INTO productStorage (storageLocation, Quantity) VALUES
('Galpão Norte', 100),
('Depósito Central', 150),
('Armazém Leste', 200),
('Estoque Sul', 120),
('Centro Logístico Oeste', 80);

-- payments (pagamentos) --
INSERT INTO payments (paymentAmount, typePayment) VALUES
(150.00, 'Cartão de Crédito'),
(50.00, 'Pix'),
(200.00, 'Boleto Bancário'),
(75.00, 'Cartão de Débito'),
(100.00, 'Transferência Bancária');

-- productsSeller (produtos por vendedor) --
INSERT INTO productsSeller (idPseller, idProduct, prodQuantity) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 5),
(4, 4, 30),
(5, 5, 2);

-- productsSupplier (produtos por fornecedor) --
INSERT INTO productsSupplier (idPsSupplier, idPsProduct, Quantity) VALUES
(1, 1, 500),
(2, 2, 1000),
(3, 3, 200),
(4, 4, 1500),
(5, 5, 100);

-- storageLocation (localização do estoque) --
INSERT INTO storageLocation (idlProduct, idlstorage, idSLAddress) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- orders (pedidos) --
INSERT INTO orders (idOrdersClientPF, idOrdersClientPJ, ordersDescription, idOrdersPayment, estimatedDelivery, deliveryDate, trackingCode, deliveryStatus) VALUES
(1, NULL, 'Pedido de smartphone', 1, '2024-12-10', '2024-12-12 10:00:00', 'BR123456789', 'Entregue'),
(2, NULL, 'Pedido de camiseta', 2, '2024-12-15', NULL, 'BR987654321', 'Em Transporte'),
(NULL, 1, 'Pedido de brinquedos', 3, '2024-12-20', NULL, 'BR567890123', 'Aguardando Envio'),
(4, NULL, 'Pedido de arroz', 4, '2024-12-25', NULL, 'BR345678901', 'Em Processamento'),
(5, NULL, 'Pedido de sofá', 5, '2024-12-30', NULL, 'BR789012345', 'Confirmado');

-- productsOrder (produtos por pedido) --
INSERT INTO productsOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
(1, 1, 1, 'Disponível'),
(2, 2, 2, 'Disponível'),
(3, 3, 1, 'Disponível'),
(4, 4, 3, 'Disponível'),
(5, 5, 1, 'Disponível');



-- consulta dos clientes PF --
SELECT c.idClientPF, c.fullName, COUNT(o.idOrder) AS Number_of_Orders
FROM clientsPF c
LEFT JOIN orders o ON c.idClientPF = o.idOrdersClientPF
GROUP BY c.idClientPF;

-- consulta dos clientes PJ --
SELECT c.idClientPJ, c.companyName, COUNT(o.idOrder) AS Number_of_Orders
FROM clientsPJ c
LEFT JOIN orders o ON c.idClientPJ = o.idOrdersClientPJ
GROUP BY c.idClientPJ;

-- consulta dos produtos, fornecedores e estoques --
SELECT 
    s.socialName AS Fornecedor,
    p.Pname AS Produto,
    ps.Quantity AS Quantidade_Fornecida,
    psr.storageLocation AS Local_Estoque,
    psr.Quantity AS Quantidade_Estoque
FROM suppliers s
JOIN productsSupplier ps ON s.idSupplier = ps.idPsSupplier
JOIN products p ON ps.idPsProduct = p.idProduct
JOIN storageLocation sl ON p.idProduct = sl.idlProduct
JOIN productStorage psr ON sl.idlstorage = psr.idProdStorage;

-- consulta dos pedidos e produtos --
SELECT o.idOrder, o.ordersDescription, c.fullName, p.Pname, po.poQuantity
FROM orders o
LEFT JOIN clientsPF c ON o.idOrdersClientPF = c.idClientPF
LEFT JOIN productsOrder po ON o.idOrder = po.idPOorder
LEFT JOIN products p ON po.idPOproduct = p.idProduct;
