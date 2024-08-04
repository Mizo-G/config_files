
-- ProfileDetails Table Operations

/* Select Profile with Details */
CREATE   PROCEDURE [dbo].[SelectProfileWithDetails]
    @ProfileId INT
AS
BEGIN
    SET NOCOUNT ON;

    /* start docs
    {
        "Description": "Select a Profile with associated ProfileDetails",
        "Params": [
            { "Name": "@ProfileId", "Type": "INT", "Default": null }
        ],
        "Return": [
            "Profile.Id",
            "Profile.UserId",
            "Profile.UserName",
            "Profile.Handle",
            "Profile.Description",
            "Profile.JobTitle",
            "Profile.YearsOfExperience",
            "Profile.BirthDate",
            "Profile.Industry",
            "Profile.Company",
            "Profile.FoundedYear",
            "Profile.IsArchived",
            "Profile.IsActive",
            "Profile.IsBlocked",
            "Profile.IsSelected",
            "ProfileDetails.CreatedDate",
            "ProfileDetails.LastChangeDate"
        ]
    }
    end docs */

    SELECT 
        p.Id AS ProfileId,
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
        p.IsSelected,
        pd.CreatedDate,
        pd.LastChangeDate
    FROM [dbo].[Profile] p
    INNER JOIN [dbo].[ProfileDetails] pd ON p.Id = pd.ProfileId
    WHERE p.Id = @ProfileId and p.IsArchived = 0;
END;

GO

