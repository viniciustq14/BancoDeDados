use ex1_imoveis
go
/*1.	Fa�a uma lista de im�veis do mesmo bairro do im�vel 2. Exclua o im�vel 2 da sua busca.*/
Select * from Imovel where cd_Bairro=(select cd_Bairro from Imovel where cd_Imovel=2)and cd_Imovel<>2
/*2.	Fa�a uma lista que mostre todos os im�veis que custam mais que a m�dia de pre�o dos im�veis.*/
select * from imovel where vl_Imovel>(select avg(vl_Imovel)from Imovel)
/*3.	Fa�a uma lista com todos os compradores que tenham ofertas cadastradas com o valor superior a 70 mil.*/
select cd_Comprador ,b.nm_Comprador,vl_Oferta from Oferta,(select nm_Comprador from Comprador)as b where  vl_Oferta>70000 
/*4.	Fa�a uma lista com todos os im�veis com oferta superior � m�dia do valor das Ofertas.*/
select cd_Imovel from Oferta  where  vl_Oferta>(select AVG(vl_Oferta)from Oferta) 
/*5.	Fa�a uma lista com todos os im�veis com pre�o superior � m�dia de pre�o dos im�veis do mesmo bairro*/
select cd_Bairro from Imovel group by cd_Bairro
select avg(vl_Oferta) from Oferta 
/*6.	Fa�a uma lista dos im�veis com o maior pre�o agrupado por bairro, cujo maior pre�o seja superior � m�dia de pre�os dos im�veis.*/
