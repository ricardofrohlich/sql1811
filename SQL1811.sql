/*create database eventos;
use eventos;*/


CREATE TABLE TIPO_EVENTO
(
	id integer primary key identity not null,
	tipo varchar(50)
);

CREATE TABLE EVENTOS
(
	id integer primary key not null identity,
	nome varchar(50) not null,
	data_ini date not null,
	data_fim date not null,
	localizacao varchar(100) not null,
	fk_tipo integer not null,
	foreign key (fk_tipo) references TIPO_EVENTO(id)
);

CREATE TABLE PROGRAMACAO/*atrações*/
(
	id integer primary key not null identity,
	fk_evento integer not null,
	nome varchar(50) not null,
	descricao varchar(500) not null,
	data_ini datetime not null,
	data_fim datetime not null,
	lugar varchar(100) not null,
	responsavel varchar(100) not null, /*ministrante, cantor, grupo...*/
	foreign key (fk_evento) references EVENTOS(id)
);

CREATE TABLE INGRESSOS
(
	id integer primary key not null identity,
	titulo varchar(50) not null,
	lugar varchar(100) not null,
	valor real not null,
	quantidade integer not null,
	fk_evento integer not null,
	foreign key (fk_evento) references EVENTOS(id)
);

CREATE TABLE PESSOAS
(
	cpf varchar(11) not null primary key,
	nome varchar(70) not null,
	email varchar(50) not null,
	fone varchar(15)
);

CREATE TABLE COMPRA /*inscricao*/
(
	id integer primary key not null identity,
	fk_pessoa varchar(11) not null,
	fk_ingresso integer not null,
	quantidade integer not null
	foreign key (fk_ingresso) references INGRESSOS (id),
	foreign key(fk_pessoa) references PESSOAS(cpf)
);




/*
	INSERÇÃO DE DADOS
*/

INSERT INTO TIPO_EVENTO VALUES('MINICURSO');
INSERT INTO TIPO_EVENTO VALUES('Libertadores da América');
INSERT INTO TIPO_EVENTO VALUES('Carnaval');
INSERT INTO TIPO_EVENTO VALUES('Formatura');

SELECT * FROM TIPO_EVENTO;

INSERT INTO EVENTOS VALUES ('RocknSP', '2021-11-30', '2021-12-10', 'SP', 1);

INSERT INTO EVENTOS VALUES ('Carnaval SP', '2022-03-02', '2022-03-06', 'SP', 3);
INSERT INTO EVENTOS VALUES ('GREnal', '2022-03-16', '2022-03-16', 'Arena', 2);

INSERT INTO EVENTOS VALUES ('Formatura Academia .Net', '2022-01-15', '2022-01-15', 'Teams', 4);

select * from EVENTOS

INSERT INTO PESSOAS VALUES ('01311121180', 'Fabrício', 'fabricio.londero@ufn.edu.br','5555558498');
INSERT INTO PESSOAS(cpf, nome, email) VALUES ('01333221180', 'Glauber', 'glauber@ufn.edu.br');
INSERT INTO PESSOAS(cpf, nome, fone) VALUES ('01783221180', 'Elias', '9854556422');
INSERT INTO PESSOAS(cpf, nome, email) VALUES ('01783221180', 'Elias', '');
INSERT INTO PESSOAS VALUES ('83693424004', 'Ricardo', 'ricardo.frohlich@ufn.edu.br','555555555');

select * from PESSOAS


INSERT INTO PROGRAMACAO VALUES (
1, 
'Metallica', 
'Show da Metallica com 2hrs de duração', 
'2022-05-7 20:00:00', 
'2022-05-7 23:59:00', 
'Arena Grêmio - POA',
'Metallica'
);

select * from PROGRAMACAO

insert into PROGRAMACAO values(1,'Kiss','show da banda KISS com muita música boa','2022-04-10 20:00:00','2022-04-10 23:00:00','Arena', 'Kiss');
insert into PROGRAMACAO values(1,'Iron Maiden','show da banda com muito rock','2022-04-07 20:00:00','2022-04-07 23:00:00','Barra da Tijuca', 'Iron Maiden');
insert into PROGRAMACAO values(1,'Roling Stones','show de 100 anos do Mick Jagger','2022-04-08 20:00:00','2022-04-08 23:00:00','Barra da Tijuca', 'Roling Stones');
insert into PROGRAMACAO values(1,'Alice Cooper','show do doidão','2022-04-09 20:00:00','2022-04-09 23:00:00','Barra da Tijuca', 'Alice Cooper');
insert into PROGRAMACAO values(1,'Guns N Roses','show da turnê de despedida','2022-04-010 20:00:00','2022-04-10 23:00:00','Barra da Tijuca', 'Guns N Roses');
insert into PROGRAMACAO values(1, 'Elton John', 'Show do Elton Johna com 2hrs de duracao', '2022-05-09 20:00:00', '2022-05-09 23:59:00', 'Palco principal', 'Elton John');


insert into INGRESSOS values ('Full Metal', 'RJ', 5000, 500, 1);
insert into INGRESSOS values ('Pop Rock Only', 'RJ', 1500, 750, 1);
insert into INGRESSOS values ('Black Metal', 'RJ', 750, 600, 1);

select * from INGRESSOS

Insert into COMPRA values ('83693424004', 3, 2);
Insert into COMPRA values ('83692424004', 1, 2);
select * from COMPRA 

UPDATE eventos set localizacao = 'meet' where id = 9

select * from eventos

update eventos set localizacao = 'SP' where id = 1 or id = 6
update eventos set localizacao = 'Arena' where nome like 'GREnal'

update eventos set localizacao = 'SP' where nome = 'Carnaval SP'

update eventos set localizacao = 'Teams' where data_ini = '2022-01-15'

update eventos set nome = 'Carnaval RJ'  where data_ini >= '2022-03-02' AND data_fim <= '2022-03-06' 

delete eventos where id = 1

select * from eventos where data_ini >= '2022-01-01' and data_fim <= '2022-01-31'

select * from eventos where MONTH(data_ini) = '03'

select * from eventos where YEAR(data_ini) = '2022' and DAY(data_ini) = 16 and MONTH(data_ini) = 3

select * from eventos where data_ini like '2022-%'

select * from eventos where nome like 'Ro%'

/* Consultar os eventos que ocorrem no Rio Grande do Sul' */
select * from eventos where localizacao like 'RS'

/* Consultar os eventos que ocorrem no Rio Grande do Sul' e em 'São Paulo' */
select * from eventos where localizacao like 'Arena' or localizacao like 'SP'

update eventos set localizacao = 'RJ' where nome like 'Carna%'

update eventos set localizacao = 'RS' where nome like 'GRE%'

select * from eventos


/* Consultar os ingressos que custam 50 reais */
select * from INGRESSOS 

select * from ingressos where valor = 50

insert into ingressos values ('Jogo', 'RS', 50, 1000, 8)

insert into ingressos values ('Jogo', 'RJ', 35, 10000, 8)

/*Consultem os ingressos que vão ocorrer em 'RJ' */
select * from ingressos where lugar like 'rj'

/*Consulte os ingressos que vão custar entre 50 reais e 150 reais*/
select * from ingressos where valor >= 50 and valor <= 150

/*consulte os ingressos que vão custar 50 ou 150 reais */ 
select * from ingressos where valor =50 or valor =150

/* mostre o titulo do ingresso que custa 500 reais */

select * from eventos

select * from ingressos 
select quantidade, titulo, id , lugar, valor, fk_evento from ingressos 

select titulo from ingressos where valor = 5000

/* apresentar o email das pessoas que tem um telefone do RS */ 
select * from PESSOAS
select email from pessoas where fone like '55%' or fone like '055%' or fone like '51%' or fone like '53%' or fone like '54%'

/*consulte o titulo dos ingressos que vão custar 50 ou 1000 reais */ 
select titulo from ingressos where valor >= 50 and valor <= 1000

select titulo from ingressos where valor BETWEEN 50 AND 1000

/* apresentar o email das pessoas que tem um telefone do RS */ 
select email from pessoas where fone like '5%' or fone like '05%'

use master

drop database mercado

create database mercado

use mercado

/* criar duas tabelas 
tabela 1 - produtos 
codigo PK
nome varchar
preco
quantidade (estoque)
id_categoria fk

tabela 2 - categoria 
id pk 
nome varchar */

create table categoria(
id integer primary key not null identity,
nome varchar(30)
);

create table produto(
codigo integer primary key not null identity,
nome varchar(30),
preco real not null,
estoque integer, 
fk_categoria integer,
foreign key (fk_categoria) references categoria(id)
);


insert into categoria values ('BEBIDAS')
insert into categoria values ('AÇOUGUE')
insert into categoria values ('HORTIFRUTI')
insert into categoria values ('FRIOS')
insert into categoria values ('LIMPEZA')
insert into categoria values ('BAZAR')
insert into categoria values ('HIGIENE')
insert into categoria values ('PADARIA')

SELECT * FROM categoria

insert into produto values ('nome', preço, estoque, categoria)
insert into produto values ('AGUA COM GÁS', 0.89, 1000, 1)
insert into produto values ('REFRIGERANTE 2 LITROS', 4.33, 700, 1)

insert into produto values ('PONTA DE PEITO', 32.89, 433, 2)
insert into produto values ('SOBRECOXA DE FRANGO', 13.77, 35, 2)

insert into produto values ('QUEIJO', 30.84, 100, 4)
insert into produto values ('MORTANDELA', 14.84, 100, 4)

select preco from produto where fk_categoria = 1

/* max - maximo
 min - minimo  
 avg - media 
 sum - soma 
 count - contador */

 select COUNT(*) as TOTALDEPRODUTOS from produto 
 select * from produto

 select COUNT(codigo) as [total de produtos] from produto where fk_categoria = 4 

 /* apresentar quantos produtos tem cadastrados nas categorias 1 , 2 e 6 */
 select count(*) as [produtos das categorias 1, 2 e 6] from produto where fk_categoria = 1 or fk_categoria = 2 or fk_categoria = 6
 select count(*) as [produtos das categorias 1, 2 e 6] from produto where fk_categoria in (1,2,6)
 
 update produto set estoque = 1103 where codigo = 1
 select max(estoque) as maiorestoque from produto
 /*apresentar o produto com maior preço da categoria 2 */
 select max(preco) as [maior preço] from produto where fk_categoria = 1

 /*apresentar o produto com menor preço da categoria 1 */
 select min(preco) as [menor preço] from produto where fk_categoria = 1

 /*apresentar a média de preço dos produtos */
 select avg(preco) as [média de preços] from produto
 
 /*apresentar a média de estoque dos produtos */
 select avg(estoque) as [média de estoque] from produto

 select avg(estoque) as [média de estoque] from produto where fk_categoria = 4

 /*apresentar o somatório de estoque dos produtos*/
 select sum(estoque) as [somatório de estoque] from produto

 /*apresentar o somatório de preço dos produtos*/
 select sum(preco) as [somatório de preços] from produto 


 /*apresentar o somatório de estoque dos produtos por categoria*/
 select fk_categoria, sum(estoque) as [somatório de estoque] from produto group by fk_categoria

  
 /*apresentar o somatório de preço dos produtos por categoria*/
 select fk_categoria, sum(preco) as [somatório dos preços] from produto group by fk_categoria

 create table venda(
 id integer primary key not null identity, 
 fk_produto integer not null,
 qtd integer not null, 
 valor real not null, 
 caixa varchar(50),
 foreign key (fk_produto) references produto(codigo)
 )
 drop table venda 
 insert into venda values (5, 15, 500,'ricardo')

 select * from venda

SELECT distinct caixa from venda 

select caixa, sum(valor) as [valor do total das vendas] from venda group by caixa order by [valor do total das vendas]
