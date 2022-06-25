-- Cria o Banco de Dados
CREATE DATABASE filialA;

-- Seleciona o banco de dados
USE filialA;

-- cria a tabela vendas
create table if not exists vendas(
		nota_fiscal integer auto_increment,
        nome_vendedor varchar(30) not null,
        total float not null,
        constraint dados_pkey primary key (nota_fiscal));