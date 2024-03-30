USE [KoreAssignment_Daniel_Hou]
GO
/****** Object:  StoredProcedure [dbo].[remove_staging_duplicates]    Script Date: 3/29/2024 11:51:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[remove_staging_duplicates]
AS

BEGIN
	WITH CTE as (
		SELECT *, ROW_NUMBER() OVER (PARTITION BY UserID ORDER BY UserID) as instance_num
		FROM stg.Users
	)
	DELETE FROM CTE WHERE instance_num > 1;

END