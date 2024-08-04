-- Profile Table CRUD Operations

/* Insert Profile */
CREATE   PROCEDURE [dbo].[InsertProfile]
    @UserId INT,
    @UserName NVARCHAR(50),
    @Handle NVARCHAR(50),
    @Description NVARCHAR(1000),
    @JobTitle NVARCHAR(100),
    @YearsOfExperience TINYINT,
    @BirthDate DATETIME2 = NULL,
    @Industry NVARCHAR(100) = NULL,
    @Company NVARCHAR(100) = NULL,
    @FoundedYear SMALLINT = NULL
AS
BEGIN

    /* start docs
    {
        "Description": "Insert a new record into the Profile table",
        "Params": [
            { "Name": "@UserId", "Type": "INT", "Default": null },
            { "Name": "@UserName", "Type": "NVARCHAR(50)", "Default": null },
            { "Name": "@Handle", "Type": "NVARCHAR(50)", "Default": null },
            { "Name": "@Description", "Type": "NVARCHAR(1000)", "Default": null },
            { "Name": "@JobTitle", "Type": "NVARCHAR(100)", "Default": null },
            { "Name": "@YearsOfExperience", "Type": "TINYINT", "Default": null },
            { "Name": "@BirthDate", "Type": "DATETIME2", "Default": "NULL" },
            { "Name": "@Industry", "Type": "NVARCHAR(100)", "Default": "NULL" },
            { "Name": "@Company", "Type": "NVARCHAR(100)", "Default": "NULL" },
            { "Name": "@FoundedYear", "Type": "SMALLINT", "Default": "NULL" }
        ],
        "Return": "None"
    }
    end docs */

    INSERT INTO [dbo].[Profile] (UserId, UserName, Handle, [Description], JobTitle, YearsOfExperience, BirthDate, Industry, Company, FoundedYear, IsArchived, IsActive, IsBlocked, IsSelected)
    VALUES (@UserId, @UserName, @Handle, @Description, @JobTitle, @YearsOfExperience, @BirthDate, @Industry, @Company, @FoundedYear, 0, 1, 0, 1);

    DECLARE @NewProfileId INT = SCOPE_IDENTITY();

    INSERT INTO [dbo].[ProfileDetails] (ProfileId) VALUES (@NewProfileId)
    INSERT INTO [dbo].[ProfileDisplay] (ProfileId, Handle, Username, [Description])
    VALUES (@NewProfileId, @Handle, @UserName, @Description)


END;

GO

