CREATE DATABASE memorial_connect;
USE memorial_connect;

CREATE TABLE usuario (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf CHAR(14) NOT NULL,
endereco VARCHAR(50),
telefone CHAR(11)
);

CREATE TABLE finado(
id_finado INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
dta_nasc DATE,
dta_fal DATE
);

CREATE TABLE memorial_connect (
id_usuario INT PRIMARY KEY,
id_servicos_publicos INT, 
id_servicos_privados INT,
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE cemiterio_publico (
id_usuario INT PRIMARY KEY,
cnpj CHAR(14) NOT NULL, 
endereco VARCHAR(50),
id_servico_publico INT,
telefone VARCHAR(50),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

CREATE TABLE





