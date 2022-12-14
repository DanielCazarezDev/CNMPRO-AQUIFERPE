USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Files_Select_ByCreatedBy]    Script Date: 9/25/2022 9:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: <James Hughes>
-- Create date: <06/30/2022>
-- Description: <Files_Select_ByCreatedBy>
-- Code Reviewer:

-- MODIFIED BY: Daniel Cazarez
-- MODIFIED DATE:08/20/2022
-- Code Reviewer: Saif Islam
-- Note: <Target for WHERE was incorrect. Changed from f.id to u.id, add added updated columns>
-- =============================================

ALTER   PROC [dbo].[Files_Select_ByCreatedBy] 
						@PageIndex int
						,@PageSize int
						,@CreatedBy int
as

/* ----- TEST CODE -----

	Declare		@PageIndex int = 0
				,@PageSize int = 500
				,@CreatedBy int = 135
	

	Execute [dbo].[Files_Select_ByCreatedBy] 
				@PageIndex
				,@PageSize
				,@CreatedBy

	

*/ ----- END TEST CODE -----

BEGIN

Declare	   @offset int = @PageIndex * @PageSize

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

WHERE		u.Id = @CreatedBy and isDeleted = 0
ORDER BY	f.Id
			OFFSET @offset ROWS
FETCH NEXT  @PageSize ROWS ONLY


END
