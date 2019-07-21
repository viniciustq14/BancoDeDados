use ex1_imoveis
go

insert into Estado values('SP','SÃO PAULO')
insert into Estado values('RJ','RIO DE JANEIRO')

/*2.	Inclua linhas na tabela CIDADE:
cd_CIdade 	nm_Cidade		sg_Estado
1			SÃO PAULO		SP
2			SANTO ANDRÉ	SP
3			CAMPINAS		SP
1			RIO DE JANEIRO	RJ
2			NITEROI		RJ
*/
insert into Cidade (cd_Cidade,nm_Cidade,sg_Estado) values (1,'SÃO PAULO','SP'),
														(2,'SANTO ANDRÉ','SP'),
														(3,'CAMPINAS','SP'),
														(1,'RIO DE JANEIRO','RJ'),
														(2,'NITEROI','RJ')
														delete Cidade
														select * from Cidade
/*3.	Inclua linhas na tabela BAIRRO:
cd_Bairro 	nm_Bairro		cd_Cidade	sg_Estado
1			JARDINS		1		SP
2			MORUMBI		1		SP
3			AEROPORTO		1		SP
1			AEROPORTO		1		RJ
2			NITEROI		1		RJ

*/

insert into Bairro (cd_Bairro,nm_Bairro,cd_Cidade,sg_Estado) values(1,'JARDINS',1,'SP'),
																	(2,'MORUMBI',1,'SP'),
																	(3,'AEROPORTO',1,'SP'),
																	(1,'AEROPORTO',1,'RJ'),
																	(2,'NITEROI',1,'RJ')
/*4.	Inclua linhas na tabela VENDEDOR:
cd_Vendedor 	nm_Vendendor	ds_Endereco			ds_Email
1				MARIA DA SILVA	RUA DO GRITO, 45		msilva@nova.com
2				MARCO ANDRADE	AV. DA SAUDADE,325		mandrade@nova.com
3				ANDRÉ CARDOSO	AV. BRASIL, 401		acardoso@nova.com
4				TATIANA SOUZA	RUA DO IMPERADOR, 778	tsouza@nova.com

*/

insert into Vendedor (cd_Vendedor,nm_Vendedor,ds_Endereco,ds_Email)values(1,'	MARIA DA SILVA','RUA DO GRITO, 45','msilva@nova.com'),
																		(2,'MARCO ANDRADE','AV. DA SAUDADE,325','mandrade@nova.com'),
																		(3,'ANDRÉ CARDOSO','AV. BRASIL, 401','acardoso@nova.com'),
																		(4,'TATIANA SOUZA','RUA DO IMPERADOR, 778','tsouza@nova.com')	
	
																		select *from Vendedor
/*5.	Inclua linhas na tabela IMOVEL:
cd_Imovel	cd_Vendedor	cd_Bairro	cd_Cidade	sg_Estado	ds_Endereco				qt_AreaUtil		qt_AreaTotal	vl_Imovel
	1		1			1			1			SP			AL. TIETE, 3304/101		250				400				180000
	2		1			2			1			SP			AV. MORUMBI, 2230		150				250				135000
	3		2			1			1			RJ			R. GAL. OSORIO, 445/34	250				400				185000
	4		2			2			1			RJ			R. D. PEDRO I, 882		120				200				110000
	5		3			3			1			SP			AV. RUBENS BERTA, 2355	110				200				95000
	6		4			1			1			RJ			R. GETULIO VARGAS, 552	200 			300				 99000
*/
insert into Imovel (cd_Imovel,cd_Vendedor,cd_Bairro,cd_Cidade,sg_Estado,ds_Endereco,qt_Area,qt_AreaTotal,vl_Imovel) 
			values(1,1,1,1,'SP','AL. TIETE, 3304/101',250,400,180000),
					(2,1,2,1,'SP','	AV. MORUMBI, 2230',150,250,135000),
					(3,2,1,1,'RJ','R. GAL. OSORIO, 445/34',250,400,185000),
					(4,2,2,1,'RJ','R. D. PEDRO I, 882',120,200,110000),
					(5,3,3,1,'SP','AV. RUBENS BERTA, 2355',110,200,95000),
					(6,4,1,1,'RJ','R. GETULIO VARGAS, 552',200,300,99000)
					select *from Imovel
/*cd_Comprador	nm_Comprador		ds_Endereco			ds_Email
	1			EMMANUEL ANTUNES	R. SARAIVA, 452		eantunes@nova.com
	2			JOANA PEREIRA		AV PROTUGAL, 52		jpereira@nova.com
	3			RONALDO CAMPELO		R. ESTADOS UNIDOS	rcampelo@nova.com
	4			MANFRED AUGUSTO		AV. BRASIL,351		maugusto@nova.com

*/
insert into Comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email) values (1,'EMMANUEL ANTUNES','R. SARAIVA, 452','eantunes@nova.com'),
	(2,'JOANA PEREIRA','AV PROTUGAL, 52','jpereira@nova.com'),
	(3,'RONALDO CAMPELO','R. ESTADOS UNIDOS','rcampelo@nova.com'),
	(4,'MANFRED AUGUSTO','AV. BRASIL,351','	maugusto@nova.com')

/*cd_Comprador 	cd_Imovel		vl_Oferta	dt_Oferta
1				1				170000		10/01/09
1				3				180000		10/01/09
2				2				135000		15/01/09
2				4				100000		15/02/09
3				1				160000		05/01/09
3				2				140000		20/02/09

*/

insert into Oferta values (1,1,170000,'10-01-09'),
							(1,3,180000,'10-01-09'),
							(2,2,135000,'15-01-09'),
							(2,4,100000,'15-02-09'),
							(3,1,160000,'05-01-09'),
							(3,2,140000,'20-02-09')


/*8.	Aumente o preço de vendas dos imóveis em 12%*/
update Imovel set vl_Imovel= vl_Imovel*1.12

/*9.Abaixe o preço de venda dos imóveis do vendedor 1 em 5%*/
update Imovel set vl_Imovel=vl_Imovel*0.95 where cd_Vendedor=1 
/*10.	Aumente em 5% o valor das ofertas do comprador 2*/
update Oferta set vl_Oferta = vl_Oferta*1.05 where cd_Comprador=2
select *from Oferta
/*11.	Altere o endereço do comprador 3 para R. ANANÁS, 45 e o estado para RJ*/
update Comprador set ds_Endereco='R.ANANÁS,45', sg_Estado='RJ' where cd_Comprador=3  
select *from Comprador
/*12.	Altere a oferta do comprador 2 no imóvel 4 para 101.000*/
/*update Oferta set vl_Oferta=135000 where cd_Imovel=2*/
update Oferta set vl_Oferta=101 where cd_Comprador=2 and cd_Imovel=4
/*13.	Exclua a oferta do comprador 3 no imóvel 1*/
delete Oferta where cd_Comprador=3 and cd_Imovel=1
/*14.	Exclua a cidade 3 do estado SP*/
delete Cidade where cd_Cidade=3 and sg_Estado='SP'

/*15.	Inclua linhas na tabela FAIXA_IMOVEL:
cd_Faixa 	nmFaixa		vl_Minimo	vl_Maximo
1			BAIXO		0			105000
2			MÉDIO		105001		180000
3			ALTO		180001		999999
*/

insert into Faixa_imovel values(1,'BAIXO',0,105000),
								(2,'MÉDIO',105001,180000),
								(3,'ALTO',180001,999999)