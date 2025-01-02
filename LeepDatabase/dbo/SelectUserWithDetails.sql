/* Select UserDetails */
CREATE   PROCEDURE [dbo].[SelectUserWithDetails]
    @UserId INT
AS
BEGIN
    SET NOCOUNT ON;

    /* start docs
    {
        "Description": "Selects a User and the their additonal details.",
        "Params": [
            { "Name": "@UserId", "Type": "INT", "Default": null }
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
            "IsBlocked",
            "UserId",
            "IsMale",
            "IsEmailVerified",
            "IsPhoneVerified",
            "Hash",
            "CreatedDate",
            "LastChangeDate",
            "LastLoginAttempt",
            "LastLoginDate",
            "FailedLoginAttemptsCount"
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
        u.IsBlocked,
        ud.UserId,
        ud.IsMale,
        ud.IsEmailVerified,
        ud.IsPhoneVerified,
        ud.Hash,
        ud.CreatedDate,
        ud.LastChangeDate,
        ud.LastLoginAttempt,
        ud.LastLoginDate,
        ud.FailedLoginAttemptsCount
    FROM [dbo].[User] u
    JOIN [dbo].[UserDetails] ud ON u.Id = ud.UserId
    WHERE ud.UserId = @UserId;
END;

GO

