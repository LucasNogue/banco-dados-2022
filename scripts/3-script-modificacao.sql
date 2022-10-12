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

/*
Adicionando na tabela categoria um campo para os seus tipos
*/
ALTER TABLE categorias ADD tipo ENUM('DESPESA','RECEITA') NOT NULL DEFAULT 'DESPESA';

/*
Adicionando um registro para a tabela categorias
*/
INSERT INTO categorias (descricao, cpf_cliente, tipo)
VALUES 
('Salario', '35949128508', 'RECEITA'),
('freelancer', '48939456025', 'RECEITA');