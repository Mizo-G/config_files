CREATE TABLE [dbo].[SocialMediaLinks] (
    [ProfileId] INT            NOT NULL,
    [Site]      TINYINT        NOT NULL,
    [Value]     VARCHAR (2083) NOT NULL,
    [Privacy]   TINYINT        NOT NULL,
    FOREIGN KEY ([Privacy]) REFERENCES [dbo].[PrivacyLevel] ([Id]),
    FOREIGN KEY ([ProfileId]) REFERENCES [dbo].[Profile] ([Id]),
    FOREIGN KEY ([Site]) REFERENCES [dbo].[SocialMediaSite] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_SocialMediaLinks_ProfileId_Profile_Id]
    ON [dbo].[SocialMediaLinks]([ProfileId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_SocialMediaLinks_Privacy_PrivacyLevel_Id]
    ON [dbo].[SocialMediaLinks]([Privacy] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_SocialMediaLinks_Site_SocialMediaSite_Id]
    ON [dbo].[SocialMediaLinks]([Site] ASC);


GO

