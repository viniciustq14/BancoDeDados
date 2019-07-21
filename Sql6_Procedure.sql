use ex1_imoveis
/*1.	Escreva uma procedure que receba o nome do bairro e um valor percentual como parâmetro, aplique este percentual de acréscimo nos imóveis deste bairro*/
GO

create procedure sp_AjusteBairro @bairro varchar(20),@per numeric(3)
as
declare @codigo numeric(2),@cidade numeric (2),@estado varchar(2)

	set @codigo= (select cd_Bairro from Bairro where nm_Bairro=@bairro)
	set @cidade =(select cd_Cidade from Bairro where nm_Bairro=@bairro)
	set @estado =(select sg_Estado from Bairro where nm_Bairro=@bairro)
	update Imovel set vl_Imovel=vl_Imovel*(1+@per/100) where Imovel.cd_Bairro=@codigo and Imovel.cd_Cidade=@cidade and Imovel.sg_Estado=@estado 
	

go

 exec sp_AjusteBairro 'NITEROI',20 
 
 /*2.	Escreva uma procedure que receba o código do comprador e um valor percentual como parâmetro, aplique 
 este percentual de acréscimo na última oferta com o maior valor que esse comprador fez, se o valor desta oferta 
 representar um valor inferior a 10% de acréscimo do valor do Imóvel, desconsiderar o reajuste.*/


select * from Oferta
go
create procedure sp_AOferta  @codComprador int, @perc int
as
declare @maior money, @codigoImovel numeric(3) ,@vlImovel money, @vlOfertaAjusta money 

	set @maior=(select MAX(vl_Oferta)from Oferta where cd_Comprador=@codComprador)
	set @codigoImovel=(select cd_Imovel from Oferta where cd_Comprador=@codComprador and vl_Oferta=@maior)	
	set @vlOfertaAjusta=@maior +@perc/100
	set @vlImovel= (select vl_Imovel from Imovel where cd_Imovel=@codigoImovel)
	set @vlImovel= @vlImovel +10/100
	if @vlOfertaAjusta > @vlImovel
	begin
		update Oferta  set vl_Oferta= @vlOfertaAjusta where Oferta.cd_Comprador=@codComprador and Oferta.vl_Oferta=@maior and cd_Imovel=@codigoImovel
		end
	else
		print('Atualizaçao excluida')

go
exec sp_AOferta 2, 35
/*3.Escreva uma procedure que calcule a média dos valores das ofertas de cada imóvel e salve esta média no registro do imóvel.*/
go
select avg(vl_Oferta) from Oferta where cd_Imovel=2
go
create procedure sp_CalcMedia 
as
	declare @media money, @cdImovel int
	set @cdImovel=1

	while (@cdImovel<=(select max(cd_Imovel) from Oferta))
	begin
	set @media =(select avg(vl_Oferta) from Oferta where cd_Imovel=@cdImovel )
	update Imovel set qt_imovibilidade=@media where cd_Imovel=@cdImovel 
	set @cdImovel= @cdImovel+1
	end

	go
	exec sp_CalcMedia
	go
	/*4.	Faça uma procedure que aplique um aumento no valor do Imóvel (cujo valor deve ser recebido como parâmetro),
	 somente para os imóveis que estão com um índice de “BAIXO” na faixa de imóveis.*/

go
create procedure sp_AJusteBaixo @ascrecimo money
as
	update Faixa_valor set vl_minimo= vl_Minimo +@ascrecimo where nm_Faixa='BAIXO'

go
 drop procedure sp_AJusteBaixo
 go
exec sp_AJusteBaixo 500
go

/*5.	Escreva uma procedure que receba um valor percentual como parâmetro e aplique um desconto no valor do Imóvel somente nos Imóveis do estado de São Paulo.*/

create procedure sp_AjusteSP @percentual int
as
update Imovel set vl_Imovel=vl_Imovel *(1-@percentual/100) where sg_Estado='SP'

go
exec sp_AjusteSP 10
go

/*6.	Escreva uma procedure que receba como parâmetro o número do Imóvel e um número que represente a 
quantidade de parcelas em que o valor do imóvel será dividido. A procedure deve obter o valor total deste pedido,
 calcular o valor de cada parcela e gravar cada parcela na tabela Parcelas. Se a quantidade de parcelas for maior que 3,
  acrescente 10% ao valor total do pedido, divida-o na quantidade de parcelas recebida como parâmetro e grave-as na tabela Parcelas. 
   Se a quantidade de parcelas for 1, retorne a mensagem: pedido à vista e interrompa o processamento. Não deixe que o número de parcelas
    ultrapasse a 10. Se ultrapassar, retorne a mensagem: Quantidade de parcelas inválida.
Antes de executar esta procedure, criar a tabela Parcelas e fazer o relacionamento com Imóvel e Comprador
*/
create table Parcelas (cd_imovel  int not null,
						cd_Comprador int not null,
						qt_Parcela int not null,
						vl_Parcela money)
alter table Parcelas add Constraint PK_ImovelComprador primary key (cd_imovel,cd_comprador)
alter table Parcelas add constraint FK_Imovel foreign key (cd_imovel) references Imovel
alter table Parcelas add constraint FK_Comprador foreign key (cd_Comprador) references Comprador				
go 
create procedure sp_Parcelas @cd_Imovel int ,@qt_Parcelas int,@cdComprador int
as
declare @vlParcela money

if @qt_Parcelas=1
	begin
	print('Pagamento avista')
	
end
else
	if @qt_Parcelas>3 and @qt_Parcelas<=10
		begin
		set @vlParcela=(select vl_Imovel from Imovel where cd_Imovel=@cd_Imovel)/@qt_Parcelas
		set @vlParcela=@vlParcela*(1+10/100)
		insert into Parcelas values (@cd_Imovel,@cdComprador,@qt_Parcelas,@vlParcela)
		end
	else
	print('Operação invlaida')

go
/*drop procedure sp_Parcelas*/
go
exec sp_Parcelas 2 ,5,3
go
select * from Parcelas

go
/*1.	Escreva uma função que receba o código do Imóvel como parâmetro e retorne a quantidade de
 ofertas recebidas de todos os imóveis mesmo que não tenha oferta cadastrada, mostrando zero na quantidade.

*/
create function sf_QtOfertas (@cdImovel int)
returns int as
begin
declare @ofertas int
set @ofertas=(select count(cd_Comprador) from Oferta where cd_Imovel=@cdImovel)

return (select count(cd_Comprador) from Oferta where cd_Imovel=2)
end
go
drop function sf_QtOfertas
go
select sf_QtOfertas (2)
