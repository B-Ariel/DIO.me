-- drop database ecommerce;
-- criação do banco de dados para o cenário de e-commerce
-- CREATE DATABASE ecommerce;
USE ecommerce;

-- criar tabela produto
# Size = Dimensão do produto
CREATE TABLE products(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(255),
    Classification_kids BOOL,
    Category ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
    Evaluation FLOAT DEFAULT 0,
    Size VARCHAR(10)
);

-- criar tabela pedido
CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
	idOrdersClientPF INT,
    idOrdersClientPJ INT,
	ordersStatus ENUM('Cancelado','Confirmado','Em Processamento') DEFAULT 'Em Processamento',
	ordersDescription VARCHAR(255),
	idOrdersPayment INT,
    -- Atributos de rastreio da Entrega --
	estimatedDelivery DATE,
    deliveryDate DATETIME,
    trackingCode VARCHAR(50),
    deliveryStatus ENUM('Em Transporte', 'Entregue', 'Cancelado', 'Aguardando Envio') DEFAULT 'Aguardando Envio',
	CONSTRAINT fk_Orders_ClientPF FOREIGN KEY (idOrdersClientPF) REFERENCES clientsPF(idClientPF)
		ON UPDATE CASCADE,
	CONSTRAINT fk_Orders_ClientPJ FOREIGN KEY (idOrdersClientPJ) REFERENCES clientsPJ(idClientPJ)
		ON UPDATE CASCADE,
	CONSTRAINT fk_Orders_Payment FOREIGN KEY (idOrdersPayment) REFERENCES payments(idPayment)
		ON UPDATE CASCADE
);

-- criar tabela estoque
CREATE TABLE productStorage(
	idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
	storageLocation VARCHAR(255),
	Quantity INT DEFAULT 0
);

-- criar tabela fornecedor
CREATE TABLE suppliers(
idSupplier INT AUTO_INCREMENT PRIMARY KEY,
socialName VARCHAR(255) NOT NULL,
Cnpj CHAR(14) NOT NULL,
Contact CHAR(11) NOT NULL,
CONSTRAINT unique_Supplier UNIQUE (Cnpj)
);

-- criar tabela vendedor
CREATE TABLE sellers(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
	socialName VARCHAR(255) NOT NULL,
	abstName varchar(255),
	Cnpj CHAR(14),
	Cpf CHAR(11),
	Contact CHAR(11) NOT NULL,
	idSAddress INT,
    CONSTRAINT fk_Sellers_Address FOREIGN KEY (idSAddress) REFERENCES address(idAddress),
	CONSTRAINT unique_Cnpj_Seller UNIQUE (Cnpj),
	CONSTRAINT unique_Cpf_Seller UNIQUE (Cpf)
);

-- Produtos Relacionado ao Vendedor
CREATE TABLE productsSeller(
	idPseller INT,
	idProduct INT,
	prodQuantity INT DEFAULT 1,
	PRIMARY KEY (idPseller, idProduct),
	CONSTRAINT fk_Product_Seller FOREIGN KEY (idPseller) REFERENCES	sellers(idSeller),
	CONSTRAINT fk_Product_Product FOREIGN KEY (idProduct) REFERENCES products(idProduct)
);

--  Produtos Relacionado ao Pedido
CREATE TABLE productsOrder(
	idPOproduct INT,
	idPOorder INT,
	poQuantity INT DEFAULT 1,
	poStatus ENUM('Disponível','Sem Estoque') DEFAULT 'Disponível',
	PRIMARY KEY (idPOproduct, idPOorder),
	CONSTRAINT fk_ProductOrder_Product FOREIGN KEY (idPOproduct) REFERENCES products(idProduct),
	CONSTRAINT fk_ProductOrder_Order FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

--  Estoque Relacionado ao Produto
CREATE TABLE storageLocation(
	idlProduct INT,
	idlstorage INT,
	idSLAddress INT,
    CONSTRAINT fk_storageLocation_Address FOREIGN KEY (idSLAddress) REFERENCES address(idAddress),
	CONSTRAINT fk_Storage_Location_Product FOREIGN KEY (idlProduct) REFERENCES products(idProduct),
	CONSTRAINT fk_Storage_Location_Storage FOREIGN KEY (idlstorage) REFERENCES productStorage(idProdStorage),
	PRIMARY KEY (idlProduct, idlstorage)
);

-- Produto Relacionado ao Fornecedor
CREATE TABLE productsSupplier(
idPsSupplier INT,
idPsProduct INT,
Quantity INT NOT NULL,
PRIMARY KEY (idPsSupplier, idPsProduct),
CONSTRAINT fk_Product_Supplier_Supplier FOREIGN KEY (idPsSupplier) REFERENCES suppliers(idSupplier),
CONSTRAINT fk_Product_Supplier_Product FOREIGN KEY (idPsProduct) REFERENCES products(idProduct)
);

SHOW TABLES;
SHOW DATABASES;