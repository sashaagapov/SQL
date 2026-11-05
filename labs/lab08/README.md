# Lab 08 — Views, functions and procedures

Create a grade journal view, a scalar teacher count function, a table-valued department function, and a faculty department count procedure. A view provides a reusable query; a scalar function returns one value, a table-valued function returns rows, and a procedure executes parameterized logic.

## Files
- [Grade journal view](01_view.sql)
- [Teacher count](02_scalar_function.sql)
- [Departments by faculty](03_table_function.sql)
- [Department count procedure](04_procedure.sql)
- [Verification queries](05_verify.sql)

## Result
In the current coursework database the teacher count was 3, the ІПЗ-21 journal had 4 rows, and the information technology faculty had 4 departments.

## Verified output
Running [`05_verify.sql`](05_verify.sql) on a fresh SQL Server 2022 instance after Labs 02–06 returns:

| Object | Result |
| --- | --- |
| `SELECT * FROM dbo.StudentGradesView WHERE GroupNumber = N'ІПЗ-21'` | 4 rows: Студент 1–4 with grades 96, 95, 94, 93 |
| `dbo.GetTeacherCount()` | `3` |
| `dbo.GetDepartmentsByFaculty()` | 9 rows: each department with its faculty |
| `EXEC dbo.GetDepartmentCount` for the faculty of information technology | `4` |

## Run
After Labs 02–06, run the four object scripts in order, then the verification script. `CREATE OR ALTER` replaces existing definitions with the same names; review before running against an existing database.
