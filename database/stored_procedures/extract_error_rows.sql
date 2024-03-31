USE [KoreAssignment_Daniel_Hou]
GO
/****** Object:  StoredProcedure [dbo].[extract_error_rows]    Script Date: 3/31/2024 4:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[extract_error_rows] 

AS
BEGIN
		-- Conditions for error records include: missing UserID, Faulty Email, or Purchase Total.
		-- Reason because UserID is main identifier, faulty email means we cant communicate with them, 
		-- and purchase total is a seemingly important metric.
		-- Other columns are less important so can be left as NULL
		SELECT * FROM stg.Users 
		WHERE UserID is NULL 
		OR Email IS NULL OR Email NOT LIKE '_%@__%.__%' 
		OR PurchaseTotal is NULL;

		-- After retrieving the faulty rows, remove them from the staging table
		DELETE FROM stg.Users 
		WHERE UserID in (
			SELECT UserID FROM stg.Users 
			WHERE Email IS NULL OR Email NOT LIKE '_%@__%.__%' 
			OR PurchaseTotal is NULL
		) OR UserID is NULL;
END
