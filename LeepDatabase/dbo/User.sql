CREATE TABLE [dbo].[User] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]   NVARCHAR (100) NOT NULL,
    [LastName]    NVARCHAR (100) NOT NULL,
    [Email]       VARCHAR (100)  NOT NULL,
    [PhoneNumber] VARCHAR (32)   NULL,
    [Country]     NVARCHAR (100) NOT NULL,
    [City]        NVARCHAR (200) NULL,
    [IsActive]    BIT            DEFAULT ((1)) NOT NULL,
    [IsArchived]  BIT            DEFAULT ((0)) NOT NULL,
    [IsBlocked]   BIT            DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);


GO

