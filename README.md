# SQL Coursework

Microsoft SQL Server coursework built around an evolving university database, from base tables through joins, grouping, security, views, functions and stored procedures.

## Labs

| Lab | Topic | Main concepts |
| --- | --- | --- |
| [Lab 01](labs/lab01/) | Server environment | sqlcmd, metadata, collation |
| [Lab 02](labs/lab02/) | Database and tables | CREATE DATABASE, primary and foreign keys |
| [Lab 03](labs/lab03/) | Inserting data | INSERT, database context |
| [Lab 04](labs/lab04/) | Filtering and changes | WHERE, LIKE, UPDATE, DELETE |
| [Lab 05](labs/lab05/) | Relationships and joins | CROSS JOIN, LEFT JOIN, RIGHT JOIN |
| [Lab 06](labs/lab06/) | Security and performance | LOGIN, USER, ROLE, permissions |
| [Lab 07](labs/lab07/) | Aggregates | AVG, GROUP BY, HAVING |
| [Lab 08](labs/lab08/) | Database programming | VIEW, functions, procedures |

## Database model

`UniversityPerformance` connects faculties, departments, groups, students, teachers, disciplines and performance records. The [relationship diagram](labs/lab05/diagram.dbml) covers the first five entities.

Scripts target Microsoft SQL Server and T-SQL. Labs 02–08 form a sequence; run setup and mutation scripts only on a fresh coursework database. Seed values are demonstration data, while results labelled as current refer to the existing coursework database.
