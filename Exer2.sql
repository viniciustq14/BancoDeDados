use ex1_imoveis
go
/*1.Altere a tabela de forma a incluir as restrições para que o preenchimento 
seja obrigatório nas colunas vl_Oferata na tabela Oferta e nm_Comprador na
 tabela Comprador. */
drop index Oferta on Oferta
Alter Table Oferta Alter column vl_Oferta money not null
/*3.	Adicionar uma coluna qt_Parcelas do tipo número inteiro na tabela Oferta,
 já criada e essa coluna deve aceitar números entre 1 a 10, usando o nome CK_qtParcela
  para a restrição.*/
  Alter table Oferta add qt_Parcela int constraint CK_qt_parcela check (qt_Parcela between 1 and 10) 
 /*4.	Renomear a coluna qt_Parcelas para qt_Parcelamento*/   
 Alter table Oferta drop constraint CK_qt_parcela
 exec sp_rename "Oferta.qt_Parcela", "qt_Parcelamento"
 alter table Oferta add constraint  CK_qt_parcela check (qt_Parcelamento between 1 and 10) 
 /*5.	Renomear a tabela Faixa_Imovel para Faixa_Valor*/
 exec sp_rename "Faixa_imovel","Faixa_valor"
 /*6.	Incluir uma restrição de nome CK_dtOferta,  na tabela de Oferta indicando
  que a coluna dt_Oferta deve possuir no ano da data da Oferta o mesmo ano da data do sistema.*/

  alter table Oferta add constraint CK_dtOferta check (dt_Oferta=year(getdate()))
  /*7.	Incluir uma restrição de nome CK_qtAreaUtil, na tabela de Imovel
   indicando que a coluna qt_AreaUtil deve ser menor ou igual a coluna qt_AreaTotal.*/
   alter table Imovel add constraint CK_qtAreaUtil check (qt_Area<=qt_AreaTotal)
   /*8.	Destrua a coluna qt_Parcelamento da tabela Oferta*/
alter table Oferta drop constraint CK_qt_parcela
alter table Oferta drop column qt_Parcelamento
/*9.	Destrua a restrição da coluna qt_AreaUtil da tabela Imóvel.*/
alter table Imovel drop constraint CK_qtAreaUtil
alter table Oferta drop constraint CK_dtOferta
