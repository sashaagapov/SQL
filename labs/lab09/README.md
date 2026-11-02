# Lab 09 — Triggers and transactions

## Task
Record INSERT, UPDATE and DELETE activity for `dbo.Performance`, then demonstrate transaction control without leaving unwanted changes in the coursework data.

## Files
- `00_create_performance_audit.sql` creates the history table when it is missing.
- `01_insert_trigger.sql`, `02_update_trigger.sql` and `03_delete_trigger.sql` create set-based audit triggers.
- `04_transaction_rollback.sql` shows that an UPDATE and trigger side effect are both rolled back.
- `05_commit_vs_rollback.sql` compares permanent and cancelled changes, then restores the original grade.
- `06_nested_transactions.sql` displays `@@TRANCOUNT` for nested transactions.
- `07_savepoint.sql` rolls back only the second change, then rolls back the whole demonstration.

## Run
Run the audit table script, then the three trigger scripts. The transaction examples use `PerformanceId = 1`; review its original value before running. They restore the final grade, but the commit example intentionally records audit history.
