
-- UpdateAdmin procedure
CREATE   PROCEDURE UpdateAdmin
    @Id INT,
    @Email VARCHAR(320),
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Role TINYINT
AS
BEGIN
    /*start docs
    {
        "Description": "Updates an existing admin entry in the Admin table.",
        "Params": [
            { "Name": "@Id", "Type": "INT" },
            { "Name": "@Email", "Type": "VARCHAR(320)" },
            { "Name": "@Hash", "Type": "CHAR(64)" },
            { "Name": "@FirstName", "Type": "NVARCHAR(100)" },
            { "Name": "@LastName", "Type": "NVARCHAR(100)" },
            { "Name": "@Role", "Type": "TINYINT" }
        ],
        "Return": []
    }
    end docs */

    UPDATE AdminPanel.Admin
    SET 
        LastChangeDate = GETUTCDATE(),
        Email = @Email,
        FirstName = @FirstName,
        LastName = @LastName,
        [Role] = @Role
    WHERE Id = @Id;
END;

GO

