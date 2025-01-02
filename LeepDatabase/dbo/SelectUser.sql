
/* Select User */
CREATE   PROCEDURE [dbo].[SelectUser]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    /* start docs
    {
        "Description": "Select a user from the User table by ID",
        "Params": [
            { "Name": "@Id", "Type": "INT", "Default": null }
        ],
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
    WHERE u.Id = @Id AND u.IsArchived = 0;
END;

GO

