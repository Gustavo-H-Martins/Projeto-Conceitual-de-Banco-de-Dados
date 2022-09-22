-- LIMPANDO O ESQUEMA
# DROP DATABASE db_ecommerce;

 
-- Criação do Banco de dados para o cenário de E-commerce
CREATE DATABASE IF NOT EXISTS db_ecommerce;
USE db_ecommerce;

-- Criando as tabelas
/*
-- Tabela Cliente
CREATE TABLE IF NOT EXISTS tb_client
(
	idclient int auto_increment primary key,
    Addres varchar(45),
    Bdate date,
    contact varchar(15),
    email varchar(30) NOT NULL
);
ALTER TABLE tb_client AUTO_INCREMENT=1;
-- Tabela Produto
CREATE TABLE IF NOT EXISTS tb_products
(
	idproduct int auto_increment primary key,
    Pname varchar(45) NOT NULL,
    classification_kids bool default false,
    category enum('Eletrônico','Vestuário','Brinquedos','Alimentos','Móveis') NOT NULL,
    average float default 0,
    size varchar(10),
    Pcode varchar(20), 
    Pvalue decimal(4,2)
    
);

-- Tabela Pedido
CREATE TABLE IF NOT EXISTS tb_orders
(
	idorder int auto_increment primary key,
	os_status enum('confirmado', 'cancelado', 'processando','pago') default 'processando',
	osdesc varchar(15),
	os_idclient int,
	frete float default 10,
	os_value float,
    CONSTRAINT fk_orders_client foreign key(os_idclient) references tb_client(idclient)
			ON UPDATE CASCADE
            ON DELETE SET NULL
);

-- Tabela Pagamento
CREATE TABLE IF NOT EXISTS tb_paymant
(
	idpayment int auto_increment primary key,
	pay_idclient int,
    pay_idorder int,
	pay_status enum('pendente', 'cancelado', 'em processamento', 'confirmado','devolvido'),
    pay_type enum('Boleto', 'Credito', 'Debito','Voucher'),
	pay_value float,
	discount float,
	cashback float,
	valuetopay float,
    CONSTRAINT fk_payment_client foreign key(pay_idclient) references tb_client(idclient),
    CONSTRAINT fk_payment_orders foreign key(pay_idorder) references tb_orders(idorder)
);

-- Tabela Estoque
CREATE TABLE IF NOT EXISTS tb_storage
(
	idstorage int auto_increment primary key,
	storagelocation varchar(30)
);

-- Tabela Estoque_Produto
CREATE TABLE IF NOT EXISTS tb_product_storage
(
	idproduct int,
    idstrage int,
    quantify float default 0,
	CONSTRAINT fk_pstorage_products foreign key(idproduct) references tb_products(idproduct),
    CONSTRAINT fk_pstorage_storage foreign key(idstrage) references tb_storage(idstorage)
);

-- Tabela Pessoa Jurídica
CREATE TABLE IF NOT EXISTS tb_pj
(
	idpj int auto_increment primary key,
    pj_idclient int,
	pjfantasyname varchar(45),
    pjsocialname varchar(45) NOT NULL,
	pjresponse varchar(30) NOT NULL,
	CNPJ char(14) NOT NULL,
    CONSTRAINT unique_cnpj_pj UNIQUE (CNPJ),
    CONSTRAINT fk_pj_client foreign key(pj_idclient) references tb_client(idclient)
	
);

-- Tabela Pessoa Física
CREATE TABLE IF NOT EXISTS tb_pf
(
	idpf int auto_increment primary key,
    pf_idclient int,
    Fname varchar(15),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) NOT NULL,
    CONSTRAINT unique_cpf_pf UNIQUE (CPF),
    CONSTRAINT fk_pf_client foreign key(pf_idclient) references tb_client(idclient)
);

-- Tabela Fornecedor
CREATE TABLE IF NOT EXISTS tb_supplyers
(
	idsupplyer int auto_increment primary key,
    supplyer_idpj int,
    CONSTRAINT fk_supplyer_pj foreign key(supplyer_idpj) references tb_pj(idpj)
);
-- Tabela Fornecimento
CREATE TABLE IF NOT EXISTS tb_supply
(
	suply_idsupplyer int,
    suply_idproduct int,
    CONSTRAINT fk_supply_supplyers foreign key(suply_idsupplyer) references tb_supplyers(idsupplyer),
    CONSTRAINT fk_supply_products foreign key(suply_idproduct) references tb_products(idproduct)
);

-- Tabela Vendedores Terceiros
CREATE TABLE IF NOT EXISTS tb_seller
(
	idseller int auto_increment primary key,
    seller_idpj int,
    CONSTRAINT fk_seller_pj foreign key(seller_idpj) references tb_pj(idpj)
);

-- Tabela Marketplace
CREATE TABLE IF NOT EXISTS tb_mkproducts
(
    mk_idseller int,
	mk_idproduct int,
	mkmargin float,
    primary key (mk_idseller, mk_idproduct),
    CONSTRAINT fk_mk_sellers foreign key(mk_idseller) references tb_seller(idseller),
    CONSTRAINT fk_mk_products foreign key(mk_idproduct) references tb_products(idproduct)
);
 */
/*

show tables;

show databases;
use information_schema;
show tables;
desc TABLE_CONSTRAINTS;

desc REFERENTIAL_CONSTRAINTS;

select * from REFERENTIAL_CONSTRAINTS where constraint_schema = 'db_ecommerce';
 */

/* INCLUSÃO DE DADOS CLIENTES

ALTER TABLE tb_client AUTO_INCREMENT=1;
use db_ecommerce;

alter table tb_client
modify email varchar(60) NOT NULL;

alter table tb_client
modify Addres varchar(60);

INSERT INTO tb_client (Addres, Bdate, contact, email )
VALUES
	-- Arc de Triomphe
    (
		'Av. des Champs-Élysées, 75008 Paris, France','1806-08-15','+33 1 5537 7377','www.paris-arc-de-triomphe.fr/'
	),
    -- Quinta Avenida
	(
		'5th Ave, New York, NY, USA','1811-03-01',NULL,'en.wikipedia.org/wiki/Fifth_Avenue'
	),
    -- Larvotto Beach
	(
		'Avenida Princesse Grace, Moncaco, France','0001-01-01',NULL,'pt.wikipedia.org/wiki/Larvotto'
	),
	-- The Cromwell Las Vegas Hotel & Casino
	(
		'Las Vegas Boulevard Overpass, Las Vegas, NV, USA','1952-01-01','+1702 777-3777','www.caesars.com/cromwell'
	),
	-- Lagoa Santa
    (
		'Pr. Dr. Lund, Miguel Salomão, Lagoa Santa, MG, Brasil','1825-01-01','(31) 3688-1300.','www.lagoasanta.mg.gov.br/'
	),
    	-- Arc de Triomphe Paralelo
    (
		'Av. des Champs-Élysées, Aparicida do Norte','1806-08-15','+31 1 5537 7377','www.aparicida-arc-de-triomphe.fr/'
	),
    -- Quinta Avenida Brasil
	(
		'Av Brasil, São Paulo, SP, Brasil','1811-03-01',NULL,'en.wikipedia.org/wiki/AvenueBrasil'
	),
    -- Larvotto Beach de Ramos
	(
		'Avenida Copacabana, São Paulo, Brasil','0001-01-01',NULL,'pt.wikipedia.org/wiki/Ramos'
	),
	-- The Cromwell Las Vegas Hotel & Quengueiro
	(
		'Cabaré da Esquina, Las Vegas, NV, USA','1952-01-01','190','www.caesars.com/cromwell'
	),
	-- Lagoa Santa aqui tem uma praça
    (
		'Dr. Lund, Miguel Salomão, Lagoa Santa, MG, Brasil','1825-01-01','(31) 3688-1300.','www.lagoasanta.mg.gov.br/'
	);
*/


/* INCLUSÃO DADOS PRODUTOS
INSERT INTO tb_products(Pname,classification_kids,category,average,size,Pcode, Pvalue)
VALUES
	(
		'Boneca', TRUE, 'Brinquedos', 5, 15, '554875',399.99
	),
	(
		'Camisa', TRUE, 'Vestuário', 4.5, 2, '875497',99.99
	),
	(
		'Celular', FALSE, 'Eletrônico', 4.99, 1, '999874',7999.99
	),
	(
		'Feijão', TRUE, 'Alimentos', 2, 4, '5784698',9.99
	),
	(
		'Arroz', TRUE, 'Alimentos', 3, 4, '5784879',29.00
	),
	(
		'Cerveja', FALSE, 'Alimentos', 0, 5, '5554875',19.50
	),
	(
		'Carrinho', TRUE, 'Brinquedos', 4, 13, '554875',299.99
	),
	(
		'Calça', TRUE, 'Vestuário', 3.5, 4, '879597',299.99
	),
	(
		'Tablet', FALSE, 'Eletrônico', 4.75, 4, '999877',5999.99
	),
	(
		'Macarrão', TRUE, 'Alimentos', 1, 4, '5773698',6.99
	),
	(
		'Açucar', TRUE, 'Alimentos', 5, 5, '4684879',12.00
	),
	(
		'Refrigerante', FALSE, 'Alimentos', 5, 5, '5554875',7.25
	),
	(
		'Fogão', FALSE, 'Móveis', 4.99, 10, '888874',1999.99
	),
	(
		'Geladeira', FALSE, 'Móveis', 4.99, 15, '777874',2999.99
	),
	(
		'Cama', FALSE, 'Móveis', 4.99, 35, '999874',900.00
	);
ALTER TABLE tb_products AUTO_INCREMENT = 1;
ALTER TABLE tb_products MODIFY Pvalue float;
select * from tb_products;
*/

/* INCLUSÃO DOS DADOS DE PEDIDOS

INSERT INTO tb_orders(os_status,	osdesc,	os_idclient ,	frete ,	os_value)
VALUES
	(
		'confirmado', 'Retirada', 1 , 15.00, 3500
    ),
	(
		'cancelado', 'Compra Web', 2 , 20.00, 2500
    ),
	(
		'processando', 'Compra Mobile', 3 , 3.00, 1500
    ),
	(
		'confirmado', 'Compra Mobile', 4 , 35.00, 5000
    ),
	(
		'confirmado', 'Retirada', 5 , 0.00, 25
    ),
	(
		'processando', 'Retirada', 6 , 57.00, 145
    ),
	(
		'cancelado', 'Compra Mobile', 1 , 12.00, 1500
    ),
	(
		'confirmado', 'Compra Web', 7 , 5.00, 657
    ),
	(
		'confirmado', 'Compra Mobile', 8 , 15.00, 452
    ),
	(
		'confirmado', 'Retirada', 9 , 45.00, 250
    ),
	(
		'confirmado', 'Compra Mobile', 10 , 15.00, 150
    ),
	(
		'pago', 'Compra Web', 10 , 2.00, 1499.99
    ),
	(
		'pago', 'Compra Web', 9 , 0.00, 1500.99
    ),
	(
		'pago', 'Compra Mobile', 8 , 47.00, 8999.99
    ),
	(
		'processando', 'Compra Web', 7 , 9.00, 854
    ),
	(
		'processando', 'Retirada', 6 , 10.00, 22.99
    ),
	(
		'processando', 'Retirada', 5, 15.00, 12.99
    ),
	(
		'processando', 'Retirada', 4, 15.00, 299.99
    ),
	(
		'processando', 'Compra Mobile', 3 , 15.00, 10000
    ),
	(
		'processando', 'Compra Mobile', 2 , 15.00, 399.99
    );
    */
    
/* INCLUSÃO DOS DADOS DE PAGAMENTOS

INSERT INTO tb_payment(pay_idclient, pay_idorder, pay_status, pay_type, pay_value, discount, cashback, valuetopay)
VALUES
	(
		1, 1, 'confirmado', 'Voucher', 3515.00, 50.00, 450.00, 3015.00
    ),
	(
		2, 2, 'em processamento', 'Credito', 2520.00, 50.00, 950.00, 1520.00
    ),
	(
		3, 3, 'cancelado', 'Credito', 4515.00, 50.00, 450.00, 4015.00
    ),
	(
		4, 4, 'confirmado', 'Debito', 5515.00, 50.00, 150.00, 5315.00
    ),
	(
		5, 5, 'cancelado', 'Debito', 3515.00, 50.00, 450.00, 3015.00
    ),
	(
		6, 6, 'em processamento', 'Boleto', 3515.00, 10.00, 450.00, 3055.00
    ),
	(
		1, 7, 'confirmado', 'Credito', 615.00, 50.00, 450.00, 115.00
    ),
	(
		7, 8, 'pendente', 'Credito', 10000.00, 00.00, 450.00, 700.00
    ),
	(
		8, 9, 'cancelado', 'Boleto', 1548.00, 45.00, 450.00, 3015.00
    ),
	(
		9, 10, 'em processamento', 'Boleto', 54.00, 15.00, 785.00, 3015.00
    ),
	(
		10, 12, 'pendente', 'Debito', 3515.00, 00.00, 100.00, 3015.00
    ),
	(
		10, 13, 'em processamento', 'Boleto', 879.00, 00.00, 450.00, 477.00
    ),
	(
		9, 14, 'cancelado', 'Debito', 4575.00, 50.00, 450.00, 3015.00
    ),
	(
		8, 1, 'pendente', 'Boleto', 3515.00, 50.00, 450.00, 3015.00
    ),
	(
		7, 16, 'cancelado', 'Debito', 3515.00, 50.00, 450.00, 3015.00
    ),
    (
		6, 14, 'confirmado', 'Voucher', 3515.00, 50.00, 450.00, 3015.00
    ),
	(
		5, 17, 'devolvido', 'Debito', 3515.00, 50.00, 450.00, 3015.00
    ),
	(
		4, 15, 'confirmado', 'Voucher', 3515.00, 50.00, 450.00, 3015.00
    ),
	(
		3, 18, 'confirmado', 'Boleto', 3515.00, 50.00, 450.00, 3015.00
    ),
	(
		2, 19, 'confirmado', 'Boleto', 3515.00, 50.00, 450.00, 3015.00
    ),
    (
		5, 19, 'confirmado', 'Boleto', 3515.00, 50.00, 450.00, 3015.00
    ),
	(
		9, 20, 'devolvido', 'Boleto', 3515.00, 50.00, 450.00, 3015.00
    ),
	(
		2, 20, 'confirmado', 'Voucher', 3515.00, 50.00, 450.00, 3015.00
    ),
	(
		3, 4, 'devolvido', 'Boleto', 3515.00, 50.00, 450.00, 3015.00
    );

ALTER TABLE tb_paymant
RENAME tb_payment;
*/


/* INCLUSÃO DOS DADOS DE VENDEDORES TERCEIROS 
INSERT INTO tb_seller(seller_idpj)
VALUES
	(
		1
    ),
    (
		2
    );
*/

/* INCLUSÃO DOS DADOS DE PJ


INSERT INTO tb_pj(pj_idclient,pjfantasyname,pjsocialname,pjresponse,CNPJ)
VALUES
	(
		13, 'Fornecedor de Verdade','Coisas e Paradas','Mano Zé', 12345678910112
    ),
 	(
		14, 'Fornecedor de Mentira','Shoppe e Aliexpress SA','Bruce Lee', 12345678910113
    );
 */      

/* INCLUSÃO DOS DADOS DE FORNECEDORES 

INSERT INTO tb_supplyers(supplyer_idpj)
VALUES
	(
		4
    ),
    (
		3
    );
*/
    
/* INCLUSÃO DOS LOCAIS DE ESTOQUE 
INSERT INTO tb_storage(storagelocation)
VALUES
	(
		'Fala Piá'
    ),
	(
		'Uai'
    ),
	(
		'Oh Mêo'
    ),
	(
		'Caraca Bicho'
    ),
	(
		'Oh Pai ó'
    );
*/

/* INCLUSÃO DOS ESTOQUE DE PRODUTOS EM QUANTIDADES

INSERT INTO tb_product_storage(idproduct, idstrage, quantify)
VALUES
	(
		1,2,500
    ),
	(
		2,3,99
    ),
	(
		3,1,154
    ),
	(
		4,5,144
    ),
	(
		5,4,145
    ),
	(
		6,1,475
    ),
	(
		7,2,457
    ),
	(
		8,3,54
    ),
	(
		9,4,457
    ),
	(
		10,5,500
    ),
	(
		11,4,547
    ),
	(
		12,3,457
    ),
	(
		13,5,555
    ),
	(
		14,2,500
    ),
	(
		15,1,21
    ),
	(
		1,5,454
    ),
	(
		2,4,150
    ),
	(
		12,2,9900
    );
*/

/* INCLUSAO DOS DADOS DE PF 
INSERT INTO tb_pf(pf_idclient,Fname,Minit,Lname,CPF)
VALUES
	(
		1, 'Flávia', 'D', 'Ariana', 12345678910
    ),
	(
		2, 'Nami', 'D', 'Arlong', 12345678911
    ),
	(
		3, 'Ussop', 'F', 'Yassop', 12345678912
    ),
	(
		4, 'Portgas', 'D', 'Ace', 12345678913
    ),
	(
		5, 'Charllote', 'K', 'Lilin', 12345678914
    ),
	(
		6, 'Kaidou', 'das', 'Feras', 12345678915
    ),
	(
		7, 'Kobi', 'M', 'Marinha', 12345678916
    ),
	(
		8, 'Zoro', 'K', 'Roronoa', 12345678917
    ),
	(
		9, 'Sanji', 'D', 'Vismonke', 12345678918
    ),
	(
		10, 'Chopper', 'T', 'Toni', 12345678919
    );
*/

/* INCLUSÃO DE PRODUTOS FORNECIDOS 
INSERT INTO tb_supply(suply_idsupplyer,suply_idproduct)
VALUES
	(
		1, 1
	),
	(
		2,8
	),
	(
		1, 2
	),
	(
		2,9
	),
	(
		1, 3
	),
	(
		2,10
	),
	(
		1, 4
	),
	(
		2,11
	),
	(
		1, 4
	),
	(
		2,12
	),
	(
		1, 5
	),
	(
		2,13
	),
	(
		1, 6
	),
	(
		2,14
	),
	(
		1, 7
	),
	(
		2,15
	),
	(
		1, 8
	),
	(
		2,7
	);
*/

/* INCLUSÃO DE PRODUTOS MARKETPLACE 
INSERT INTO tb_mkproducts(mk_idseller,mk_idproduct,mkmargin)
VALUES
	(
		5, 8, 15
    ),
    (
		6, 1, 15
    ),
	(
		5, 9, 10
    ),
    (
		6, 2, 5
    ),
	(
		5, 10, 15
    ),
    (
		6, 3, 7.5
    ),
	(
		5, 11, 11
    ),
    (
		6, 4, 15
    ),
	(
		5, 12, 15
    ),
    (
		6, 5, 15
    ),
	(
		5, 13, 8
    ),
    (
		6, 6, 15
    ),
	(
		5, 14, 4.5
    ),
    (
		6, 7, 6
    ),
	(
		5, 15, 4
    ),
    (
		6, 8, 2.3
    ),
	(
		5, 7, 1.5
    );
*/

# Simples Consulta de levantamento de clientes cadastrados
SHOW TABLES;
	DESC tb_seller;
		select count(*) as Clientes_Ativos from tb_client;

# Quais clientes que realizaram uma compra já tiveram os pedidos pagos, e o pagamento confirmado?
# Dentro disso qual foi a forma de pagamento ?
SELECT concat(pf.Fname, ' ', pf.Minit, ' ', pf.Lname) as Cliente, os.idorder, os.os_status,pay.pay_type, pay.pay_value, pay.cashback
	FROM tb_orders as os INNER JOIN tb_payment as pay
		on os.idorder = pay_idorder
	INNER JOIN tb_client as c
		on c.idclient = pay_idclient
    INNER JOIN tb_pf as pf 
		on pf.pf_idclient = c.idclient
	WHERE os.os_status = 'pago' AND pay.pay_status = 'confirmado';

# Qual a forma de pagamento mais escolhida pelos clientes ? 
SELECT pay_type, count(pay_type) as Volume FROM tb_payment
	GROUP BY pay_type
    ORDER BY Volume DESC;

SELECT avg(pay_value);
# Qual o produto com maior quantidade em estoque no local 'uai' ?
select p.Pname, st.storagelocation, ps.quantify as Quantidade from tb_product_storage as ps
	right join tb_storage as st
		on st.idstorage = ps.idstrage
	left join tb_products as p
		on p.idproduct = ps.idproduct
			GROUP BY Pname
            HAVING sum(ps.quantify) > 0 AND st.storagelocation = 'Uai'
            ORDER BY Quantidade DESC
            LIMIT 1 ;