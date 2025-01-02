
/* Select Profile */
CREATE   PROCEDURE [dbo].[SelectProfile]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    /* start docs
    {
        "Description": "Select a record from the Profile table by Id",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null }
        ],
        "Return": [
            "Id",
            "UserId",
            "UserName",
            "Handle",
            "Description",
            "JobTitle",
            "YearsOfExperience",
            "BirthDate",
            "Industry",
            "Company",
            "FoundedYear",
            "IsActive",
            "IsBlocked",
            "IsSelected"
        ]
    }
    end docs */

    SELECT 
        p.Id,
        p.UserId,
        p.UserName,
        p.Handle,
        p.[Description],
        p.JobTitle,
        p.YearsOfExperience,
        p.BirthDate,
        p.Industry,
        p.Company,
        p.FoundedYear,
        p.IsArchived,
        p.IsActive,
        p.IsBlocked,
        p.IsSelected
    FROM [dbo].[Profile] p
    WHERE p.Id = @Id and p.IsArchived = 0;
END;

GO

