
/* Update Profile */
CREATE   PROCEDURE [dbo].[UpdateProfile]
    @Id INT,
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
        "Description": "Update an existing record in the Profile table",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null },
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

    UPDATE [dbo].[Profile]
    SET UserName = @UserName,
        Handle = @Handle,
        [Description] = @Description,
        JobTitle = @JobTitle,
        YearsOfExperience = @YearsOfExperience,
        BirthDate = @BirthDate,
        Industry = @Industry,
        Company = @Company,
        FoundedYear = @FoundedYear
    WHERE Id = @Id;
END;

GO

