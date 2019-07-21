use Biblioteca
go
/*1.	Criar a tabela Autor_Livro do relacionamento N para N, utilizando uma 
instrução SQL sem especificar as (chaves) restrições de integridade. Depois 
altere a tabela de forma a incluir a chave primária nomeando a restrição para 
PK_AutorLivro e as chaves estrangeiras, nomeando as restrições para FK_Autor e FK_Livro
1		3
1		2		
2		1	
3		4
4		2
4		3



*/
create table AutorLivro (cd_Livro int not null,
							cd_Autor int not null )
alter table AutorLivro add Constraint PK_AutorLivro Primary key (cd_Livro,cd_Autor)		
Alter Table AutorLivro  Add constraint FK_Livro Foreign Key (cd_Livro)  References Livro	
Alter Table AutorLivro  Add constraint FK_Autor  Foreign Key (cd_Autor)  References Autor	
insert into AutorLivro (cd_Livro,cd_Autor) values(1,3),(1,2),(2,1),(3,4),(4,2),(4,3)
/*2.	Crie uma instrução para adicionar a coluna qt_Edicao na tabela Livro, essa coluna
 deve aceitar números inferior a 20. Depois escreva outra instrução para remover a coluna qt_Edicao da tabela Livro*/		

 alter table Livro add qt_Edicao int constraint Ck_qt_Edicao check(qt_Edicao < 20)
 alter table Livro drop Ck_qt_Edicao
 alter table Livro drop column qt_Edicao
 /*3.	Apresente o comando para gerar uma listagem dos códigos dos livros que possuem ao menos dois autores*/

 select cd_Livro,COUNT(cd_Autor)as Qt_Autor from AutorLivro group by cd_Livro having  count(*)>1
 /*4.	Apresente o código do livro, o nome do livro, o nome do assunto de cada livro e o valor 
 do livro, onde o valor seja diferente de zero e o assunto igual a “D” ou “A”*/
 select cd_Livro,nm_Titulo,sg_Assunto,vl_Livro from Livro where sg_Assunto ='D' or  sg_Assunto='A' and vl_Livro<>0