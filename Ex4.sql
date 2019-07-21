use ex1_imoveis
go
/*1.	Liste todas as linhas e os campos cd_Comprador, nm_Comprador e ds_Email da tabela COMPRADOR*/
select cd_Comprador,nm_Comprador,ds_Email from Comprador
/*2.	Liste todas as linhas e os campos cd_Vendedor, nm_Vendedor e ds_Email da tabela VENDEDOR em ordem alfabética decrescente*/
select  cd_Vendedor,nm_Vendedor,ds_Email from Vendedor order by nm_Vendedor desc
/*3.	Liste as colunas cd_Imovel, cd_Vendedor e vl_Imovel de todos os imóveis do vendedor 2.*/
select cd_Imovel,cd_Vendedor,vl_Imovel from Imovel where cd_Vendedor=2
/*4.	Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e sejam do Estado do RJ.*/
select cd_Imovel,cd_Vendedor,vl_Imovel,sg_Estado from Imovel where vl_Imovel< 150000 and sg_Estado='RJ'
/*5.	Liste as colunas cd_Imovel, cd_Vendedor, vl_Imovel e sg_Estado dos imóveis cujo preço de venda seja inferior a 150 mil e o vendedor não seja 2.*/
select cd_Imovel,cd_Vendedor,vl_Imovel,sg_Estado from Imovel where cd_Vendedor <>2 and sg_Estado='RJ'
/*6.	Liste as colunas cd_Comprador, nm_Comprador, ds_Endereco e sg_Estado da tabela COMPRADOR em que o Estado seja nulo.*/
select * from Comprador
select cd_Comprador,nm_Comprador,ds_Endereco,sg_Estado from Comprador where sg_Estado is null
/*7.	Liste todas as ofertas cujo valor esteja entre 100 mil e 150 mil*/
select * from Oferta where vl_Oferta between 100000 and 150000
/*8.	Liste todos vendedores que tenham a letra A na segunda posição do nome*/
select * from Vendedor where nm_Vendedor like '_A%'
/*9.	Liste todas as ofertas cujo imóvel seja 2 ou 3 e o valor da oferta seja maior que 140 mil, em ordem decrescente de data.*/
select * from Oferta
select * from Oferta where cd_Imovel in(2,3) and  vl_Oferta < 140000 order by dt_Oferta desc
/*10.	Liste todos os imóveis cujo preço de venda esteja entre 110 mil e 200 mil ou seja do vendedor 1 em ordem de área útil*/
select * from Imovel where vl_Imovel between 110000 and 200000 and cd_Vendedor=1 order by qt_Area
/*11.	Verifique a maior, a menor e o valor médio das ofertas na tabela.*/
select MAX(vl_Oferta)Maximo, Min(vl_Oferta)minimo,avg(vl_Oferta)media from Oferta
/*12.	Mostre o maior, o menor, o total e a média de preço de venda dos imóveis.*/
select MAX(vl_Imovel)Maximo, Min(vl_Imovel)minimo,avg(vl_Imovel)media from Imovel
/*13.	Modifique o comando anterior para que sejam mostrados os mesmos índices por bairro.*/
select cd_Bairro,cd_Cidade,sg_Estado, MAX(vl_Imovel)Maximo, Min(vl_Imovel)minimo,avg(vl_Imovel)media from Imovel group by cd_Bairro,cd_Cidade,sg_Estado
/*14.	Faça uma busca que retorne o total de ofertas realizadas nos anos de 2008, 2009 e 2010.*/
select COUNT(*) from Oferta where year(dt_Oferta) in(2008,2009,2010)