# SQL Coursework

This repository currently contains one Microsoft SQL Server lab: a query that lists departments alongside their faculties and department heads.

## Query and example result

[Lab 1 SQL script](labs/lab01/USE%20UniversityPerformance%3B.sql) selects `Department`, `Faculty`, and `HeadFullName` from `dbo.Departments` and `dbo.Faculties`. It joins the tables on `d.FacultyId = f.FacultyId` and sorts the output by department name. Because this is an inner join, departments without a matching faculty do not appear.

Illustrative result, assuming a department named *Applied Mathematics* has `FacultyId = 2` and the faculty with `FacultyId = 2` is named *Engineering*:

| Department | Faculty | HeadFullName |
| --- | --- | --- |
| Applied Mathematics | Engineering | Olena Kovalenko |

These names are example data, not rows from a database in this repository. The actual result depends on the contents of `UniversityPerformance`; no database, schema-creation script, or recorded query output is included.

## Run Lab 1

1. Connect to Microsoft SQL Server with a client that supports the `GO` batch separator, such as SQL Server Management Studio.
2. Use an existing `UniversityPerformance` database containing `dbo.Departments` (`Name`, `HeadFullName`, `FacultyId`) and `dbo.Faculties` (`FacultyId`, `Name`).
3. Open and run the [Lab 1 script](labs/lab01/USE%20UniversityPerformance%3B.sql). The query result appears in your SQL client's results pane.

The script selects the database with `USE` and reads data with `SELECT`; it does not modify table data.
