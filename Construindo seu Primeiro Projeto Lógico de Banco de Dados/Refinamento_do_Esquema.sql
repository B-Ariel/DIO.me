-- Refinação do banco de dados para o cenário de e-commerce
USE ecommerce;

-- Cria tabela endereço --
-- Endereço dividido --
CREATE TABLE address(
	idAddress INT AUTO_INCREMENT PRIMARY KEY,
    addressStreet VARCHAR(255) NOT NULL,
    addressNumber VARCHAR(10) NOT NULL,
    addressComplement VARCHAR(100) NOT NULL,
    addressNeighborhood VARCHAR(100) NOT NULL,
    addressCity VARCHAR(100) NOT NULL,
    addressState ENUM('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE') DEFAULT 'RJ' NOT NULL,
    Cep CHAR(8) NOT NULL
);

-- criar tabela cliente para PF
CREATE TABLE clientsPF(
	idClientPF INT AUTO_INCREMENT PRIMARY KEY,
	Cpf CHAR(11) NOT NULL,
    fullName VARCHAR(255) NOT NULL,
    dateBirth DATE NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    statusClient ENUM('Ativo','Inativo','Bloqueado') DEFAULT 'Ativo',
	idPFAddress INT,
    CONSTRAINT fk_clientsPF_Address FOREIGN KEY (idPFAddress) REFERENCES address(idAddress),
    CONSTRAINT unique_Cpf_Client UNIQUE (Cpf)
);

-- criar tabela cliente para PJ
CREATE TABLE clientsPJ(
	idClientPJ INT AUTO_INCREMENT PRIMARY KEY,
    Cnpj CHAR(14) NOT NULL,
    companyName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    openingDate DATE NOT NULL,
    statusClient ENUM('Ativo','Inativo','Bloqueado') DEFAULT 'Ativo',
	idPJAddress INT,
    CONSTRAINT fk_clientsPJ_Address FOREIGN KEY (idPJAddress) REFERENCES address(idAddress),
    CONSTRAINT unique_Cnpj_Client UNIQUE (Cnpj)
);

-- criar tabela pagamento
CREATE TABLE payments(
	idPayment INT AUTO_INCREMENT,
    paymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    paymentAmount FLOAT NOT NULL,
	typePayment ENUM('Dinheiro','Cartão de Crédito','Cartão de Débito','Pix','Transferência Bancária','Carteira Digital','Boleto Bancário'),
	PRIMARY KEY(idPayment)
);