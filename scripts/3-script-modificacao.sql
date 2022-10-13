USE financas;

/*
Adicionando uma descrição nas movimentações
Utilizando valor padrão para os dados já cadastrados
*/
ALTER TABLE movimentacoes_financeiras ADD descricao VARCHAR(25) NOT NULL DEFAULT 'Descrição não informada';

/*
Alterando as casas decimais do campo valor para 4
*/
ALTER TABLE movimentacoes_financeiras MODIFY COLUMN valor DECIMAL(15,4);

-- Adicionando na tabela categoria um campo para os seus tipos
ALTER TABLE categorias ADD tipo ENUM('DESPESA','RECEITA') NOT NULL DEFAULT 'DESPESA';

-- Adicionando um registro para a tabela categorias
INSERT INTO categorias (descricao, cpf_cliente, tipo)
VALUES 
('Salario', '35949128508', 'RECEITA'),
('freelancer', '48939456025', 'RECEITA');

INSERT INTO movimentacoes_financeiras (valor, data_movimentacao, codigo_banco, codigo_conta, categoria)
VALUES
('500', '2008-04-10', '237', '235378291', 8),
('1254', '2021-02-04', '237', '955211973', 9),
('2594', '2008-06-11', '237', '235378291', 8),
('2065', '2005-06-02', '237', '955211973', 9),
('1329', '2007-08-20', '237', '235378291', 8),
('3502', '2019-03-05', '237', '955211973', 9),
('1952', '2008-08-08', '237', '235378291', 8),
('1995', '2022-07-13', '237', '955211973', 9),
('5000', '2021-05-16', '237', '955211973', 9),
('7650', '2021-07-22', '237', '235378291', 8),
('80', '2021-09-12', '237', '955211973', 9);