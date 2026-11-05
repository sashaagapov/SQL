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

## Verified output
Each transaction script was run on a fresh SQL Server 2022 instance with the demonstration data. `PerformanceId = 1` starts at grade 96.

| Script | Step | Grade | Notes |
| --- | --- | --- | --- |
| `04_transaction_rollback.sql` | Inside the transaction | 95 | The update trigger wrote an audit row (96 → 95). |
| | After `ROLLBACK` | 96 | The audit row was rolled back with the update. |
| `05_commit_vs_rollback.sql` | After `COMMIT` | 95 | The change is permanent until the script restores it. |
| | After `ROLLBACK` | 96 | The temporary change was cancelled. |
| `06_nested_transactions.sql` | After outer / inner `BEGIN` | `@@TRANCOUNT` = 1 / 2 | |
| | After inner `COMMIT` | `@@TRANCOUNT` = 1 | The outer transaction still decides the result. |
| | After outer `ROLLBACK` | 96 | Everything was undone. |
| `07_savepoint.sql` | After second update | 94 | |
| | After rollback to the savepoint | 95 | Only the second change was undone. |
| | After final `ROLLBACK` | 96 | |

## Run
Run the audit table script, then the three trigger scripts. The transaction examples use `PerformanceId = 1`; review its original value before running. They restore the final grade, but the commit example intentionally records audit history.
