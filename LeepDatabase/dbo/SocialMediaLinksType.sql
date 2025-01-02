CREATE TYPE [dbo].[SocialMediaLinksType] AS TABLE (
    [ProfileId] INT            NULL,
    [Site]      TINYINT        NULL,
    [Value]     VARCHAR (2083) NULL,
    [Privacy]   TINYINT        NULL);


GO

