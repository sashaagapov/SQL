# Lab 02 — Database and base tables

Create a database with faculties and departments, identity keys and a foreign key. The seed uses demonstration names and phone values.

## Files
- [Create database](01_create_database.sql)
- [Create tables](02_create_tables.sql)
- [Insert initial data](03_seed.sql)
- [Verify counts](04_verify.sql)

## Run
Run the files in order against a fresh SQL Server database. The table and seed scripts are not repeatable against existing objects or data. The working coursework database has an ID column named `DepartmentId ` with a trailing space and lacks the faculty foreign key; the clean schema here uses `DepartmentId` and defines that relationship.
