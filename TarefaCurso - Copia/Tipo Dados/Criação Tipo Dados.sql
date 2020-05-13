use eBook
go



/*------------------------------------------------------------
Autor      : Luiz Felipe
Objeto     : dtDadosVendas 
Objetivo   : Tipo de Dados Tabela, para a passagem de parametros
              

Histórico:        
Autor                  IDBug Data       Descrição        
---------------------- ----- ---------- --------------------
Luiz Felipe               29/04/2020 Criação de Tipo de Dados 
------------------------------------------------------------*/

create Type dtDadosVendas 
As Table ( 	  
	  iIDCliente int not null
	, iIDLoja int  not null
	, iIDEndereco int  not null
	, mDesconto smallmoney  not null
)
go

drop type dtDadosVendas


