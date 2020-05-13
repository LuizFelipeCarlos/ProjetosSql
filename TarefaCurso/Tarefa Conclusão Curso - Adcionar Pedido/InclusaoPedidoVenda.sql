use eBook
go
 
/*
Defini��o da vari�vel table que representa a venda realizada
*/
Create Table tMOVVenda 
(
   iIDCliente int,               -- Identifica��o do Cliente.
   iIDLoja int ,                 -- Identifica��o da Loja.
   iIDEndereco int null ,        -- Identifica��o do Endere�o de Entrega
   iIDLivro int ,                -- Identifica��o do Livro
   mDesconto smallmoney null,    -- Desconto aplicado ao Livro
   nQuantidade int               -- Quantidade vendida do Livro.
)



/*
Inser��o dos dados exemplos
*/
 
Insert into tMOVVenda (iIDCliente, iIDLoja, iIDEndereco, mDesconto,iIDLivro, nQuantidade)
Values (8824,23,110649,10.00,160,1),
       (8824,23,110649,5.00,170,1),
       (8824,23,110649,2.00,114,1)
 
 
go

select * from tMOVVenda



