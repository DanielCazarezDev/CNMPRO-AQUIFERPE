USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Files_Delete_ById]    Script Date: 9/25/2022 9:54:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <James Hughes>
-- Create date: <06/30/2022>
-- Description: <Files_Delete_ById>
-- Code Reviewer:

-- MODIFIED BY: Daniel Cazarez
-- MODIFIED DATE:07/29/2022
-- Code Reviewer: Lucas Gil Montoya
-- Note: Modified proc to add isDeleted col bit and implement as isDelete update
-- =============================================

ALTER   PROC [dbo].[Files_Delete_ById]
			@Id int
			,@Delete bit

/*---------TEST CODE--------------

	DECLARE	@Id int = 1
			,@Delete bit = 1

	SELECT *
	FROM [dbo].[Files]
	WHERE Id = @Id

	EXECUTE dbo.[Files_Delete_ById] 
			@Id
			,@Delete

	SELECT *
	FROM dbo.Files
	WHERE Id = @Id

*/---------END TEST CODE--------------

as
BEGIN

	UPDATE	[dbo].[Files]
		SET	[IsDeleted] = @Delete
	WHERE Id = @Id
END
