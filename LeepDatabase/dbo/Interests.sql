CREATE TABLE [dbo].[Interests] (
    [ProfileId] INT           NOT NULL,
    [Value]     VARCHAR (255) NOT NULL,
    [Privacy]   TINYINT       NOT NULL,
    FOREIGN KEY ([Privacy]) REFERENCES [dbo].[PrivacyLevel] ([Id]),
    FOREIGN KEY ([ProfileId]) REFERENCES [dbo].[Profile] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_Interests_Privacy_PrivacyLevel_Id]
    ON [dbo].[Interests]([Privacy] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Interests_ProfileId_Profile_Id]
    ON [dbo].[Interests]([ProfileId] ASC);


GO

