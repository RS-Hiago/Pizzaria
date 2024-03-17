-- Criação do banco de dados (Pizzaria)
CREATE DATABASE IF NOT EXISTS Pizzaria;
USE Pizzaria;

-- Criação das tabelas
CREATE TABLE Cliente (
    CPF CHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE Borda (
    id_borda INT PRIMARY KEY,
    tipo VARCHAR(100)
);

CREATE TABLE Massa (
    id_massa INT PRIMARY KEY,
    tipo VARCHAR(100)
);

CREATE TABLE Sabor (
    id_sabor INT PRIMARY KEY,
    Tipo VARCHAR(100)
);

CREATE TABLE Bebida (
    Bebida_ID INT PRIMARY KEY,
    nome VARCHAR(100),
    marca VARCHAR(100)
);

CREATE TABLE Fornada (
    Fornada_ID INT PRIMARY KEY AUTO_INCREMENT,
    hora TIME,
    data DATE
);

CREATE TABLE Pizza (
    Pizza_ID INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    Borda_ID INT,
    Massa_ID INT,
    Sabor_ID INT,
    Fornada_ID INT,
    FOREIGN KEY (Borda_ID) REFERENCES Borda(id_borda),
    FOREIGN KEY (Massa_ID) REFERENCES Massa(id_massa),
    FOREIGN KEY (Sabor_ID) REFERENCES Sabor(id_sabor),
    FOREIGN KEY (Fornada_ID) REFERENCES Fornada(Fornada_ID)
);

CREATE TABLE Valor (
    Valor_ID INT PRIMARY KEY,
    Bebida_ID INT,
    Pizza_ID INT,
    Precos DECIMAL(10, 2),
    FOREIGN KEY (Bebida_ID) REFERENCES Bebida(Bebida_ID),
    FOREIGN KEY (Pizza_ID) REFERENCES Pizza(Pizza_ID)
);

CREATE TABLE Pedido (
    Pedido_ID INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_CPF CHAR(11),
    Pizza_ID INT,
    Bebida_ID INT,
    Fornada_ID INT,
    data_hora DATETIME,
    valor_total DECIMAL(10, 2),
    Quant_bebidas INT,
    Quant_pizza INT,
    lista_pedidos TEXT,
    FOREIGN KEY (Cliente_CPF) REFERENCES Cliente(CPF),
    FOREIGN KEY (Pizza_ID) REFERENCES Pizza(Pizza_ID),
    FOREIGN KEY (Bebida_ID) REFERENCES Bebida(Bebida_ID),
    FOREIGN KEY (Fornada_ID) REFERENCES Fornada(Fornada_ID)
);