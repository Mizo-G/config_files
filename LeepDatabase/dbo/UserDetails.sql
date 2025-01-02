CREATE TABLE [dbo].[UserDetails] (
    [UserId]                   INT           NOT NULL,
    [IsMale]                   BIT           NOT NULL,
    [IsEmailVerified]          BIT           DEFAULT ((0)) NOT NULL,
    [IsPhoneVerified]          BIT           DEFAULT ((0)) NOT NULL,
    [Hash]                     CHAR (48)     NOT NULL,
    [CreatedDate]              DATETIME2 (7) DEFAULT (getutcdate()) NOT NULL,
    [LastChangeDate]           DATETIME2 (7) DEFAULT (getutcdate()) NOT NULL,
    [LastLoginAttempt]         DATETIME2 (7) NULL,
    [LastLoginDate]            DATETIME2 (7) NULL,
    [FailedLoginAttemptsCount] TINYINT       DEFAULT ((0)) NOT NULL,
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);


GO

CREATE NONCLUSTERED INDEX [IX_UserDetails_UserId_User_Id]
    ON [dbo].[UserDetails]([UserId] ASC);


GO

