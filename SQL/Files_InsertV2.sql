USE [CnmPro]
GO
/****** Object:  StoredProcedure [dbo].[Files_InsertV2]    Script Date: 9/25/2022 10:10:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Daniel Cazarez>
-- Create date: <07/29/2022>
-- Description: <Files_InsertV2>
-- Code Reviewer: Lucas Gil Montoya

-- MODIFIED BY: author
-- MODIFIED DATE: n/a
-- Code Reviewer:
-- Note:
-- =============================================


ALTER   PROC [dbo].[Files_InsertV2]
			@Name nvarchar (50)
			,@Url nvarchar (255) 
			,@FileType nvarchar(50) 
			,@CreatedBy int
			,@Id int OUTPUT

AS

/* --Test Code
Declare		@Id int = 0;

Declare		@Name nvarchar (50) = 'Dragon'
			,@Url nvarchar (255) = 'https://sabio-training.s3-us-west-2.amazonaws.com/c84a213b-160b-4fbe-b62b-38e48d40e866_Dragon.jpg'
			,@FileType nvarchar(50) = '.jpg'
			,@CreatedBy int = 3
			

EXECUTE [dbo].[Files_InsertV2] 
			@Name
			,@Url
			,@FileType
			,@CreatedBy
			,@Id OUTPUT
	
	SELECT *
	FROM [dbo].[Files] as f inner join dbo.FileTypes as ft
						on ft.Id = f.FileTypeId 
					

--*/

BEGIN

	Declare		@FileTypeId int 

	SET			@FileTypeId = (SELECT Id FROM [dbo].[FileTypes] WHERE Name = @FileType)

	INSERT INTO [dbo].[Files]
				([Name]
				,[Url]
				,[FileTypeId]
				,[CreatedBy])
				

	VALUES		(@Name
				,@Url
				,@FileTypeId
				,@CreatedBy)

	SET @Id = SCOPE_IDENTITY();

END