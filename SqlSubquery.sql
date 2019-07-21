use ex1_imoveis
go
/*1.	Faça uma lista de imóveis do mesmo bairro do imóvel 2. Exclua o imóvel 2 da sua busca.*/
Select * from Imovel where cd_Bairro=(select cd_Bairro from Imovel where cd_Imovel=2)and cd_Imovel<>2
/*2.	Faça uma lista que mostre todos os imóveis que custam mais que a média de preço dos imóveis.*/
select * from imovel where vl_Imovel>(select avg(vl_Imovel)from Imovel)
/*3.	Faça uma lista com todos os compradores que tenham ofertas cadastradas com o valor superior a 70 mil.*/
select cd_Comprador ,b.nm_Comprador,vl_Oferta from Oferta,(select nm_Comprador from Comprador)as b where  vl_Oferta>70000 
/*4.	Faça uma lista com todos os imóveis com oferta superior à média do valor das Ofertas.*/
select cd_Imovel from Oferta  where  vl_Oferta>(select AVG(vl_Oferta)from Oferta) 
/*5.	Faça uma lista com todos os imóveis com preço superior à média de preço dos imóveis do mesmo bairro*/
select cd_Bairro from Imovel group by cd_Bairro
select avg(vl_Oferta) from Oferta 
/*6.	Faça uma lista dos imóveis com o maior preço agrupado por bairro, cujo maior preço seja superior à média de preços dos imóveis.*/
