--   consultas dos clientes   

-- 1° consulta | Buscar todos os gatos de um cliente em agosto de 2022
SELECT cli.nome AS CLIENTE, movi.valor AS VALOR, cat.tipo AS TIPO,
movi.data_movimentacao AS DATA_MOVIMENTACÃO
FROM contas con
INNER JOIN clientes cli ON cli.cpf = con.cpf_cliente
INNER JOIN movimentacoes_financeiras movi ON con.numero_conta = movi.codigo_conta
INNER JOIN categorias cat ON movi.categoria = cat.id_categoria
WHERE cat.tipo = 'DESPESA' 
AND cli.cpf = '48699712324' 
AND MONTH(movi.data_movimentacao) = 8 
AND YEAR(movi.data_movimentacao) = YEAR(current_date());

-- 2° consulta | Buscar todas as movimentações que tive do bradesco (código do banco 237), com a descrição da categoria
SELECT movi.codigo_banco AS CODIGO_BANCO, movi.data_movimentacao AS DATA_MOVIMENTAÇÃO,
movi.valor AS VALOR, cat.descricao AS DESCRIÇÃO
FROM movimentacoes_financeiras movi
INNER JOIN categorias cat ON  movi.categoria = cat.id_categoria 
INNER JOIN contas con ON movi.codigo_conta = con.numero_conta
INNER JOIN clientes cli ON con.cpf_cliente = cli.cpf
WHERE movi.codigo_banco = 237 AND con.cpf_cliente = '48699712324';

-- 3° consulta | Buscar todas as categorias que envolvam 'trabalho'
SELECT cat.descricao AS DESCRIÇÃO
FROM categorias cat
INNER JOIN clientes cli ON cli.cpf = cat.cpf_cliente
WHERE cli.cpf = '48699712324' AND cat.descricao LIKE '%trabalho%';

-- 4° consulta | Todas as movimentações do cliente que foram no priemiro semestre de 2022
SELECT cli.nome AS CLIENTE, movi.valor AS VALOR,
movi.data_movimentacao AS DATA_MOVIMENTACÃO
FROM contas con
INNER JOIN clientes cli ON cli.cpf = con.cpf_cliente
INNER JOIN movimentacoes_financeiras movi ON con.numero_conta = movi.codigo_conta
WHERE cli.cpf = '48699712324' 
AND movi.data_movimentacao BETWEEN '2022/01/01' AND '2022/06/30';

-- 5° consulta | Buscar as categorias (somente a descrição) que tiveram movimentação na primeira semana de setembro
SELECT TRIM(cat.descricao) AS DESCRIÇÃO
FROM movimentacoes_financeiras movi 
INNER JOIN categorias cat ON movi.categoria = cat.id_categoria
WHERE movi.data_movimentacao BETWEEN '2022/01/01' AND '2022/06/30' 
GROUP BY cat.descricao
ORDER BY cat.descricao ASC;

/* 6° consulta 
buscar a soma de todas as minhas despesa agrupadas por categoria (descrição),
que tiveram pelo menos 1000 reais de gasto, arredondando o valor para duas casas após a vírgula 
*/
SELECT SUM(ROUND(movi.valor, 2)) AS TOTAL, cat.descricao AS DESCRICAO
FROM  movimentacoes_financeiras movi
INNER JOIN categorias cat ON movi.categoria = cat.id_categoria
INNER JOIN contas con ON movi.codigo_conta = con.numero_conta
INNER JOIN clientes cli ON con.cpf_cliente = cli.cpf
WHERE cli.cpf = '48699712324' AND movi.valor >= 1000 and cat.tipo = 'DESPESA'
GROUP BY movi.categoria;

/* 7° consulta | buscar as últimas 5 receitas do cliente. */
SELECT cli.nome AS CLIENTE, movi.valor AS VALOR, cat.tipo AS TIPO,
movi.data_movimentacao AS DATA_MOVIMENTACÃO
FROM contas con
INNER JOIN clientes cli ON cli.cpf = con.cpf_cliente
INNER JOIN movimentacoes_financeiras movi ON con.numero_conta = movi.codigo_conta
INNER JOIN categorias cat ON movi.categoria = cat.id_categoria
WHERE cat.tipo = 'RECEITA' 
AND cli.cpf = '48699712324'
LIMIT 5;

-- 8° consulta | buscar o valor da maior movimentação dentro deste mês do cliente
SELECT cli.nome AS CLIENTE, MAX(movi.valor) AS VALOR, cat.tipo AS TIPO,
movi.data_movimentacao AS DATA_MOVIMENTACÃO
FROM contas con
INNER JOIN clientes cli ON cli.cpf = con.cpf_cliente
INNER JOIN movimentacoes_financeiras movi ON con.numero_conta = movi.codigo_conta
INNER JOIN categorias cat ON movi.categoria = cat.id_categoria
WHERE cli.cpf = '48699712324';

-- 9° consulta | buscar o nome da categoria mais movimentada, por mês, no ano de 2020
SELECT MONTHNAME(movi.data_movimentacao) AS MES, cat.descricao DESCRICÃO,
MAX(movi.valor) AS TOTAL
FROM contas con
INNER JOIN movimentacoes_financeiras movi ON con.numero_conta = movi.codigo_conta
INNER JOIN categorias cat ON movi.categoria = cat.id_categoria
INNER JOIN clientes cli ON cli.cpf = con.cpf_cliente
WHERE cli.cpf = '48699712324'
GROUP BY MONTH(movi.data_movimentacao)
ORDER BY MONTH(movi.data_movimentacao);

-- 10° consulta |  Saldo das contas do cliente.
SELECT cli.nome AS CLIENTE, 
CASE 
	WHEN con.codigo_banco = "001" THEN "BANCO DO BRASIL"
	WHEN con.codigo_banco = "033" THEN "BANCO SANTANDER"
    WHEN con.codigo_banco = "237" THEN "BRADESCO"
END AS BANCO,
con.numero_conta AS NUMERO_CONTA,
con.saldo AS SALDO
FROM contas con
INNER JOIN clientes cli ON cli.cpf = con.cpf_cliente
WHERE cli.cpf = '73741591378';9);