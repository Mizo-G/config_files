CREATE TABLE [dbo].[Specialities] (
    [ProfileId] INT           NOT NULL,
    [Value]     VARCHAR (255) NOT NULL,
    [Privacy]   TINYINT       NOT NULL,
    FOREIGN KEY ([Privacy]) REFERENCES [dbo].[PrivacyLevel] ([Id]),
    FOREIGN KEY ([ProfileId]) REFERENCES [dbo].[Profile] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_Specialities_ProfileId_Profile_Id]
    ON [dbo].[Specialities]([ProfileId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Specialities_Privacy_PrivacyLevel_Id]
    ON [dbo].[Specialities]([Privacy] ASC);


GO

