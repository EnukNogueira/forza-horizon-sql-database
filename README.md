# Forza Horizon — SQL Database Ecosystem

Banco de dados relacional em SQLite modelando o ecossistema de veículos do Forza Horizon: 20 marcas globais e 400 modelos, com normalização completa, integridade referencial e queries analíticas.

---

## Sobre o projeto

Este projeto simula o backend de banco de dados de um jogo de corrida open world. O objetivo foi projetar, estruturar e popular uma base relacional robusta aplicando padrões reais de Engenharia de Dados: modelagem normalizada, restrições de integridade, bulk insert e extração de inteligência via SQL.

---

## Tecnologias utilizadas

- **SQLite** — SGBD serverless, portável e eficiente para ambientes locais e microsserviços
- **SQL** — DDL, DML e DQL
- **SQLite Online** — ambiente de desenvolvimento e validação dos scripts

---

## Estrutura do banco de dados

O banco segue uma cardinalidade **1 para Muitos (1:N)**:

```
marcas (tabela pai)
  └── carros (tabela filho)
```

### Tabela `marcas`

| Coluna | Tipo | Restrição |
|---|---|---|
| id_marca | INTEGER | PRIMARY KEY AUTOINCREMENT |
| nome_marca | TEXT | NOT NULL |
| pais_origem | TEXT | NOT NULL |

### Tabela `carros`

| Coluna | Tipo | Restrição |
|---|---|---|
| id_carro | INTEGER | PRIMARY KEY AUTOINCREMENT |
| nome_carro | TEXT | NOT NULL |
| id_marca | INTEGER | FOREIGN KEY → marcas(id_marca) |

---

## Pipeline de desenvolvimento

**1. Arquitetura (DDL)** — criação das tabelas com restrições de integridade de entidade, referencial e domínio. Script inicia com `DROP TABLE IF EXISTS` em ordem inversa de dependência para garantir idempotência total.

**2. Carga de dados (DML)** — bulk insert de 20 marcas e 400 veículos distribuídos por fabricante. A tabela pai é populada integralmente antes da tabela filho receber as referências de ID.

**3. Consultas analíticas (DQL)** — INNER JOIN para reconstruir em memória a relação normalizada entre veículos e marcas:

```sql
SELECT
    carros.nome_carro,
    marcas.nome_marca,
    marcas.pais_origem
FROM carros
INNER JOIN marcas ON carros.id_marca = marcas.id_marca;
```

---

## Conceitos aplicados

- Normalização relacional para eliminar redundância e anomalias de inserção
- Restrições de integridade: entidade (PRIMARY KEY), referencial (FOREIGN KEY) e domínio (NOT NULL)
- Idempotência via `DROP TABLE IF EXISTS` com ordem de dependência respeitada
- Bulk insert para reduzir overhead de I/O e transações em cargas massivas

---

## Como executar

O script `data_base_forza_horizon.sql` pode ser executado em qualquer cliente SQLite:

```bash
# Via terminal
sqlite3 forza.db < data_base_forza_horizon.sql

# Ou abra no SQLite Online: https://sqliteonline.com/
```

---

## Autor

**Enuk Nogueira** — Desenvolvedor focado em Engenharia de Dados e Automação de Processos

[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/enuknogueira/)
[![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/EnukNogueira)
