# Lab 01 — SQL Server environment

## Task
Inspect the SQL Server instance, current database, collation, edition and authentication mode.

## Files
- [01_environment.sql](01_environment.sql) contains the metadata checks.
- [Existing department query](USE%20UniversityPerformance%3B.sql) is an earlier coursework query requiring the two base tables.

## Run
Connect using a SQL Server client supporting `GO` and run the environment checks. `:ListVar` is a sqlcmd client command, not T-SQL, and can be entered separately. The original lab uses SQL Server tools on Windows; this repository keeps equivalent T-SQL checks used with a local SQL Server instance.
