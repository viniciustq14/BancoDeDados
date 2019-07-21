create Database ex1_imoveis
go
use ex1_imoveis
go
create table Vendedor(
		cd_Vendedor int not null,
		nm_Vendedor varchar (40),
		ds_Endereco varchar(40),
		cd_CPF decimal(11),
		nm_Cidade varchar(20),
		nm_Bairro varchar(20),
		sg_Estado char(2),
		cd_Telefone varchar(20),
		ds_Email varchar(80)
)
go
create table Imovel(
			cd_Imovel int not null,
			cd_Vendedor int not null,
			cd_Bairro int not null,
			cd_Cidade int not null,
			sg_Estado char(2)not null,
			ds_Endereco varchar(40),
			qt_Area decimal(10,2),
			qt_AreaTotal decimal(10,2),
			ds_Imovel varchar(300),
			vl_Imovel money,
			qt_Ofertas int,
			ic_Vendido char(1),
			dt_Lanoto datetime,
			qt_imovibilidade int
)
go
create table Estado(
		sg_Estado char(2) not null,
		nm_Estado varchar(20)
)
go
create table Cidade(
		cd_Cidade int not null,
		sg_Estado char(2) not null,
		nm_Cidade varchar (20)
)
go
create table Bairro(
		cd_Bairro int not null,
		cd_Cidade int not null,
		sg_Estado char(2) not null,
		nm_Bairro varchar(20)
)
 go 
 create table Faixa_imovel(
		cd_Faixa int not null,
		nm_Faixa varchar (30),
		vl_Maximo money,
		vl_Minimo money
 )
 go
 create table Oferta(
		cd_Comprador int not null,
		cd_Imovel int not null,
		vl_Oferta money,
		dt_Oferta datetime
 )
 go
 create table Comprador(
		cd_Comprador int not null,
		nm_Comprador varchar(20),
		ds_Endereco varchar (20),
		nm_Cidade varchar (20),
		nm_Bairro varchar(20),
		sg_Estado char(2),
		cd_Telefone varchar (20),
		ds_Email varchar (20)

 )
 go

 alter table Vendedor add primary key (cd_Vendedor)
 go
 alter table Imovel add primary key (cd_Imovel)
 go
 alter table Comprador add primary key (cd_Comprador)
 go
 alter table Estado add primary key (sg_Estado)
 go
 alter table Cidade add primary key (cd_Cidade,sg_Estado)
 go
 alter table Bairro add primary key (cd_Bairro,cd_Cidade,sg_Estado)
 go
 alter table Oferta add primary key (cd_Comprador,cd_Imovel)
 go
 alter table Imovel add foreign key (cd_Vendedor) references Vendedor
 go
 alter table Cidade add foreign key (sg_Estado) references Estado
 go
 alter table Bairro add foreign key (cd_Cidade,sg_Estado) references Cidade
 go
 /*alter table Bairro add foreign key (sg_Estado) references Cidade
 go*/
 alter table Oferta add foreign key (cd_Comprador) references Comprador
 go
 alter table Oferta add foreign key (cd_Imovel) references Imovel
 go
 alter table Imovel add foreign key (cd_Bairro,cd_Cidade,sg_Estado) references Bairro

 Drop database ex1_imoveis

