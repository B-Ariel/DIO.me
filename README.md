# Database-Experience
**Desafios de projeto do Database Experience da Dio.me**

## Resposta ##

###Resposta: ###

- Foi escolhido ter duas tabelas para os CLIENTES PJ e PF pelo seguinte motivo:
Como o PF refere-se a qualquer pessoa como indivíduo, e PJ representa uma entidade formada por um grupo de pessoas, está 
mais do que claro que fazer uma separação é a melhor escolha, já que isso facilitaria não só uma leitura mais fácil, mas também 
um gerenciamento dos usuários e do financeiro, já que existem diversos usuários e diversas formas de pagamento, então a junção
deles iria criar uma leitura cansativa, já que seria muita informação para ler em uma só entidade.
Então, como forma de facilitar a leitura e o entendimento do modelo conceitual, foi preferido separar em entidades diferentes.


- Foi escolhido ter uma tabela diferente para o PAGAMENTO pelo seguinte motivo:
Como se trata de diversas formas de pagamento e por terem os clientes separados em entidades diferentes, isso iria causar muita
redundância caso todas essas informações ficassem nas mesmas tabelas dos clientes.


- Foi escolhido ter uma única entidade para o PEDIDO e para ENTREGA pelo seguinte motivo:
Como se trata de uma informação muito curta, sensível e única do pedido, a separação iria causar uma redundância da
informação.

