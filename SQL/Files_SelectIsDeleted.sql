USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Files_Select_ByIsDeleted_Paginated]    Script Date: 9/25/2022 10:02:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author: <Daniel Cazarez>
-- Create date: <07/29/2022>
-- Description: <Files_Select_ByIsDeleted_Paginated>
-- Code Reviewer: Lucas Gil Montoya

-- MODIFIED BY: N/A
-- MODIFIED DATE: N/A
-- Code Reviewer: N/A
-- Note:
-- =============================================

ALTER   PROC [dbo].[Files_Select_ByIsDeleted_Paginated] 
			@PageIndex int
			,@PageSize int
			,@IsDeleted bit
AS
/* ----- TEST CODE -----

	DECLARE	@PageIndex int = 0
			,@PageSize int = 50
			,@IsDeleted bit = 1
	

	EXECUTE [dbo].[Files_Select_ByIsDeleted_Paginated] 
			@PageIndex
			,@PageSize
			,@IsDeleted

*/ ----- END TEST CODE -----

BEGIN

	DECLARE	   @offset int = @PageIndex * @PageSize

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

WHERE		f.IsDeleted = @IsDeleted
ORDER BY	f.Id
			OFFSET @offset ROWS
FETCH NEXT  @PageSize ROWS ONLY

END
