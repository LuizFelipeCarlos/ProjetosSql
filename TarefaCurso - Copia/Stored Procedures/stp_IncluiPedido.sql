
--select 
--iIDPedido,	iIDCliente,	iIDLoja,	iIDEndereco,	iIDStatus,
--dPedido,	dValidade,	dEntrega,	dCancelado,	nNumero,	mDesconto
--from tMOVPedido
--;

-- Criação da Proedure
create or alter procedure stp_IncluiPedido
@tDadosVendas dtDadosVendas READONLY --Parametro tipo tabela

as
begin

	begin try
		begin transaction
			
			select * from @tDadosVendas

			if @@ROWCOUNT > 0
				begin

					insert into tMOVPedido 
					select
					(Next Value for seqIDPedido) as iIDPedido
					,	v.iIDCliente
					,	v.iIDLoja
					,	(  select distinct
							(case when vn.iIDEndereco is null then c.iIDEndereco else vn.iIDEndereco end) as iIDEndereco
							 from tCADEndereco c  right join tMOVVenda vn
							   on c.iIDCliente = vn.iIDCliente and c.iIDEndereco = vn.iIDEndereco
							where vn.iIDCliente in (select distinct	iIDCliente from tMOVVenda where cNovaVenda = 'S')
						) as iIDEndereco
					,	(1) as iIDStatus
					,	getDate() as dPedido
					,	(getDate()+15) as dValidade
					,	(getDate()+2) as dEntrega
					,	dCancelado
					,	(Next Value for seqNumeroPedido) as nNumero
					,	sum(v.mDesconto) as mDesconto
					from tMOVPedido p, tMOVVenda v
					where iIDPedido = 1
					group by iIDPedido, v.iIDCliente,	v.iIDLoja,	v.iIDEndereco,	iIDStatus
					,	dPedido,	dValidade,	dEntrega,	dCancelado,	nNumero


					update tMOVVenda
					set cNovaVenda = 'N'
					where cNovaVenda = 'S'

					raiserror('Pedidos Inseridos com sucesso', 10,1)
				end
		commit

	end try
	begin catch
		if @@trancount > 1
			Rollback

		raiserror('Sem Pedido a Ser Inserido',10,1)

	end catch

End











