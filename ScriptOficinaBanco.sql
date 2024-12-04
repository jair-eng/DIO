
           use OficinaMecanica; 
           desc table cliente;
           select * from cliente;
	insert into cliente values(1,'joao','Rua binario 148, belo horionte - MG','087544321'),
    (2,'miguel','Rua oval 123, belo horionte - MG',094432189),
    (3,'venturina','Rua congo 108, belo horionte - MG',087572189),
    (4,'marcia','Rua botocatu 140, santa luzia - MG',045544389),
    (5,'vicente','Rua cabralia 08, prado - MG',778544321),
    (6,'juan','Rua andalucia 208, lagoa - MG',546532189);
    
        
  
            select * from mecanico;
            desc mecanico;
        
        insert into mecanico values(2,'Jonas','Bicalho',1,'Rua Z','eletrica'),
			(3,'Airton','Lima',2,'Rua J','motores'),
            (4,'Ezequiel','Bos',3,'Rua D','Regrigeracao');
    
    
           
          select * from veiculo;
            desc veiculo;
        
        insert into veiculo values(1,2,2,'van',1990,'KWZ90'),
			(2,1,3,'dorge',1999,'TWZ80'),
            (3,3,3,'pampa',2000,'Tty80'),
            (4,3,4,'T-Cross',2010,'Oty90'),
            (5,5,2,'pampa',2000,'Tty80');
            
            
            select * from ordemDeServico;
            desc ordemDeServico;
            
             insert into ordemDeServico values(2,2,'1999-08-15',500,'processando','1999-08-30'),
			(3,3,'1999-07-16',600,'processando','1999-07-23'),
            (4,4,'1999-9-15',800,'processando','1999-9-25'),
            (5,3,'1999-10-13',900,'processando','1999-10-29'),
            (6,2,'1999-09-14',1000,'processando','1999-09-19');
            
            UPDATE ordemDeServico
				SET valor = 600
					WHERE idordem=4;
            UPDATE ordemDeServico
				SET valor = 700
					WHERE idordem=5;
            
            select * from tipoServico;
            desc tipoServico;
            
            
            insert into tipoServico values(1,'troca de oleo',30),
				(2,'revisao completa',1000),
                (3,'alinhar e balancear',100),
                (4,'revisao eletrica',500);
                
                 select * from classificacaoServico;
                  select * from ordemDeServico;
					desc classificacaoServico;
                    
                     insert into classificacaoServico values(2,4,1),
									(3,4,1),
                                    (3,3,1),
                                    (4,4,1),
                                    (4,3,3),
                                    (5,4,1),
                                    (5,3,4),
                                    (6,2,1);
                                    
            select * from pecas;
			desc pecas;
                    
            insert into pecas values(1,'filtro de ar',50),
									(2,'rele',100),
                                    (3,'bomba de combustivel',500);
                                    
			select * from escolhaPecas;
			desc escolhaPecas;
             insert into escolhaPecas values(4,2,2),
											(5,2,3);