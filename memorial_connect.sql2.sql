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

CREATE TABLE cemiterio_privado (
id_usuario INT PRIMARY KEY,
cnpj INT(14) NOT NULL, 
endereco VARCHAR(50),
telefone CHAR(14),
id_servicos_privados INT,
FOREIGN KEY (id_usuario) REFERENCES cemiterio_publico(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado(id_finado)
);

CREATE TABLE ossario (
id_usuario INT PRIMARY KEY,
data_de_nasc_finado DATE,
data_de_falesc_finado DATE,
id_finado INT,
FOREIGN KEY (id_usuario) REFERENCES cemiterio_publico(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado(id_finado)
);

CREATE TABLE tumulos (
id_tumulo INT AUTO_INCREMENT PRIMARY KEY,
lote INT,
quadra VARCHAR(50),
id_usuario INT,
id_finado INT,
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado (id_finado)
);

CREATE TABLE urna (
id_usuario INT PRIMARY KEY,
id_finado INT,
tipos_de_sepultamento VARCHAR(50),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado(id_finado)
);

CREATE TABLE planos_funerarios (
id_usuario INT,
id_finado INT,
tipos_de_plano VARCHAR(50),
PRIMARY KEY (id_usuario, id_finado),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado(id_finado)
);

CREATE TABLE crematorio (
id_usuario INT PRIMARY KEY,
cnpj CHAR(14) NOT NULL,
endereco VARCHAR(50),
telefone CHAR(14),
id_finado INT,
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado(id_finado)
);

CREATE TABLE columbario (
id_usuario INT PRIMARY KEY,
id_finado INT,
id_localizacao INT,
fk_crematorio_id_usuario INT,
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado(id_finado),
FOREIGN KEY (fk_crematorio_id_usuario) REFERENCES crematorio(id_usuario)
);

CREATE TABLE recipiente_funerario (
id_usuario INT PRIMARY KEY,
id_finado INT,
tipos_recipiente VARCHAR(50),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado(id_finado)
);

CREATE TABLE cinzas_do_finado (
id_usuario INT PRIMARY KEY,
id_finado INT,
data_nascimento_finado DATE,
data_falecimento_finado DATE,
nome_finado VARCHAR(50),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado(id_finado)
);

CREATE TABLE serv_terceirizados (
id_servico INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT,
tipos_servicos VARCHAR(50),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE servicos (
id_usuario INT,
id_finado INT,
manutencao_geral VARCHAR(50),
translado VARCHAR(50),
transporte VARCHAR(50),
tanatopraxia VARCHAR(50),
PRIMARY KEY (id_usuario, id_finado),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado(id_finado)
);

CREATE TABLE produtos (
id_usuario INT,
id_finado INT,
lembrancas VARCHAR(50),
flores VARCHAR(50),
PRIMARY KEY (id_usuario, id_finado),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
FOREIGN KEY (id_finado) REFERENCES finado(id_finado)
);






