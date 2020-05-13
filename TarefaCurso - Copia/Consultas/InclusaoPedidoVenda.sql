use eBook
go
 
/*
Definição da variável table que representa a venda realizada
*/
Create Table tMOVVenda 
(
   iIDCliente int,               -- Identificação do Cliente.
   iIDLoja int ,                 -- Identificação da Loja.
   iIDEndereco int null ,        -- Identificação do Endereço de Entrega
   iIDLivro int ,                -- Identificação do Livro
   mDesconto smallmoney null,    -- Desconto aplicado ao Livro
   nQuantidade int               -- Quantidade vendida do Livro.
)



/*
Inserção dos dados exemplos
*/
 
Insert into tMOVVenda (iIDCliente, iIDLoja, iIDEndereco, mDesconto,iIDLivro, nQuantidade)
Values (8824,23,110649,10.00,160,1),
       (8824,23,110649,5.00,170,1),
       (8824,23,110649,2.00,114,1)
 
 
go

select * from tMOVVenda



