USE financas;

/*Populando tabela de clientes*/
INSERT INTO clientes (nome, cpf, email, senha, data_nascimento, profissao, genero)
VALUES 
('Lucas da Silva Nogueira', '48699712324','lucas@gmail.com', '3523', '2003-05-24', 'Programador', 'M'),
('Marcos Henry dos Santos', '73741591378','marcos@gmail.com', '4652', '1999-07-15', 'Enfermeiro', 'M'),
('Stella Daniela Pires', '14931937322','stella@gmail.com', '98542', '2002-10-05', 'Advogada', 'F'),
('Vicente Noah Rodrigo Farias', '72645405290','vicente@gmail.com', '52135', '1980-07-15', 'Recrutador', 'M'),
('Renan Matheus Bernardes', '35949128508', 'renan@gmail.com','26423', '1982-01-06', 'Secretário', 'M'),
('Manuela Eliane Castro', '48939456025', 'manuela@gmail.com','82645', '1984-02-11', 'Programadora', 'F');

/*Populando tabela de endereços*/
INSERT INTO enderecos (id_endereco, cep, rua, numero, complemento, bairro, cidade, estado, pais)
VALUES 
('48699712324', '65076647', 'Rua Rio Balsas', '553', 'apt. 5', 'Ilhinha', 'São Vicente', 'SP', 'Brasil'),
('73741591378', '79017651', 'Rua Bertolino Cândido', '211', 'apt. 3', 'Nova Lima', 'Campo Grande', 'MS', 'Brasil'),
('14931937322', '65076647', 'Rua Catalão', '25', 'apt. 7', 'Jardim Santana', 'Porto Velho', 'RO', 'Brasil'),
('72645405290', '68901530', 'Avenida Eulálio Modesto de Oliveira', '859', 'Casa', 'Santa Inês', 'Macapá', 'AP', 'Brasil'),
('35949128508', '65608370', 'Rua Boa Vista', '741', 'apt. 8', 'Caldeirões', 'Caxias', 'MA', 'Brasil'),
('48939456025', '75143372', 'Viela Lisboa', '262', 'Casa', 'Vila Residencial Pedro Ludovico', 'Anápolis', 'GO', 'Brasil');


/*Populando tabela de contas*/
INSERT INTO contas (cpf_cliente, codigo_banco, numero_conta, agencia, apelido, saldo)
VALUES 
('48699712324', '237', '235378291', '2339', 'Conta principal', 2000),
('48699712324', '237', '955211973', '1495', 'Conta freelancer', 1500),
('73741591378', '033', '155962211', '5339', 'Conta principal', 5000),
('73741591378', '001', '726521159', '2817', 'Conta freelancer', 3000),
('14931937322', '033', '829673115', '1193', 'Primeira conta', 1564),
('14931937322', '001', '699822353', '3548', 'Segunda conta', 1065),
('72645405290', '033', '399239155', '2244', 'Conta familia', 9100),
('72645405290', '001', '411282132', '8594', 'Conta pessoal', 2050),
('35949128508', '033', '122924244', '2244', 'Conta trabalho', 7000),
('35949128508', '001', '652266921', '2394', 'Conta pessoal', 3170),
('48939456025', '033', '992552435', '2244', 'Conta famila', 2000),
('48939456025', '001', '793555111', '9214', 'Conta freelancer', 9000);

/*Populando tabela de categorias*/
INSERT INTO categorias (descricao, cpf_cliente)
VALUES 
('Estudos', '48699712324'),
('Gasolina para trabalho', '48699712324'),
('Trabalho'  , '48699712324'),
('Alimentação no trabalho', '48699712324'),
('Mercado', '73741591378'),
('Livros', '14931937322'),
('Viagem', '72645405290');

/*Populando tabela de movimentações financeiras*/
INSERT INTO movimentacoes_financeiras (valor, data_movimentacao, codigo_banco, codigo_conta, categoria)
VALUES
('200', '2022-08-10', '237', '235378291', 1),
('195', '2022-08-12', '237', '235378291', 1),
('235', '2022-08-13', '237', '235378291', 1),
('153', '2022-08-14', '237', '235378291', 1),
('120', '2022-08-15', '237', '235378291', 1),
('100', '2022-08-04', '237', '955211973', 2),
('2000', '2022-02-15', '237', '235378291', 3),
('150', '2022-04-10', '237', '955211973', 4),
('560', '2022-01-09', '237', '235378291', 3),
('203', '2022-05-20', '237', '955211973', 4),
('2500', '2020-05-10', '033', '155962211', 2),
('1030', '2020-02-14', '001', '726521159', 3),
('3900', '2020-03-20', '033', '829673115', 3),
('1030', '2020-02-14', '001', '699822353', 1),
('2520', '2020-04-20', '033', '399239155', 4),
('5000', '2021-05-10', '001', '411282132', 4),
('7200', '2019-04-20', '033', '122924244', 2),
('1513', '2020-11-10', '001', '652266921', 1),
('15', '2020-10-15', '033', '992552435', 3),
('15', '2017-10-03', '001', '793555111', 4),
('5', '2022-08-10', '033', '992552435', 1),
('10', '2022-08-10', '033', '992552435', 1),
('13', '2022-08-10', '033', '992552435', 1),
('6', '2022-08-10', '033', '992552435', 1),
('2', '2022-08-10', '033', '992552435', 1),
('1', '2022-08-10', '033', '992552435', 1),
('5', '2022-08-10', '033', '992552435', 1),
('6', '2022-08-10', '033', '992552435', 1),
('15', '2022-08-10', '033', '992552435', 1),
('19', '2022-08-10', '033', '992552435', 1),
('23', '2022-08-10', '033', '992552435', 1),
('30', '2022-08-10', '033', '992552435', 1);