use ex1_imoveis
go
/*1.	Faça uma busca que mostre cd_Imovel, cd_Vendedor, nm_Vendedor e sg_Estado.*/
select i.cd_Imovel,v.nm_Vendedor,v.nm_Vendedor,v.sg_Estado from Imovel as i inner join Vendedor as v on i.cd_Vendedor = v.cd_Vendedor
/*2.	Faça uma busca que mostre cd_Comprador, nm_Comprador, cd_Imovel e vl_Oferta.*/
select o.cd_Comprador,c.nm_Comprador,o.vl_Oferta,o.cd_Imovel from Comprador as c inner join Oferta as o on c.cd_Comprador=o.cd_Comprador
/*3.	Faça uma busca que mostre cd_Imovel, vl_Imovel e nm_Bairro, cujo código do vendedor seja 3.*/
select i.cd_Imovel,i.vl_Imovel,b.nm_Bairro from Imovel as i inner join Bairro as b on i.cd_Bairro=b.cd_Bairro and i.cd_Cidade=b.cd_Cidade and i.sg_Estado=b.sg_Estado
/*4.	Faça uma busca que mostre todos os imóveis que tenham ofertas cadastradas.*/
select *from Imovel as i right join Oferta as o on i.cd_Imovel=o.cd_Imovel
/*5.	Faça uma busca que mostre todos os imóveis e ofertas mesmo que não haja ofertas cadastradas para o imóvel.*/
select * from Imovel as i  left join oferta as o on i.cd_Imovel=o.cd_Imovel
/*6.	Faça uma busca que mostre os compradores e as respectivas ofertas realizadas por eles.*/
select*from Comprador as c inner join Oferta as o on c.cd_Comprador=o.cd_Comprador
/*7.	Faça a mesma busca, porém acrescentando os compradores que ainda não fizeram ofertas para os imóveis.*/
select*from Comprador as c left join Oferta as o on c.cd_Comprador=o.cd_Comprador
/*8.	Faça uma busca que mostre o endereço do imóvel, o bairro e nível de preço do imóvel.*/
select i.ds_Endereco,i.vl_Imovel, b.nm_Bairro from  Bairro as b inner join Imovel as i on b.cd_Bairro=i.cd_Bairro and b.cd_Cidade=i.cd_Cidade and b.sg_Estado =i.sg_Estado
/*9.	Faça uma busca que retorne o total de imóveis por nome de vendedor. Apresente em ordem de total de imóveis.*/
select v.cd_Vendedor,v.nm_Vendedor ,count(i.cd_Imovel) as total_de_imoveis from Vendedor as v inner join Imovel as i on v.cd_Vendedor=i.cd_Vendedor group by v.cd_Vendedor,v.nm_Vendedor order by COUNT(i.cd_Imovel)
/*10.	Verifique a diferença de preços entre o maior e o menor imóvel da tabela.*/
select i.cd_Imovel,max(o.vl_Oferta)as Maximo,MIN(o.vl_Oferta)as minimo from Imovel as i inner join Oferta as o on o.cd_Imovel=i.cd_Imovel group by i.cd_Imovel
/*11.	Mostre o código do vendedor e o menor preço de imóvel dele no cadastro. Exclua da busca os valores de imóveis inferiores a 10 mil.*/
select  v.nm_Vendedor,min(i.vl_Imovel)as Valor_minimo from Vendedor as v inner join Imovel as i on v.cd_Vendedor=i.cd_Vendedor group by v.nm_Vendedor having min(i.vl_Imovel)>10000
/*12.	Mostre o código e o nome do comprador e a média do valor das ofertas e o número de ofertas deste comprador.*/
select * from Oferta
select c.cd_Comprador,c.nm_Comprador,AVG(o.vl_Oferta)as Media,COUNT(o.cd_Comprador)as todas from Comprador as c inner join Oferta as o on o.cd_Comprador=c.cd_Comprador group by c.cd_Comprador,c.nm_Comprador