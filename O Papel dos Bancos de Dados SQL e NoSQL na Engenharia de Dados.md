---
# **BANCO DE DADOS (BD) – CONCEITOS FUNDAMENTAIS**
### Definição  
Um banco de dados (bd) é um sistema de armazenamento de informações que permite a coleta, o armazenamento, a recuperação e a manipulação de dados de maneira eficiente.  

### Componentes Principais  
- Dados: Informação armazenada.  
- SGBD (Sistema Gerenciador de Banco de Dados): Software que gerencia o BD (ex.: MySQL, PostgreSQL, MongoDB).  
- Usuários: Quem acessa o BD (administradores, desenvolvedores, analistas). 
- Consultas: Comandos para manipular dados (SQL, NoSQL).  
- Índices: Estruturas que aceleram buscas.  
- Transações: Conjunto de operações atômicas.  

### Arquitetura  
1. Monolítica: O SGBD roda tudo em um único servidor.  
2. Cliente-Servidor: BD separado da aplicação.  
3. Distribuída: Dados espalhados em vários servidores.  
4. Nuvem: Infraestrutura escalável na nuvem (AWS RDS, Firebase).  

---
# **BANCOS RELACIONAIS (SQL)**
**Os bancos de dados relacionais (RDBMS - Relational Database Management Systems) armazenam dados em tabelas e utilizam a linguagem SQL (Structured Query Language)**. 

### Características  
Baseado em tabelas: Dados organizados em linhas e colunas.  
Esquema rígido da tabela tem um esquema predefinido (ex.: tipos de dados).  
CID: Propriedades para garantir consistência:  
   - Atomicidade: Tudo ou nada.  
   - Consistência: O BD nunca entra em um estado inválido.  
   - Isolamento: Transações independentes.  
   - Durabilidade: Dados persistem após falha.  

### Modelagem de Dados  
1. Entidade-Relacionamento (ER): Usa diagramas com entidades e relacionamentos.  
2. Normalização: Processo para evitar redundâncias e anomalias (1FN, 2FN, 3FN...).  
3. Denormalização: Otimização para melhorar performance.  

### Comandos SQL  
#### **DDL (Data Definition Language)**  
- `CREATE TABLE` – Criar tabela.  
- `ALTER TABLE` – Modificar tabela.  
- `DROP TABLE` – Remover tabela.  

#### **DML (Data Manipulation Language)**  
- `SELECT` – Consultar dados.  
- `INSERT` – Inserir dados.  
- `UPDATE` – Atualizar dados.  
- `DELETE` – Excluir dados.  

#### **DCL (Data Control Language)**  
- `GRANT` – Conceder permissões.  
- `REVOKE` – Remover permissões.  

#### **TCL (Transaction Control Language)**  
- `COMMIT` – Confirmar transação.  
- `ROLLBACK` – Reverter transação.  

### Índices e Performance  
- Índices B-Tree: Usados na maioria dos bancos relacionais.  
- Índices Hash: Efetivos para buscas exatas.  
- Views e Materialized Views: Melhoram consultas complexas.  
- Sharding: Divide dados entre múltiplos servidores.  
- Partitioning: Melhora desempenho segmentando dados.  

### Exemplos de Bancos Relacionais  
MySQL – Popular e open-source.  
PostgreSQL – Avançado, suporta JSON e extensões.  
Oracle – Corporativo e robusto.  
SQL Server – Microsoft, integração com .NET.  
MariaDB – Fork do MySQL.  

---

# **BANCOS NÃO RELACIONAIS (NoSQL)**
**Os bancos NoSQL surgiram para atender grandes volumes de dados, escalabilidade horizontal e flexibilidade de esquema**.  

### Tipos de Bancos NoSQL  
Chave-Valor – Estrutura simples (`{chave: valor}`).  
   - Exemplo: Redis, DynamoDB.  
Documento – Armazena JSON ou BSON.  
   - Exemplo: MongoDB, CouchDB.  
Colunar – Organiza dados por colunas (eficiente para Big Data).  
   - Exemplo: Cassandra, HBase.  
Grafos – Usa vértices e arestas para modelar conexões complexas.  
   - Exemplo: Neo4j, ArangoDB.  

### Características  
Esquema Flexível – Estruturas dinâmicas.  
Escalabilidade Horizontal – Distribui carga entre vários servidores.  
Eventual Consistency – Algumas implementações sacrificam consistência forte por performance.  
BASE (Basic Availability, Soft-state, Eventual consistency) – Alternativa ao ACID:  
   - Disponibilidade Básica – O BD sempre responde.  
   - Estado Flexível – Os dados podem estar temporariamente inconsistentes. 
   - Consistência Eventual – A consistência é garantida em algum momento.  

### Exemplos de Uso  
Redis – Cache e armazenamento de sessões.  
MongoDB – Dados semi-estruturados e APIs.  
Cassandra – Streaming e IoT.  
Neo4j – Redes sociais e grafos complexos.  

---

# **SQL vs. NoSQL – Quando Usar?**
| Característica | SQL | NoSQL |
|--------------|-----|------|
| Estrutura | Tabelas (rigidez) | Flexível (JSON, chave-valor, grafos) |
| Escalabilidade | Vertical (hardware melhor) | Horizontal (mais servidores) |
| Consistência | ACID (transações fortes) | BASE (eventual consistency) |
| Velocidade | Melhor para transações | Melhor para grandes volumes |
| Uso Ideal | ERP, CRM, Finanças | Big Data, IoT, redes sociais |

---

# **TENDÊNCIAS & INSIGHTS**  
Multimodelo: Bancos que combinam SQL + NoSQL (ex.: PostgreSQL suporta JSON).  
Serverless Databases: AWS Aurora, Firebase Firestore.  
Edge Computing + BD Distribuído: Dados processados na borda para menor latência.  
AI & Machine Learning em BD: Indexação automática, predição de consultas.  
Blockchain & BD: Bancos descentralizados com rastreabilidade.  
---
