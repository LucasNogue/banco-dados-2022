/*   consultas dos clientes   */

/* 1° consulta */
SELECT cli.nome AS CLIENTE, movi.valor AS VALOR,
movi.data_movimentacao AS DATA_MOVIMENTACÃO
FROM contas con
INNER JOIN clientes cli ON cli.cpf = con.cpf_cliente
INNER JOIN movimentacoes_financeiras movi ON con.numero_conta = movi.codigo_conta
WHERE cli.cpf = '48699712324' AND MONTH(movi.data_movimentacao) = 8;

/* 2° consulta */
SELECT movi.codigo_banco AS CODIGO_BANCO, movi.data_movimentacao AS DATA_MOVIMENTAÇÃO, movi.valor AS VALOR, cat.descricao AS DESCRIÇÃO
FROM movimentacoes_financeiras movi
INNER JOIN categorias cat ON  movi.categoria = cat.id_categoria 
WHERE movi.codigo_banco = 237;