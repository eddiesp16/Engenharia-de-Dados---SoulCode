create database projeto_final; #Crição do banco de dados
use projeto_final; #Selecão do banco
create table if not exists despesas( #Criação da tabela despesas
	id int auto_increment primary key,
    AnoExercicio year,
    CodigoOrgaoSuperior int,
    NomeOrgaoSuperior varchar(60),
    CodigoOrgaoSubordinado int,
    NomeOrgaoSubordinado varchar(200),
    CodigoUnidadeOrcamentaria int,
    NomeUnidadeOrcamentaria varchar(200), 
	CodigoFuncao int,
    NomeFuncao varchar(24),
    CodigoSubfuncao int,
    NomeSubfuncao varchar(50),
    CodigoProgramaOrcamentario int,
    NomeProgramaOrcamentario varchar(300),
    CodigoAcao varchar(5),
    NomeAcao varchar(300), 
    CodigoGrupoDeDespesa int,
    NomeGrupoDeDespesa varchar(60),
    CodigoElementoDeDespesa int,
    NomeElementoDeDespesa varchar(150),
    OrcamentoInicial float,
    OrcamentoAtualizado float,
    OrcamentoRealizado float,
    OrcamentoRealAtualXCem float
    );
      create table if not exists logDados( #Criação da tabela log
	usuario_log varchar(45) not null,
	data_log text,
	tipo_registro text
);  
# Criação dos Procedure Inserção e  dos Triggers de insert, update e delete
delimiter $
create procedure InsereLog (in usuario_log varchar(45), in data_log text, in tipo_registro text)
	begin
		insert into logDados(usuario_log, data_log, tipo_registro) values (usuario_log, data_log, tipo_registro);
	end $

delimiter $
create trigger tg_insert_despesas_logDados_AI after insert on despesas
	for each row
		begin
			call InsereLog(current_user,current_timestamp,'Item inserido na tabela despesas');
		END $

delimiter $
create trigger tg_update_despesas_logDados_AU after update on despesas
	for each row
		begin
			call InsereLog(current_user,current_timestamp,'Item atualizado na tabela despesas');
		END $

delimiter $
create trigger tg_delete_despesas_logDados_AD after delete on despesas
	for each row
		begin
			call InsereLog(current_user,current_timestamp,'Item excluído na tabela despesas');
		END $