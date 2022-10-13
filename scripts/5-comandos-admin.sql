--   consultas dos administradores

/* 
1° consulta admin 
Buscar o nome dos clientes, email, a cidade onde ele mora, que não tiveram nenhuma
movimentação dentro do mês atual
*/
SELECT distinct cli.nome AS NOME, cli.email AS EMAIL, ende.cidade
FROM clientes cli
INNER JOIN enderecos ende ON cli.cpf = ende.id_endereco
INNER JOIN contas con ON cli.cpf = con.cpf_cliente
INNER JOIN movimentacoes_financeiras movi ON con.numero_conta = movi.codigo_conta
WHERE month(movi.data_movimentacao) NOT IN (month(current_date()));

-- 2° consulta admin | buscar o nome e email dos clientes que mais tiveram a maior movimentação de receita do nosso sistema
SELECT cli.nome AS CLIENTE, cli.email AS EMAIL, max(mov.valor) AS MAIOR_VALOR
FROM clientes cli
INNER JOIN	contas con ON con.cpf_cliente = cli.cpf
INNER JOIN	movimentacoes_financeiras mov ON mov.codigo_conta = con.numero_conta
GROUP BY cli.nome
ORDER BY mov.valor DESC
LIMIT 5;

--  3° consulta admin | fazer uma busca que descubra em qual dia do mês ocorre a maior parte das movimentações
SELECT DAYOFMONTH(movi.data_movimentacao) AS DIA, COUNT(movi.id_movimentacao) AS QUANTIDADE
FROM movimentacoes_financeiras movi
GROUP BY DAYOFMONTH(movi.data_movimentacao)
LIMIT 1;

--  4° deletando cliente | Excluindo totalmente o cliente
-- Utilizei on delete cascade nas chaves estrangeiras
START TRANSACTION;

DELETE FROM clientes WHERE clientes.cpf = "48699712324";

COMMIT;
ROLLBACK

/*  
5° criando sistema de segurança | caso a movimentação financeira de algum cliente
seja 300% maior do que a maior movimentação já feita pelo cliente, impedir a movimentação 
*/

DELIMITER //
CREATE TRIGGER valida_movimentacao BEFORE INSERT ON movimentacoes_financeiras 
FOR EACH ROW BEGIN
	IF (SELECT COUNT(con.cpf_cliente) AS QUANTIDADE
		FROM  movimentacoes_financeiras movi
		INNER JOIN contas con ON con.numero_conta = movi.codigo_conta
		WHERE con.cpf_cliente = '48939456025') >= 10
        THEN
		IF(new.valor > ((SELECT MAX(movi.valor)
			FROM contas con
			INNER JOIN clientes cli ON cli.cpf = con.cpf_cliente
			INNER JOIN movimentacoes_financeiras movi ON con.numero_conta = movi.codigo_conta
			INNER JOIN categorias cat ON movi.categoria = cat.id_categoria
			WHERE con.cpf_cliente = '48939456025')*300)/100)
				THEN SIGNAL SQLSTATE '45000';
		END IF;
    END IF;
END//

-- Movimentação suspeita que será bloqueada
INSERT INTO movimentacoes_financeiras (valor, data_movimentacao, codigo_banco, codigo_conta, categoria)
VALUES
('95', '2022-08-10', '033', '992552435', 1);

-- Movimentação NÃO suspeita que será efetuada
INSERT INTO movimentacoes_financeiras (valor, data_movimentacao, codigo_banco, codigo_conta, categoria)
VALUES
('15', '2022-08-10', '033', '992552435', 1);
