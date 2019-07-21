use ex1_imoveis
go
/*1.	Liste o total de ofertas por comprador de 2008 a 2009 */
select * from Oferta
select cd_Comprador,COUNT(*)ofertas from Oferta group by cd_Comprador
/*2.	Liste o valor m�dio de todos os Im�veis por bairro, somente do estado de S�o Paulo e coloque o resultado em ordem decrescente de valor.*/
select cd_Bairro,avg(vl_Imovel) from Imovel where sg_Estado='SP' group by cd_Bairro order by avg(vl_Imovel) desc
/*3.	Liste o maior valor de im�vel por vendedor, somente para os vendedores 1 e 2.*/
select * from Imovel
select cd_Vendedor ,MAX(vl_Imovel) from Imovel where cd_Vendedor in (1,2) group by cd_Vendedor
/*4.	Mostre a quantidade de im�veis cujo pre�o de venda seja inferior a 150 mil por Estado e a �rea total inferior a 300.*/
select sg_Estado ,COUNT(*) from Imovel where qt_AreaTotal < 300  and vl_Imovel<150000 group by sg_Estado
/*5.	Escreva o comando para apresentar o pre�o m�dio dos Im�veis por c�digo de vendedor. Considere somente aqueles que 
custam mais de 100000 e o valor m�dio n�o ultrapasse 200000.*/
select cd_Vendedor,avg(vl_Imovel) from Imovel where vl_Imovel>100000 group by cd_Vendedor having AVG(vl_Imovel)<=200000
/*6.	Apresente o pre�o m�ximo, o pre�o m�nimo e o pre�o m�dio dos Im�veis cujos os estados s�o �SP�, �RJ� ou �MG� por
 c�digo de Cidade, colocar em ordem crescente de estado.*/
 select cd_Cidade, max(vl_Imovel),MIN(vl_Imovel),AVG(vl_Imovel) from Imovel where sg_Estado in ('SP','RJ','MG') group by cd_Cidade order by sg_Estado 
 /*7.	Escreva o comando para apresentar o pre�o m�dio das ofertas por comprador, somente para as ofertas feitas em outubro de 2009.*/
 select* from Oferta
 select cd_Comprador,avg(vl_Oferta) from Oferta where month(dt_Oferta) =10 and YEAR(dt_Oferta)=2009 group by cd_Comprador
 /*8.	Mostre a soma das ofertas por m�s, somente o ano de 2009, cujo valor esteja entre 100 mil e 250 mil.*/
 select  MONTH(dt_Oferta), sum (vl_Oferta) from Oferta where vl_Oferta between 100000 and 250000 and YEAR(dt_Oferta)=2009  group by MONTH(dt_Oferta)  
