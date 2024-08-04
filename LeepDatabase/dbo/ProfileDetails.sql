CREATE TABLE [dbo].[ProfileDetails] (
    [ProfileId]      INT           NOT NULL,
    [CreatedDate]    DATETIME2 (7) DEFAULT (getutcdate()) NOT NULL,
    [LastChangeDate] DATETIME2 (7) DEFAULT (getutcdate()) NOT NULL,
    FOREIGN KEY ([ProfileId]) REFERENCES [dbo].[Profile] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_ProfileDetails_ProfileId_Profile_Id]
    ON [dbo].[ProfileDetails]([ProfileId] ASC);


GO

