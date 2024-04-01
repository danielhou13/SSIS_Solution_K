# SSIS_Solution_K

This is my solution for the K assessment. The solution is in the folder `Package Solution/K Assessment Asolution/`. The package contains 3 connection managers, two flat file connection managers that need directory paths, as well as 1 database connector.
Additionally, there are 2 user-defined variables `User::ErrorRows` (for extracting error rows from staging table), and `User::Filename` (which contains the path to the `data/data.csv` file). `User::Filename` variable will likely need to be changed for your machine depending on where this repo is stored.

## CSV Files 

CSV files are stored in the "data" folder. The main data.csv file is contained in this folder as well as the error.csv file (for redirected error rows).

## Database Setup/Restore

All database setup files are located in the `database` folder. Inside includes a setup.sql folder used to intialize the database on local (with the appropriate name instead of `{FirstName_LastName}`).
A backup zip and file is included to restore the database called "KoreAssignment_Daniel_hou.bak". The database restore will have two stored procedures for removing duplicate values and redirecting error rows to the above "data/error.csv file".

There is also a folder of stored procedures used to clean the staging table; however, the full database backup will include all stored procedures used.
