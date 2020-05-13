
--Adicionando o Cabeçalho do Pedido
declare @tVendasDados dtDadosVendas, @iRetornoLinha int = 0

  select iIDCliente, iIDLoja, iIDEndereco, mDesconto 
	from tMOVVenda 
   where cNovaVenda = 'S'
	  
	 set @iRetornoLinha = @@ROWCOUNT

	  if @iRetornoLinha > 0
		begin
			insert into @tVendasDados
			select iIDCliente, iIDLoja, iIDEndereco, mDesconto 
			  from tMOVVenda 
			 where cNovaVenda = 'S'

			 execute stp_IncluiPedido @tDadosVendas =  @tVendasDados

			 raiserror('Pedido a Inserido', 10,1)
		end 
		else
			begin 
				raiserror('Sem Pedido a Inserir', 10,1)
			end






go 