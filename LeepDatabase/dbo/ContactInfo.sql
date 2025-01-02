CREATE TABLE [dbo].[ContactInfo] (
    [ProfileId] INT           NOT NULL,
    [Value]     VARCHAR (320) NOT NULL,
    [Type]      TINYINT       NOT NULL,
    [Privacy]   TINYINT       NOT NULL,
    FOREIGN KEY ([Privacy]) REFERENCES [dbo].[PrivacyLevel] ([Id]),
    FOREIGN KEY ([ProfileId]) REFERENCES [dbo].[Profile] ([Id]),
    FOREIGN KEY ([Type]) REFERENCES [dbo].[ContactInfoTypes] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_ContantInfo_Privacy_PrivacyLevel_Id]
    ON [dbo].[ContactInfo]([Privacy] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_ContantInfo_ProfileId_Profile_Id]
    ON [dbo].[ContactInfo]([ProfileId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_ContantInfo_Type_ContactInfoType_Id]
    ON [dbo].[ContactInfo]([Type] ASC);


GO

