Forza Horizon 6 - Database Ecosystem

![SQLITE](https://img.shields.shields.shields.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)

##  Sobre o Projeto
Este projeto simula o ecossistema de banco de dados relacional para o backend do jogo **Forza Horizon 6**. O objetivo principal foi projetar, estruturar e povoar uma base de dados robusta contendo **20 marcas globais e 400 modelos de veículos**, aplicando padrões rigorosos de Engenharia de Dados, normalização e integridade referencial.

---

##  Influência Educacional & Fundamentos

O sucesso na arquitetura deste ecossistema foi consolidado através do conhecimento adquirido em duas frentes principais:

* **Alura (SQLite):** Proporcionou o domínio prático do ecossistema *serverless* do SQLite. Compreendi profundamente como o SGBD gerencia dados diretamente em um único arquivo em disco, além de aplicar de forma eficiente cláusulas de manipulação de dados (`DML`) seguras e o comportamento da restrição `AUTOINCREMENT`.
* **Coursera (Databases and SQL for Data Science with Python):** Forneceu a base conceitual sobre modelagem relacional e Álgebra Relacional. Através desta formação, apliquei de forma estrita as **Restrições de Integridade** (Entidade, Referencial e Domínio), garantindo que as tabelas mantivessem consistência absoluta para suportar futuras análises analíticas de Data Science e Inteligência Artificial.

---

##  Pipeline de Desenvolvimento

### 1. Arquitetura do SGBD
O **SQLite** foi selecionado pela sua portabilidade e eficiência em ambientes de microsserviços e aplicações locais. O desenvolvimento e validação dos scripts foram realizados utilizando a interface do **SQLite Online**.

### 2. Modelagem Relacional e Estrutura (DDL)
A base foi normalizada para mitigar a redundância de dados e anomalias de inserção, adotando uma cardinalidade de **1 para Muitos (1:N)**:
* **Tabela Marcas (Tabela Pai):** Chave Primária (`PRIMARY KEY`) indexada para garantir a unicidade de cada fabricante do festival.
* **Tabela Carros (Tabela Filho):** Chave Estrangeira (`FOREIGN KEY`) mapeada de forma explícita, criando uma restrição de integridade que impede registros de veículos órfãos e garante a consistência referencial do catálogo.
* **Idempotência (Boas Práticas):** O script inicia com comandos `DROP TABLE IF EXISTS` ordenados inversamente ao nível de dependência (removendo a tabela filho antes da tabela pai), garantindo a reprodutibilidade infinita do ambiente a partir do zero.

### 3. Inserção Massiva de Dados (DML)
Para povoar o ecossistema com uma volumetria realista (400 veículos distribuídos igualmente), utilizei a técnica de **Inserção em Lote (Bulk Insert)**.
* **Otimização:** Essa abordagem reduz drasticamente a latência de I/O em disco e o *overhead* de abertura de transações (`COMMITs`), tornando a carga de dados exponencialmente mais rápida do que inserções isoladas.
* **Ordem de Carga:** Respeitou-se estritamente o fluxo relacional: a tabela pai foi completamente populada antes da tabela filho receber as referências de ID.

### 4. Extração de Inteligência de Negócio (DQL)
A camada analítica do projeto faz uso de junções para reconstruir a informação normalizada na memória RAM no momento da consulta:
* **INNER JOIN:** Acoplamento preciso baseado na igualdade dos identificadores de marca, permitindo cruzar dinamicamente cada modelo de carro com sua respectiva montadora e país de origem.

```sql
SELECT 
    carros.nome_carro,
    marcas.nome_marca,
    marcas.pais_origem
FROM carros
INNER JOIN marcas ON carros.id_marca = marcas.id_marca;
