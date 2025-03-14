CREATE DATABASE oficina;
USE oficina;

CREATE TABLE Cliente(
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
	ClienteNome VARCHAR(255) NOT NULL,
	ClienteCpf CHAR(11) NOT NULL UNIQUE,
	ClienteTelefone CHAR(11) NOT NULL,
	ClienteEmail VARCHAR(255) NOT NULL,
-- endereço dividido --
	ClienteRua VARCHAR(255) NOT NULL,
	ClienteNumero VARCHAR(100) NOT NULL,
	ClienteBairro VARCHAR(255) NOT NULL,
	ClienteComplemento VARCHAR(255) NOT NULL,
	ClienteCidade VARCHAR(255) NOT NULL,
	ClienteEstado CHAR(2) NOT NULL
);

CREATE TABLE Veiculo(
	idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
	Placa CHAR(7) NOT NULL,
	Modelo VARCHAR(255) NOT NULL,
	Marca VARCHAR(255) NOT NULL,
	Ano VARCHAR(4) NOT NULL,
	Cor VARCHAR(255) NOT NULL,
	idVeiculoCliente INT,
	CONSTRAINT fk_Veiculo_Cliente FOREIGN KEY (idVeiculoCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Mecanico(
	idMecanico INT AUTO_INCREMENT PRIMARY KEY,
	MecanicoNome VARCHAR(255) NOT NULL,
	MecanicoCpf CHAR(11) NOT NULL UNIQUE,
	MecanicoTelefoneMec CHAR(11) NOT NULL,
	MecanicoEmail VARCHAR(255) NOT NULL,
	MecanicoEspecialidade VARCHAR(255),
	MecanicoTelefone CHAR(11),
-- endereço dividido --
	MecanicoRua VARCHAR(255) NOT NULL,
	MecanicoNumero VARCHAR(100) NOT NULL,
	MecanicoBairro VARCHAR(255) NOT NULL,
	MecanicoComplemento VARCHAR(255) NOT NULL,
	MecanicoCidade VARCHAR(255) NOT NULL,
	MecanicoEstado CHAR(2) NOT NULL
);

CREATE TABLE EquipeDeMecanico(
	idEquipeDeMecanico INT AUTO_INCREMENT PRIMARY KEY,
	NomeEquipe VARCHAR(255) NOT NULL,
	idEquipeMecanico INT,
	CONSTRAINT fk_EquipeDeMecanico_Mecanico FOREIGN KEY (idEquipeMecanico) REFERENCES Mecanico(idMecanico)
);

CREATE TABLE Servico(
	idServico INT AUTO_INCREMENT PRIMARY KEY,
	NomeDoServico VARCHAR(255) NOT NULL,
	Tipo ENUM('Revisão','Conserto'),
	Descricao VARCHAR(255) NOT NULL,
	DuracaoEstimada VARCHAR(100) NOT NULL
);

CREATE TABLE RegistroDePeca(
	idRegistroDePeca INT AUTO_INCREMENT PRIMARY KEY,
	NomeDaPeca VARCHAR(255) NOT NULL,
	Quantidade INT NOT NULL,
	PrecoUnitario REAL NOT NULL
);

CREATE TABLE ValorDeServico(
	idValorDeServico INT AUTO_INCREMENT PRIMARY KEY,
	MaoDeObra REAL NOT NULL,
	idValorServico INT,
	IdValorPeca INT,
	CONSTRAINT fk_ValorDeServico_Servico FOREIGN KEY (idValorServico) REFERENCES Servico(idServico),
	CONSTRAINT fk_ValorDeServico_RegistroDePeca FOREIGN KEY (IdValorPeca) REFERENCES RegistroDePeca(idRegistroDePeca)
);

CREATE TABLE OrdemDeServico(
	idValorDeServico INT AUTO_INCREMENT PRIMARY KEY,
	DataDeEmissao DATETIME NOT NULL,
	StatusDaOrdem BOOL NOT NULL,
	DataDeConclusao DATE NOT NULL,
	idOrdemCliente INT,
	idOrdemEquipeDeMecanico INT,
	idOrdemValorDeServico INT,
	CONSTRAINT fk_OrdemDeServico_Cliente FOREIGN KEY (idOrdemCliente) REFERENCES Cliente(idCliente),
	CONSTRAINT fk_OrdemDeServico_EquipeDeMecanico FOREIGN KEY (idOrdemEquipeDeMecanico) REFERENCES EquipeDeMecanico(idEquipeDeMecanico),
	CONSTRAINT fk_OrdemDeServico_ValorDeServico FOREIGN KEY (idOrdemValorDeServico) REFERENCES ValorDeServico(idValorDeServico)
);

-- COLOCANDO OS DADOS NO BD --

-- Cliente --
INSERT INTO Cliente (ClienteNome, ClienteCpf, ClienteTelefone, ClienteEmail, ClienteRua, ClienteNumero, ClienteBairro, ClienteComplemento, ClienteCidade, ClienteEstado)
VALUES
('João Silva', '12345678901', '11999999999', 'joao@gmail.com', 'Rua A', '123', 'Centro', 'Apto 101', 'São Paulo', 'SP'),
('Maria Oliveira', '98765432100', '11988888888', 'maria@gmail.com', 'Rua B', '456', 'Vila Nova', 'Casa 2', 'Rio de Janeiro', 'RJ'),
('Carlos Souza', '11122233344', '11977777777', 'carlos@gmail.com', 'Rua C', '789', 'Jardim', 'Bloco A', 'Belo Horizonte', 'MG'),
('Ana Lima', '55566677788', '11966666666', 'ana@gmail.com', 'Rua D', '321', 'Industrial', 'Sala 12', 'Curitiba', 'PR'),
('Pedro Santos', '99988877766', '11955555555', 'pedro@gmail.com', 'Rua E', '654', 'Residencial', 'Andar 3', 'Porto Alegre', 'RS');

-- Veiculo --
INSERT INTO Veiculo (Placa, Modelo, Marca, Ano, Cor, idVeiculoCliente)
VALUES
('ABC1234', 'Civic', 'Honda', '2020', 'Preto', 1),
('DEF5678', 'Corolla', 'Toyota', '2019', 'Branco', 2),
('GHI9101', 'Onix', 'Chevrolet', '2021', 'Vermelho', 3),
('JKL1121', 'Fiesta', 'Ford', '2018', 'Azul', 4),
('MNO1314', 'Golf', 'Volkswagen', '2017', 'Cinza', 5);

-- Mecanico --
INSERT INTO Mecanico (MecanicoNome, MecanicoCpf, MecanicoTelefoneMec, MecanicoEmail, MecanicoEspecialidade, MecanicoTelefone, MecanicoRua, MecanicoNumero, MecanicoBairro, MecanicoComplemento, MecanicoCidade, MecanicoEstado)
VALUES
('Lucas Ferreira', '11111111111', '11944444444', 'lucas@gmail.com', 'Suspensão', '11955555555', 'Rua F', '100', 'Oficinas', 'Sala 1', 'São Paulo', 'SP'),
('Ricardo Costa', '22222222222', '11933333333', 'ricardo@gmail.com', 'Freios', '11966666666', 'Rua G', '200', 'Automotivo', 'Sala 2', 'Rio de Janeiro', 'RJ'),
('Fernanda Melo', '33333333333', '11922222222', 'fernanda@gmail.com', 'Motor', '11977777777', 'Rua H', '300', 'Mecânica', 'Sala 3', 'Belo Horizonte', 'MG'),
('Ana Souza', '44444444444', '11911111111', 'ana.souza@gmail.com', 'Elétrica', '11988888888', 'Rua I', '400', 'Centro', 'Sala 4', 'Curitiba', 'PR'),
('Marcos Lima', '55555555555', '11900000000', 'marcos@gmail.com', 'Pintura', '11999999999', 'Rua J', '500', 'Industrial', 'Sala 5', 'Porto Alegre', 'RS');

-- Equipe De Mecanico --
INSERT INTO EquipeDeMecanico (NomeEquipe, idEquipeMecanico)
VALUES
('Equipe A', 1),
('Equipe B', 2),
('Equipe C', 3),
('Equipe D', 4),
('Equipe E', 5);

-- Servico --
INSERT INTO Servico (NomeDoServico, Tipo, Descricao, DuracaoEstimada)
VALUES
('Troca de Óleo', 'Revisão', 'Substituição de óleo e filtro', '1 hora'),
('Alinhamento', 'Revisão', 'Alinhamento da suspensão', '2 horas'),
('Reparo de Freio', 'Conserto', 'Troca de pastilhas e discos', '3 horas'),
('Diagnóstico Elétrico', 'Revisão', 'Verificação do sistema elétrico', '1 hora e 30 minutos'),
('Pintura', 'Conserto', 'Reparo de pintura e polimento', '4 horas');

-- Registro De Peça --
INSERT INTO RegistroDePeca (NomeDaPeca, Quantidade, PrecoUnitario)
VALUES
('Óleo 5W30', 10, 50.00),
('Filtro de Óleo', 20, 25.00),
('Pastilha de Freio', 15, 120.00),
('Bateria 60Ah', 5, 300.00),
('Tinta Automotiva', 8, 150.00);

-- Valor De Servico --
INSERT INTO ValorDeServico (MaoDeObra, idValorServico, IdValorPeca)
VALUES
(100.00, 1, 1),
(150.00, 2, 2),
(200.00, 3, 3),
(120.00, 4, 4),
(250.00, 5, 5);

-- Ordem De Servico --
INSERT INTO OrdemDeServico (DataDeEmissao, StatusDaOrdem, DataDeConclusao, idOrdemCliente, idOrdemEquipeDeMecanico, idOrdemValorDeServico)
VALUES
('2025-03-14 08:00:00', TRUE, '2025-03-15', 1, 1, 1),
('2025-03-13 09:30:00', FALSE, '2025-03-16', 2, 2, 2),
('2025-03-12 10:00:00', TRUE, '2025-03-14', 3, 3, 3),
('2025-03-11 11:00:00', TRUE, '2025-03-13', 4, 4, 4),
('2025-03-10 12:00:00', FALSE, '2025-03-12', 5, 5, 5);

show databases;
show tables;