# Lab 06 — Security and performance

Practice server logins, database users and roles, then add disciplines and grades. A login authenticates at server level; a user is a database principal; roles group permissions.

## Files
- [Security setup example](01_security_setup.example.sql)
- [Inspect principals and permissions](02_security_verify.sql)
- [Academic tables and demonstration data](03_academic_tables.sql)
- [Grades above 90](04_students_over_90.sql)

## Result
The current coursework database contains six performance records with grades above 90. Credentials are intentionally omitted from the repository.

## Run
After Lab 05, run the table script once on a clean coursework database. The security example requires administrative privileges and a secure password; review it before execution. The verification and grade queries are read-only.
