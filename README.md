# Forza Horizon — Banco de Dados Relacional

Projeto de modelagem e implementação de um banco de dados relacional em SQLite para representar marcas e veículos do universo de Forza Horizon.

O projeto foi desenvolvido para praticar conceitos de SQL, modelagem relacional, relacionamentos entre tabelas, integridade de dados e consultas utilizando JOIN.

---

## Sobre o projeto

A proposta foi criar uma estrutura simples e organizada para armazenar informações sobre fabricantes e veículos.

O banco possui duas tabelas relacionadas:

```text
marcas
   |
   | 1:N
   |
carros
```

Uma marca pode possuir vários carros, enquanto cada carro pertence a uma única marca.

O projeto inclui a criação das tabelas, inserção dos dados e consultas para relacionar as informações armazenadas.

---

## Tecnologias utilizadas

- **SQLite** — banco de dados relacional
- **SQL** — criação, inserção e consulta dos dados
- **SQLite Online** — ambiente utilizado para desenvolvimento e testes

---

## Estrutura do banco

### Tabela `marcas`

| Coluna | Tipo | Restrição |
|---|---|---|
| `id_marca` | INTEGER | PRIMARY KEY AUTOINCREMENT |
| `nome_marca` | TEXT | NOT NULL |
| `pais_origem` | TEXT | NOT NULL |

### Tabela `carros`

| Coluna | Tipo | Restrição |
|---|---|---|
| `id_carro` | INTEGER | PRIMARY KEY AUTOINCREMENT |
| `nome_carro` | TEXT | NOT NULL |
| `id_marca` | INTEGER | FOREIGN KEY |

---

## O que foi praticado

- [x] Criação de tabelas com SQL
- [x] Chaves primárias
- [x] Chaves estrangeiras
- [x] Relacionamentos 1:N
- [x] Restrições `NOT NULL`
- [x] Inserção de dados
- [x] Consultas com `SELECT`
- [x] Utilização de `INNER JOIN`
- [x] Organização de dados em tabelas relacionadas
- [x] Normalização básica de dados

---

## Exemplo de consulta

Uma das consultas utilizadas relaciona os veículos às respectivas marcas:

```sql
SELECT
    carros.nome_carro,
    marcas.nome_marca,
    marcas.pais_origem
FROM carros
INNER JOIN marcas
    ON carros.id_marca = marcas.id_marca;
```

O resultado permite visualizar o veículo, sua fabricante e o país de origem da marca em uma única consulta.

---

## Estrutura do projeto

```text
forza-horizon/
├── data_base_forza_horizon.sql
└── README.md
```

---

## Como executar

O arquivo `data_base_forza_horizon.sql` pode ser executado em qualquer ambiente compatível com SQLite.

### Pelo terminal

```bash
sqlite3 forza.db < data_base_forza_horizon.sql
```

### SQLite Online

O script também pode ser executado diretamente no SQLite Online:

https://sqliteonline.com/

---

## Objetivo do estudo

Este projeto faz parte dos meus estudos de banco de dados e SQL.

O objetivo foi colocar em prática conceitos fundamentais de bancos relacionais antes de avançar para consultas e projetos de análise de dados mais complexos.

---

## Autor

**Enuk Nogueira**

Estudante de Big Data e Inteligência Analítica pela PUCPR, com foco em Análise de Dados e Ciência de Dados.

[![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/enuknogueira/)

[![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/EnukNogueira)
