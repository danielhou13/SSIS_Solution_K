# SSIS_Solution_K

This is my solution for the K assessment. The package is in the folder `Package Solution/K Assessment Asolution/`. The package contains 3 connection managers, two flat file connection managers that need directory paths, as well as 1 database connector.

Additionally, there are 2 user-defined variables for scripting: `User::ErrorRows` (for extracting error rows from the staging table), and `User::Filename` (which contains the path to the `data/data.csv` file). The `User::Filename` variable will likely need to be changed for your machine depending on where this repo is stored.

The zip file `Package_Execution_results` contains the results of running the package. It has a copy of the database backup (also found in `database/backup`) and the **populated** error.csv file ( whereas the file in the `data` folder is an **empty** error.csv). 

## CSV Files 

CSV files are stored in the "data" folder. The main data.csv contains the data we want to move to production, and the **empty** error.csv file is for redirecting error rows.

## Database Setup/Restore

All database-related files are located in the `database` folder. Inside includes a setup.sql file used to initialize the database locally (with the appropriate name instead of `{FirstName_LastName}`).
A backup file is included to restore the database called "KoreAssignment_Daniel_hou.bak". The database restore will have two stored procedures for removing duplicate values and redirecting error rows to the above "data/error.csv file". *This file is also included in `Package_Execution_Results.zip`*.

The stored procedures used to clean and de-duplicate the staging table also in the `database/stored_procedures` folder for quick examination, but the full database backup will include all stored procedures used.
