# Lab 07 — Aggregates and grouping

Calculate an average, list grades, filter by discipline and grade, and find students whose maximum grade is at most 60. The queries use `AVG`, `CAST`, joins, `WHERE`, `GROUP BY`, `MAX` and `HAVING`.

## File
[Aggregate and filtering queries](01_queries.sql)

## Result
The current coursework database returned an average grade of 90.5. No rows matched the maximum-grade condition in the current coursework dataset.

## Verified output
On a fresh SQL Server 2022 instance after Labs 02–06, the demonstration dataset gives the same results:

| Query | Result |
| --- | --- |
| `AVG` of all grades | `90.50` |
| Grades for the discipline «Бази даних» with grade 96 | Студент 1 |
| Students whose maximum grade is at most 60 | no rows |

The full grade list has ten rows, from 96 (Студент 1, «Бази даних») down to 83 (Студент 9 and Студент 10).

## Run
Run against an existing database with `Students`, `Disciplines` and `Performance`, or after Labs 02–06 on the demonstration dataset.
