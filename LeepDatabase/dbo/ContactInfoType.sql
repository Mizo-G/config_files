CREATE TYPE [dbo].[ContactInfoType] AS TABLE (
    [ProfileId] INT           NULL,
    [Value]     VARCHAR (320) NULL,
    [Type]      TINYINT       NULL,
    [Privacy]   TINYINT       NULL);


GO

