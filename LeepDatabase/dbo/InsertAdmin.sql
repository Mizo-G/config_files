CREATE   PROCEDURE InsertAdmin
    @Email VARCHAR(320),
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Role TINYINT
AS
BEGIN
    /*start docs
    {
        "Description": "Inserts a new admin entry into the Admin table.",
        "Params": [
            { "Name": "@Email", "Type": "VARCHAR(320)" },
            { "Name": "@FirstName", "Type": "NVARCHAR(100)" },
            { "Name": "@LastName", "Type": "NVARCHAR(100)" },
            { "Name": "@Role", "Type": "TINYINT" }
        ],
        "Return": [""]
    }
    end docs */

    INSERT INTO AdminPanel.Admin (
        CreatedDate,
        LastChangeDate,
        Email,
        [Role],
        FirstName,
        LastName
    )
    VALUES (
        GETUTCDATE(),
        GETUTCDATE(),
        @Email,
        @Role,
        @FirstName,
        @LastName
    );
    SELECT SCOPE_IDENTITY() as NewAdminId;
END;

GO

