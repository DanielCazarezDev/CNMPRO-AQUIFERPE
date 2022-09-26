USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Files_SelectAll]    Script Date: 9/25/2022 10:03:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <James Hughes>
-- Create date: <06/30/2022>
-- Description: <Files_SelectAll>
-- Code Reviewer:

-- MODIFIED BY: <Daniel Cazarez>
-- MODIFIED DATE: <07/28/2022>
-- Code Reviewer: Lucas Gil Montoya
-- Note: Added is deleted column to proc and where isdeleted is zero
-- =============================================

ALTER   PROC [dbo].[Files_SelectAll]
				@PageIndex int
				,@PageSize int

as

/* ----- TEST CODE -----

	Declare @PageIndex int = 0
			,@PageSize int = 1000

	Execute [dbo].[Files_SelectAll]
				@PageIndex 
				,@PageSize 

*/ ----- END TEST CODE -----

BEGIN

	Declare @offset int = @PageIndex * @PageSize

	SELECT f.[Id]
			,f.[Name]
			,f.[Url]
			,f.[IsDeleted]
			,ft.[Id] as FileTypeId
			,ft.[Name]
			,u.[Id] as UserId
			,TotalCount = COUNT(1) OVER()

	FROM [dbo].[Files] as f inner join dbo.FileTypes as ft
						on ft.Id = f.FileTypeId 
						inner join dbo.Users as u
						on u.Id = f.CreatedBy
	WHERE IsDeleted = 0
	ORDER BY f.Id

	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY

END
