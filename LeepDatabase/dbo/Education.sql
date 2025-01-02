CREATE TABLE [dbo].[Education] (
    [ProfileId] INT           NOT NULL,
    [Type]      TINYINT       NOT NULL,
    [Value]     VARCHAR (255) NOT NULL,
    [Privacy]   TINYINT       NOT NULL,
    FOREIGN KEY ([Privacy]) REFERENCES [dbo].[PrivacyLevel] ([Id]),
    FOREIGN KEY ([ProfileId]) REFERENCES [dbo].[Profile] ([Id]),
    FOREIGN KEY ([Type]) REFERENCES [dbo].[EducationType] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_Education_Type_EducationType_Id]
    ON [dbo].[Education]([Type] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Education_ProfileId_Profile_Id]
    ON [dbo].[Education]([ProfileId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Education_Privacy_PrivacyLevel_Id]
    ON [dbo].[Education]([Privacy] ASC);


GO

