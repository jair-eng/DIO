--- Criancao de Banco de Dados no Cenario de E-commerce
create database if not exists ecommerce;
use ecommerce;



create table clients(
	idClient int auto_increment  primary key,
    Fname varchar(15) not null,
    Minit char(3),
    Lname varchar(15),
    CPF char(11) ,
    CNPJ char(15),
    Bdate date,
    Address varchar(30),
     
    constraint unique_cpf_client unique (CPF),
    constraint unique_cnpj_client unique (CNPJ)
);
 alter table clients auto_increment = 1;


create table product(
	idProduct int auto_increment primary key,
    Pname varchar(15) not null,
    classification_kids boolean default false,
    cartegory enum('Eletronicos','Vestimenta','Brinquedos', 'Alimentos','Moveis')not null,
    avaliacao float,
    size varchar(10),
    Address varchar(30)
     
   );
   
   alter table product auto_increment = 1;
   
   create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0  
     
   );
   
   create table payments(
	idPayment int auto_increment primary key,
    typePayment enum('Boleto','Cartao', 'Dois cartoes'),
    limitAvailable float
     
   );
   
    alter table payments auto_increment = 1;
   
   create table orders(
	idOrders int auto_increment primary key,
    idOrderClient int,    
    orderStatus enum('Confirmado','Cancelado','Em Processamento')default 'Em Processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false,
    idOPayment int, 
     constraint fk_orders_client foreign key (idOrderClient) references clients(idClient),
     constraint fk_orders_payment foreign key (idOPayment) references payments(idPayment)
     
     
   );
   alter table orders auto_increment = 1;
   
	create table supplier(
		idSupplier int auto_increment primary key,
        socialName varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique(CNPJ)
              
   );
   alter table supplier auto_increment = 1;
   
	create table seller(
		idPseller int auto_increment primary key ,
		socialName varchar(255) not null,
		absName varchar(255),
		CNPJ char(15),
        CPF char(9),
        location varchar(255),
        contact char(11),
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)   
   
   );
   alter table seller auto_increment = 1;
   
   create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller,idPproduct),
    constraint fk_product_seller foreign key(idPseller) references seller(idPSeller),
    constraint fk_Product_product foreign key(idPproduct) references product(idProduct)   
      
   );
   
    create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
	poStatus enum('Disponivel','Sem Estoque')default 'Disponivel',    
    primary key (idPOproduct,idPOorder),
    constraint fk_productorder_product foreign key(idPOproduct) references product(idProduct),
    constraint fk_productorder_order foreign key(idPOorder) references orders(idOrderClient)   
      
   );
   
   create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar (255) not null,    
    primary key (idLproduct,idLstorage),
    constraint fk_storage_location_product foreign key(idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key(idLstorage) references productStorage(idProdStorage)   
      
   );
   
	create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,    
    primary key (idPsSupplier,idPsProduct),
    constraint fk_product_supplier_supplier foreign key(idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key(idPsProduct) references product(idProduct)   
      
   );
   
   create table delivery(
   idDelivery int auto_increment primary key ,
   idOrderDelivery int,
   codRastreio varchar(45),
   statusDelivery enum('Delivered','processing','on the way') default 'processing',
   constraint fk_delivery_order foreign key(idOrderDelivery) references orders(idOrders)
   
     
   );
   
    alter table delivery auto_increment = 1;