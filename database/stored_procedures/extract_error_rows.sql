USE [KoreAssignment_Daniel_Hou]
GO
/****** Object:  StoredProcedure [dbo].[extract_error_rows]    Script Date: 3/31/2024 3:09:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[extract_error_rows] 

AS
BEGIN
		-- Get the error rows for the result set.
		SELECT * FROM stg.Users WHERE Email IS NULL OR Email NOT LIKE '_%@__%.__%' OR PurchaseTotal is NULL;

		-- Once we obtained these rows, we can remove them from the staging table to upload into production table
		DELETE FROM stg.Users 
		WHERE UserID in (
			SELECT UserID FROM stg.Users 
			WHERE Email IS NULL OR Email NOT LIKE '_%@__%.__%' OR PurchaseTotal is NULL
		)
END
