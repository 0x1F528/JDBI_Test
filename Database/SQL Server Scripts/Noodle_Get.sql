USE NoodleBase
GO

-- =============================================
-- Create basic stored procedure template
-- =============================================

-- Drop stored procedure if it already exists
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'Noodle_Get' 
)
   DROP PROCEDURE dbo.Noodle_Get
GO

CREATE PROCEDURE dbo.Noodle_Get
AS
	SELECT id, content, createdOn, modifiedOn from Noodle
GO

IF (1 = 0) BEGIN
-- =============================================
-- Example to execute the stored procedure
-- =============================================
	EXECUTE dbo.Noodle_Get 

END
GO
