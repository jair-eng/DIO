create database OficinaMecanica;
use OficinaMecanica;

drop database OficinaMecanica;

create table cliente(
	idCliente int primary key auto_increment,
	nome varchar(45) not null,
	endereco varchar(255),
	CPF int(9) not null ,
	  constraint unique_cpf_cliente unique(CPF)
	        );
            
           alter table cliente auto_increment=1;
            
    create table veiculo(
		idveiculo int primary key auto_increment,
        idVCliente int,
        idVMecanico int,
        modelo varchar(45) not null,
        ano char(10),
        placa varchar(10),
         constraint fk_veiculo_cliente foreign key  (idVCliente) references cliente(idcliente),
         constraint fk_veiculo_mecanico foreign key (idVMecanico) references mecanico(idmecanico)
    
		);
    drop table mecanico;
    create table mecanico(
		idmecanico int primary key,
        fname varchar(10),
        lname varchar(10),
        codigo int(10),
        endereco varchar(255),
        especialidade varchar (25)
                
		);
        alter table mecanico  auto_increment 1;
        
	create table ordemDeServico(
		idordem int primary key auto_increment,
        idOmecanico int,
        dataEmissao date not null,
        valor float,
        status varchar(50),
        dataConclusao date,
        constraint foreign key fk_ordem_mecanico (idOmecanico) references mecanico(idmecanico)       
    
		);
         alter table ordemDeServico auto_increment=1;
        
	create table tipoServico(
		idtipoServico int primary key ,
        descricao varchar(255),
        valor float
        
		);
        
        
	create table classificacaoServico(
		idclassificacaoServicoOrder int,
        idclassificacaoServicoTipo int,
        quantidade int,
       primary key (idclassificacaoServicoOrder,idclassificacaoServicoTipo),
        constraint foreign key fk_class_order (idclassificacaoServicoOrder) references ordemDeServico(idordem),
        constraint foreign key fk_class_tipo (idclassificacaoServicoTipo) references tipoServico(idtipoServico)
		);
        
         
	create table pecas(
		idpecas int primary key ,
        nome varchar(255),
        valor float
        
		);
        
        create table escolhaPecas(
		idescolhaPecasOrder int,
        idescolhaPecasTipo int,
        quantidade int,
       primary key (idescolhaPecasOrder,idescolhaPecasTipo),
        constraint foreign key fk_escolha_order (idescolhaPecasOrder) references ordemDeServico(idordem),
        constraint foreign key fk_escolha_tipo (idescolhaPecasTipo) references pecas(idpecas)
		);