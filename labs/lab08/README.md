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

## Run
After Labs 02–06, run the four object scripts in order, then the verification script. `CREATE OR ALTER` replaces existing definitions with the same names; review before running against an existing database.
