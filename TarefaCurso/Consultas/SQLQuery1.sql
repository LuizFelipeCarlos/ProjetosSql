select
--(Next Value for seqIDPedido) as iIDPedido
--,--   
v.iIDCliente
,	v.iIDLoja
, (  select distinct
	(case when vn.iIDEndereco is null then c.iIDEndereco else vn.iIDEndereco end) as iIDEndereco
	 from tCADEndereco c  right join tMOVVenda vn
	   on c.iIDCliente = vn.iIDCliente and c.iIDEndereco = vn.iIDEndereco
	where vn.iIDCliente in (select distinct	iIDCliente from tMOVVenda where cNovaVenda = 'S')
) as iIDEndereco
,	(1) as iIDStatus
,	dPedido
,	dValidade
,	dEntrega
,	dCancelado
--,	(Next Value for seqNumeroPedido) as nNumero
,	sum(v.mDesconto) as mDesconto
from tMOVPedido p, tMOVVenda v
where iIDPedido = 1
group by iIDPedido, v.iIDCliente,	v.iIDLoja,	v.iIDEndereco,	iIDStatus
,	dPedido,	dValidade,	dEntrega,	dCancelado,	nNumero


select top 10 
iIDCliente,	iIDLoja,	iIDEndereco,	iIDLivro,	mDesconto,	nQuantidade
from tMOVVenda



select * from tCADEndereco



select * from tMOVVenda



DROP TABLE tMOVVenda



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
   nQuantidade int,               -- Quantidade vendida do Livro.
   cNovaVenda varchar(1)
)
GO
 
/*
Inserção dos dados exemplos
*/
 
Insert into tMOVVenda (iIDCliente, iIDLoja, iIDEndereco, mDesconto,iIDLivro, nQuantidade, cNovaVenda)
Values (8824,23,110649,10.00,160,1,'S'),
       (8824,23,110649,5.00,170,1,'S'),
       (8824,23,110649,2.00,114,1,'S')
 
 
go


--Criando tabela temporario global para teste de procedure
Create table ##tTMPDadosVendas ( 	  
	  iIDCliente int not null
	, iIDLoja int not null
	, iIDEndereco int not null
	, mDesconto smallmoney not null
)
go

--testando procedure

declare @tpp dtDadosVendas

  insert into @tpp
  select iIDCliente, iIDLoja, iIDEndereco, mDesconto 
	from tMOVVenda 
   where cNovaVenda = 'S'



execute stp_IncluiPedido @tDadosVendas =  @tpp
go 


--truncate table ##tTMPDadosVendas

select * from ##tTMPDadosVendas
go



declare @tDadosVendas dtDadosVendas

insert into @tDadosVendas
select iIDCliente,	iIDLoja, iIDEndereco, mDesconto 
  from tMOVVenda where cNovaVenda = 'S'

insert into ##tTMPDadosVendas
select * from @tDadosVendas


select * from ##tTMPDadosVendas




select * from tMOVPedido


select getdate()+15


select top 5 
iIDPedido	
, iIDCliente	
, iIDLoja	
, iIDEndereco	
, iIDStatus	
, dPedido	
, dValidade	
, dEntrega	
, dCancelado	
, nNumero	
, mDesconto
from tMOVPedido
order by iIDPedido desc


select top 5 
 iIDPedidoItem	
, iIDPedido	
, v.iIDLivro	
, v.iIDLoja	
, v.nQuantidade	
, (e.mValor) mValorUnitario	
, v.mDesconto
from tMOVPedidoItem i
, tMOVVenda v inner join tRELEstoque e
on e.iIDLivro = v.iIDLivro and e.iIDLoja = v.iIDLoja
order by iIDPedidoItem  desc


select top 5 * from tMOVVenda order by iIDCliente desc

select top 5 * from tMOVPedido order by iIDPedido desc


select * 
  from
(select p.iIDPedido, p.iIDCliente, v.iIDEndereco, p.iIDLoja, p.mDesconto, p.nNumero 
   from (select iIDCliente,	iIDLoja, iIDEndereco, cNovaVenda, sum(mDesconto) as mDesconto
           from tMOVVenda
          group by iIDCliente,	iIDLoja, iIDEndereco, cNovaVenda) as v
  inner join
        (select * from tMOVPedido) as p
     on v.iIDCliente = p.iIDCliente and v.iIDLoja = p.iIDLoja and v.mDesconto = p.mDesconto
) vn 
inner join tMOVVenda mv
   on vn.iIDCliente = mv.iIDCliente and vn.iIDLoja = mv.iIDLoja and vn.iIDEndereco = mv.iIDEndereco


	 select top 5 * from tMOVPedido
	 where iIDPedido not in 
	 (select distinct iIDPedido from tMOVPedidoItem)




 --select top 5 * from tMOVVenda
	 select top 5 * from tMOVPedido order by iIDPedido desc
	 select top 5 * from tMOVPedidoItem 
	 select top 5 * from tRELEstoque


