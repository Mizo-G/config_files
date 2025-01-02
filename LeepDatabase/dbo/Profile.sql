CREATE TABLE [dbo].[Profile] (
    [Id]                INT             IDENTITY (1, 1) NOT NULL,
    [UserId]            INT             NOT NULL,
    [IsArchived]        BIT             DEFAULT ((0)) NOT NULL,
    [IsActive]          BIT             DEFAULT ((1)) NOT NULL,
    [IsBlocked]         BIT             DEFAULT ((0)) NOT NULL,
    [IsSelected]        BIT             DEFAULT ((1)) NOT NULL,
    [UserName]          NVARCHAR (50)   NOT NULL,
    [Handle]            NVARCHAR (50)   NOT NULL,
    [IsPersonal]        BIT             DEFAULT ((1)) NOT NULL,
    [Country]           NVARCHAR (100)  NULL,
    [City]              NVARCHAR (200)  NULL,
    [Description]       NVARCHAR (1000) NOT NULL,
    [JobTitle]          NVARCHAR (100)  NOT NULL,
    [YearsOfExperience] TINYINT         NOT NULL,
    [BirthDate]         DATETIME2 (7)   NULL,
    [Industry]          NVARCHAR (100)  NULL,
    [Company]           NVARCHAR (100)  NULL,
    [FoundedYear]       SMALLINT        NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);


GO

