USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Files_Search_Paginated]    Script Date: 9/25/2022 9:56:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <Daniel Cazarez>
-- Create date: <07/29/2022>
-- Description: <Files_Search_Paginated>
-- Code Reviewer: Lucas Gil Montoya

-- MODIFIED BY: author
-- MODIFIED DATE: date
-- Code Reviewer: 
-- Note:
-- =============================================

ALTER   PROC [dbo].[Files_Search_Paginated]
				@PageIndex int
				,@PageSize int
				,@Query nvarchar(200)
AS
/* ----- TEST CODE -----

	Declare @PageIndex int = 0
			,@PageSize int = 25
			,@Query nvarchar(200) = 'Image'

	Execute [dbo].[Files_Search_Paginated]
				@PageIndex 
				,@PageSize 
				,@Query

*/ ----- END TEST CODE -----

BEGIN

	Declare @offset int = @PageIndex * @PageSize

	SELECT f.[Id]
			,f.[Name]
			,f.[Url]
			,f.[IsDeleted]
			,ft.Id
			,ft.[Name]
			,u.[Id] as UserId
			,TotalCount = COUNT(1) OVER()

	FROM [dbo].[Files] as f inner join dbo.FileTypes as ft
						on ft.Id = f.FileTypeId 
						inner join dbo.Users as u
						on u.Id = f.CreatedBy

	WHERE f.IsDeleted = 0
	AND (f.[Name] LIKE '%' + @Query + '%'
	OR	f.[Url] LIKE '%' + @Query + '%')
	
	ORDER BY f.Id

	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY

END
