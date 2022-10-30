<div align="center">
  <h1>DESAFIO BANCO DE DADOS<br> MOVIMENTO CODAR 💙</h1>
  <p>Desafio realizado com o objetivo de praticar o conteúdo de banco de dados e SQL</p>
</div>

## DESCRIÇÃO

O desafio consiste no desenvolvimento de um modelo de banco de dados para um software de finanças.
Verifique a descrição completa do desafio: [Desafio Banco de Dados e SQL](https://github.com/movimentocodar/banco-dados-2022)



## 🛠️ Tecnologias e ferramentas utilizadas

- SQL
- Workbench

## ⚙️ Respostas de alguns questionamentos do desafio

### 1 - Entendemos que agora é necessário adicionar uma descrição a uma movimentação, e essa descrição será obrigatória. ps: E se já tivermos dados inseridos, precisamos ter algum cuidado?

Sim, é necessário cuidado quando inserir um novo campo depois de já ter dados na tabela, uma possível
solução é criar um valor padrão para evitar campos com NULL.

### 2 - Percebemos que precisamos ter mais precisão no valor da movimentação financeira. Agora queremos ter 4 casas após a vírgula. ps: Extra: E se fossemos diminuir a precisão, digamos de 6 casas decimais para 4, podemos reduzir a precisão? Se sim, como?

É possível reduzir a precisão utilizando a função `DEC()`, mas devemos analizar se realmente é necessário fazer isso, porque informações podem ser perdidas e erros podem ocorrer.
