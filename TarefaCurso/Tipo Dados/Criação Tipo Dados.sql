use eBook
go



/*------------------------------------------------------------
Autor      : Luiz Felipe
Objeto     : dtDadosVendas 
Objetivo   : Tipo de Dados Tabela, para a passagem de parametros
              

Hist�rico:        
Autor                  IDBug Data       Descri��o        
---------------------- ----- ---------- --------------------
Luiz Felipe               29/04/2020 Cria��o de Tipo de Dados 
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


