
/* Select All Users, Unarchived*/
CREATE   PROCEDURE [dbo].[SelectAllUsers]
AS
BEGIN
    SET NOCOUNT ON;

    /* start docs
    {
        "Description": "Select all users from the User table that are not archived",
        "Params": [],
        "Return": [
            "Id",
            "FirstName",
            "LastName",
            "Email",
            "PhoneNumber",
            "Country",
            "City",
            "IsActive",
            "IsBlocked"
        ]
    }
    end docs */

    SELECT 
        u.Id,
        u.FirstName,
        u.LastName,
        u.Email,
        u.PhoneNumber,
        u.Country,
        u.City,
        u.IsActive,
        u.IsBlocked
    FROM [dbo].[User] u
    WHERE u.IsArchived = 0;
END;

GO

