# Lab 05 — Joins and relationships

Compare Cartesian products and outer joins, then add groups, students and teachers to the schema.

## Files
- [Join queries](01_joins.sql)
- [Create and seed tables](02_tables.sql)
- [Relationship diagram](diagram.dbml)

## Result
The current coursework database returned 27 rows for the cross join: 3 faculties and 9 departments. Names in the reproducible seed are demonstration data.

## Verified output
After Labs 02–04 on a fresh SQL Server 2022 instance (3 faculties, 9 departments), [`01_joins.sql`](01_joins.sql) returns:

| Query | Rows | Why |
| --- | --- | --- |
| `CROSS JOIN` | 27 | Every faculty paired with every department: 3 × 9. |
| `LEFT JOIN` | 9 | Every faculty that has departments, one row per department. |
| `RIGHT JOIN` | 9 | Every department with its faculty. |

The relationship diagram in the [repository overview](../../README.md#database-model) shows how the new `Groups`, `Students` and `Teachers` tables attach to this schema.

## Run
After Labs 02–04, run the table script once on the clean coursework database. The join queries can also be run independently against existing base tables.
