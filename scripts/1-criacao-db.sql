CREATE SCHEMA IF NOT EXISTS financas;

USE financas;

/*Criando a tabela cliente e sua chave primária*/
CREATE TABLE clientes (
nome VARCHAR(50) NOT NULL,
cpf VARCHAR(11) NOT NULL,
email VARCHAR(35) NOT NULL,
senha VARCHAR(30) NOT NULL,
data_nascimento DATE,
profissao VARCHAR(25),
genero CHAR(1),
PRIMARY KEY (`cpf`));


/*Criando a tabela enderecos e suas chaves primárias e estrangeiras*/

CREATE TABLE enderecos (
id_endereco VARCHAR(11) NOT NULL,
cep VARCHAR(8),
rua VARCHAR(35) NOT NULL,
numero INT NOT NULL,
complemento VARCHAR(35),
bairro VARCHAR(35) NOT NULL,
cidade VARCHAR(35) NOT NULL,
estado VARCHAR(2) NOT NULL,
pais VARCHAR(35) NOT NULL,
PRIMARY KEY (id_endereco));

ALTER TABLE enderecos ADD CONSTRAINT FK_ENDERECO
FOREIGN KEY (id_endereco) REFERENCES clientes (cpf) ON DELETE CASCADE;


/*Criando a tabela contas e suas chaves primárias e estrangeiras*/
CREATE TABLE contas (
cpf_cliente VARCHAR(11) NOT NULL,
codigo_banco VARCHAR(3) NOT NULL,
numero_conta VARCHAR(9) NOT NULL,
agencia VARCHAR(4) NOT NULL,
apelido VARCHAR(20) NOT NULL,
saldo DECIMAL(15,2),
PRIMARY KEY (codigo_banco, numero_conta));

ALTER TABLE contas ADD CONSTRAINT FK_CONTAS
FOREIGN KEY (cpf_cliente) REFERENCES clientes (cpf) ON DELETE CASCADE;


/*Criando a tabela categorias e suas chaves primárias e estrangeiras*/
CREATE TABLE categorias (
id_categoria BIGINT AUTO_INCREMENT,
descricao VARCHAR(25) NOT NULL,
cpf_cliente VARCHAR(11) NOT NULL,
PRIMARY KEY (id_categoria, descricao));

ALTER TABLE categorias
ADD CONSTRAINT FK_CATEGORIA
FOREIGN KEY (cpf_cliente) REFERENCES contas (cpf_cliente) ON DELETE CASCADE;


/*Criando a tabela movimentacoes financeiras e suas chaves primárias e estrangeiras*/
CREATE TABLE movimentacoes_financeiras (
id_movimentacao INT AUTO_INCREMENT,
valor decimal(15,2) NOT NULL,
data_movimentacao date NOT NULL,
codigo_banco VARCHAR(3) NOT NULL,
codigo_conta VARCHAR(9) NOT NULL,
categoria BIGINT NOT NULL,
PRIMARY KEY (id_movimentacao));

ALTER TABLE movimentacoes_financeiras 
ADD CONSTRAINT FK_MOVIMENTACOES_FINANCEIRAS_CONTA
FOREIGN KEY (codigo_banco, codigo_conta) REFERENCES contas (codigo_banco, numero_conta) ON DELETE CASCADE,
ADD CONSTRAINT FK_MOVIMENTACOES_FINANCEIRAS_CATEGORIAS
FOREIGN KEY (categoria) REFERENCES categorias (id_categoria) ON DELETE CASCADE;