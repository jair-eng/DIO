select * from cliente;
select * from mecanico;
select * from veiculo;
select * from pecas;
select * from escolhapecas;
select * from tiposervico;
select * from classificacaoservico;

-- so do Having
select * from ordemDeServico
	having dataEmissao = '1999-08-15';


-- Relacao ordem de Servico por Mecanico

select o.idordem as Ordem_de_Servico, concat(m.fname,' ',m.lname) as Nome, m.especialidade,o.status from ordemdeservico o
						inner join mecanico m on m.idmecanico = o.idOmecanico;	
                        
-- Relacao de pecas e servicos

Select * from pecas join tiposervico;

-- Relacao pecas e Servicos por OS

select o.idordem,p.idescolhaPecasTipo,p.quantidade as quantidadePecas,s.idclassificacaoServicoTipo,
									s.quantidade as quantidadeServico from ordemdeservico o
									inner join escolhapecas p on o.idordem = p.idescolhaPecasOrder
                                    inner join classificacaoservico s on o.idordem = s.idclassificacaoServicoOrder;
                                    
-- Relacao cliente veiculo Mecanico responsavel

select c.nome as nomeCliente,v.modelo,concat(m.fname,' ',m.lname) as mecanicoResponsavel from veiculo v
						inner join mecanico m on m.idmecanico = v.idVMecanico
                        inner join cliente c on v.idVCliente = c.idCliente
                        order by nomeCliente;				
			
            
           -- Relacao por um mecanico 
            
            select c.nome as nomeCliente,v.modelo,concat(m.fname,' ',m.lname) as mecanicoResponsavel from veiculo v
						inner join mecanico m on m.idmecanico = v.idVMecanico
                        inner join cliente c on v.idVCliente = c.idCliente	
                        where m.fname like '%Jonas';
                        
-- Tipo de servico por OS

select o.idordem,s.idclassificacaoServicoTipo, s.quantidade, t.descricao,t.valor from classificacaoservico s
									inner join ordemDeServico o on o.idordem = s.idclassificacaoServicoOrder
                                    inner join tiposervico t on s.idclassificacaoServicoOrder = t.idtipoServico;
                                    
-- tipo de peca por OS

select o.idordem, es.quantidade,p.nome as nomePeca, p.valor from escolhapecas es
									inner join ordemDeServico o on o.idordem = es.idescolhaPecasOrder
                                    inner join pecas p on es.idescolhaPecasTipo = p.idpecas;


						                 
                        
                        