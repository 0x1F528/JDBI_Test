-- =========================================
-- Create Graph Node Template
-- =========================================
USE NoodleBase
GO

IF OBJECT_ID('dbo.Noodle', 'U') IS NOT NULL
  DROP TABLE dbo.Noodle
GO

CREATE TABLE dbo.Noodle
(
	id int IDENTITY(1,1),
	content nvarchar(MAX) NULL,
    createdOn datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	modifiedOn datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,

	CONSTRAINT PK_Noodle PRIMARY KEY (id),
)
GO

