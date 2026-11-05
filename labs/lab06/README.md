# Lab 06 — Security and performance

Practice server logins, database users and roles, then add disciplines and grades. A login authenticates at server level; a user is a database principal; roles group permissions.

## Files
- [Security setup example](01_security_setup.example.sql)
- [Inspect principals and permissions](02_security_verify.sql)
- [Academic tables and demonstration data](03_academic_tables.sql)
- [Grades above 90](04_students_over_90.sql)

## Result
The current coursework database contains six performance records with grades above 90. Credentials are intentionally omitted from the repository.

## Verified output
On a fresh SQL Server 2022 instance with the demonstration data, [`02_security_verify.sql`](02_security_verify.sql) lists the principals and the permissions granted to each role:

| Role | Permissions on schema `dbo` |
| --- | --- |
| `LabReadOnly` (member `lab6_reader`) | `SELECT` |
| `LabDataManager` (member `lab6_manager`) | `SELECT`, `INSERT`, `UPDATE`, `DELETE` |

[`04_students_over_90.sql`](04_students_over_90.sql) returns the six records with a grade above 90, highest first:

| Department | Student | Grade |
| --- | --- | --- |
| Кафедра програмних систем і технологій | Студент 1 | 96 |
| Кафедра програмних систем і технологій | Студент 2 | 95 |
| Кафедра програмних систем і технологій | Студент 3 | 94 |
| Кафедра програмних систем і технологій | Студент 4 | 93 |
| Кафедра інформаційних систем | Студент 5 | 92 |
| Кафедра інформаційних систем | Студент 6 | 91 |

All six belong to the faculty of information technology.

## Run
After Lab 05, run the table script once on a clean coursework database. The security example requires administrative privileges and a secure password; review it before execution. The verification and grade queries are read-only.
