USE [KoreAssignment_Daniel_Hou]
GO
/****** Object:  StoredProcedure [dbo].[remove_duplicates_from_staging]    Script Date: 3/31/2024 4:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[remove_duplicates_from_staging]
AS

BEGIN
	-- Duplicate userID is a great indicator of a duplicate row, so remove from staging based on UserID. 
	WITH CTE_id as (
		SELECT UserID, ROW_NUMBER() OVER (PARTITION BY UserID ORDER BY UserID) as instance_num
		FROM stg.Users
	)
	DELETE FROM CTE_id 
	WHERE (instance_num > 1);

END
