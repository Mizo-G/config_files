CREATE TABLE [dbo].[ProfileDisplay] (
    [ProfileId]   INT             NOT NULL,
    [Username]    NVARCHAR (50)   NOT NULL,
    [Handle]      NVARCHAR (50)   NOT NULL,
    [Description] NVARCHAR (1000) NOT NULL,
    FOREIGN KEY ([ProfileId]) REFERENCES [dbo].[Profile] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_ProfileDisplay_ProfileId_Profile_Id]
    ON [dbo].[ProfileDisplay]([ProfileId] ASC);


GO

