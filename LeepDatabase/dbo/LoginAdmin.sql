
CREATE   PROCEDURE LoginAdmin
    @Email VARCHAR(320),
    @Hash CHAR(48)
AS
BEGIN
    /*start docs
    {
        "Description": "Admin Login.",
        "Params": [
            { "Name": "@Email", "Type": "VARCHAR(320)" },
            { "Name": "@Hash", "Type": "CHAR(64)" },
        ],
        "Return": [
            "Id",
            "CreatedDate",
            "LastChangeDate",
            "Email",
            "[Role]",
            "FirstName",
            "LastName"
        ]
    }
    end docs */

    SET NOCOUNT ON;

    SELECT 
        Id,
        CreatedDate,
        LastChangeDate,
        Email,
        [Role],
        FirstName,
        LastName
    FROM AdminPanel.Admin 
    WHERE Email = @Email and [Hash] = @Hash;
END;

GO

